package chrootarchive // import "github.com/docker/docker/pkg/chrootarchive"

import (
	"fmt"
	"io"
	"io/ioutil"
	"net"
	"os"
	"os/user"
	"path/filepath"

	"github.com/docker/docker/pkg/archive"
	"github.com/docker/docker/pkg/idtools"
)

func init() {
	// initialize nss libraries in Glibc so that the dynamic libraries are loaded in the host
	// environment not in the chroot from untrusted files.
	_, _ = user.Lookup("docker")
	_, _ = net.LookupHost("localhost")
}

// NewArchiver returns a new Archiver which uses chrootarchive.Untar
func NewArchiver(idMapping *idtools.IdentityMapping) *archive.Archiver {
	if idMapping == nil {
		idMapping = &idtools.IdentityMapping{}
	}
	return &archive.Archiver{
		Untar:     Untar,
		IDMapping: idMapping,
	}
}

// Untar reads a stream of bytes from `archive`, parses it as a tar archive,
// and unpacks it into the directory at `dest`.
// The archive may be compressed with one of the following algorithms:
//  identity (uncompressed), gzip, bzip2, xz.

// 解压压缩包tarArchive到dest内，压缩包支持的算法有一致性算法/identity（未解压情况), gzip, bzip2, xz.
func Untar(tarArchive io.Reader, dest string, options *archive.TarOptions) error {
	return untarHandler(tarArchive, dest, options, true, dest)
}

// UntarWithRoot is the same as `Untar`, but allows you to pass in a root directory
// The root directory is the directory that will be chrooted to.
// `dest` must be a path within `root`, if it is not an error will be returned.
//
// `root` should set to a directory which is not controlled by any potentially
// malicious(恶意的) process.
//
// This should be used to prevent a potential attacker from manipulating `dest`
// such that it would provide access to files outside of `dest` through things
// like symlinks. Normally `ResolveSymlinksInScope` would handle this, however
// sanitizing(清洁消毒，清除不良影响) symlinks in this manner is inherrently(固有的/本质上的) racey(多余/不合理的):
// ref: CVE-2018-15664

// chroot作用：更改root目录。在linux系统当中，系统默认的目录结构都是"/",即是以根(root)开始的。而在使用chroot之后，可以将指定目录作为系统的根目录
// eg.
// cd /home/
// chroot .
// pwd # 结果为/，即将/home目录作为了系统的新的根目录
// 通过这种方式，可以避免恶意程序通过软链接方式访问到dest以外的文件系统而造成潜在的攻击
// ref: https://www.ibm.com/developerworks/cn/linux/l-cn-chroot/index.html
func UntarWithRoot(tarArchive io.Reader, dest string, options *archive.TarOptions, root string) error {
	return untarHandler(tarArchive, dest, options, true, root)
}

// UntarUncompressed reads a stream of bytes from `archive`, parses it as a tar archive,
// and unpacks it into the directory at `dest`.
// The archive must be an uncompressed stream.
func UntarUncompressed(tarArchive io.Reader, dest string, options *archive.TarOptions) error {
	return untarHandler(tarArchive, dest, options, false, dest)
}

// Handler for teasing out the automatic decompression

// 用于套取自动化解压的处理程序
func untarHandler(tarArchive io.Reader, dest string, options *archive.TarOptions, decompress bool, root string) error {
	if tarArchive == nil {
		return fmt.Errorf("Empty archive")
	}
	if options == nil {
		options = &archive.TarOptions{}
	}
	if options.ExcludePatterns == nil {
		options.ExcludePatterns = []string{}
	}

	idMapping := idtools.NewIDMappingsFromMaps(options.UIDMaps, options.GIDMaps)
	rootIDs := idMapping.RootPair()

	dest = filepath.Clean(dest)
	if _, err := os.Stat(dest); os.IsNotExist(err) {
		if err := idtools.MkdirAllAndChownNew(dest, 0755, rootIDs); err != nil {
			return err
		}
	}

	r := ioutil.NopCloser(tarArchive)
	if decompress {
		decompressedArchive, err := archive.DecompressStream(tarArchive)
		if err != nil {
			return err
		}
		defer decompressedArchive.Close()
		r = decompressedArchive
	}

	return invokeUnpack(r, dest, options, root)
}

// Tar tars the requested path while chrooted to the specified root.
func Tar(srcPath string, options *archive.TarOptions, root string) (io.ReadCloser, error) {
	if options == nil {
		options = &archive.TarOptions{}
	}
	return invokePack(srcPath, options, root)
}
