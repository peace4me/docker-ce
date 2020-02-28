module github.com/docker/docker

go 1.12

require (
	cloud.google.com/go v0.26.0
	code.cloudfoundry.org/clock v1.0.0 // indirect
	github.com/Azure/go-ansiterm v0.0.0-20170929234023-d6e3b3328b78
	github.com/BurntSushi/toml v0.3.1
	github.com/Graylog2/go-gelf v0.0.0-20171211094031-414364622654
	github.com/Microsoft/go-winio v0.4.15-0.20190919025122-fc70bd9a86b5
	github.com/Microsoft/hcsshim v0.8.7
	github.com/Microsoft/opengcs v0.0.0-20190304234800-a10967154e14
	github.com/RackSec/srslog v0.0.0-20180709174129-a4725f04ec91
	github.com/armon/go-metrics v0.0.0-20150106224455-eb0af217e5e9 // indirect
	github.com/aws/aws-sdk-go v1.12.66
	github.com/beorn7/perks v0.0.0-20190414131216-e7f67b54abbe // indirect
	github.com/bsphere/le_go v0.0.0-20170215134836-7a984a84b549
	github.com/cloudflare/cfssl v0.0.0-20180323000720-5d63dbd981b5
	github.com/containerd/cgroups v0.0.0-20191011165608-5fbad35c2a7e
	github.com/containerd/containerd v1.3.0-beta.2.0.20190828155532-0293cbd26c69
	github.com/containerd/continuity v0.0.0-20190827140505-75bee3e2ccb6
	github.com/containerd/fifo v0.0.0-20190226154929-a9fb20d87448
	github.com/containerd/ttrpc v0.0.0-20190828172938-92c8520ef9f8 // indirect
	github.com/containerd/typeurl v0.0.0-20190228175220-2a93cfde8c20
	github.com/coreos/etcd v3.3.12+incompatible // indirect
	github.com/coreos/go-semver v0.2.0 // indirect
	github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e
	github.com/coreos/pkg v0.0.0-20160727233714-3ac0863d7acf // indirect
	github.com/creack/pty v1.1.7
	github.com/deckarep/golang-set v0.0.0-20141123011944-ef32fa3046d9 // indirect
	github.com/docker/distribution v2.7.1-0.20190205005809-0d3efadf0154+incompatible
	github.com/docker/go-connections v0.4.0
	github.com/docker/go-metrics v0.0.0-20170502235133-d466d4f6fd96
	github.com/docker/go-units v0.4.0
	github.com/docker/libkv v0.0.0-20180912205406-458977154600
	github.com/docker/libnetwork v0.8.0-dev.2.0.20190604151032-3c26b4e7495e
	github.com/docker/libtrust v0.0.0-20150526203908-9cbd2a1374f4
	github.com/docker/swarmkit v0.0.0-20200129163240-062b694b46c0
	github.com/fernet/fernet-go v0.0.0-20151007213151-1b2437bc582b // indirect
	github.com/fluent/fluent-logger-golang v1.4.0
	github.com/fsnotify/fsnotify v1.4.7
	github.com/go-ini/ini v1.25.4 // indirect
	github.com/gogo/googleapis v1.2.0 // indirect
	github.com/gogo/protobuf v1.2.1
	github.com/golang/gddo v0.0.0-20180130204405-9b12a26f3fbd
	github.com/google/certificate-transparency-go v1.0.20 // indirect
	github.com/google/go-cmp v0.3.0
	github.com/google/uuid v1.1.1
	github.com/googleapis/gax-go v2.0.0+incompatible // indirect
	github.com/gorilla/mux v1.7.2
	github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0 // indirect
	github.com/hashicorp/consul v0.5.2 // indirect
	github.com/hashicorp/go-immutable-radix v1.0.0
	github.com/hashicorp/go-memdb v0.0.0-20161216180745-cb9a474f84cc
	github.com/hashicorp/go-msgpack v0.0.0-20140221154404-71c2886f5a67 // indirect
	github.com/hashicorp/go-sockaddr v1.0.2 // indirect
	github.com/hashicorp/memberlist v0.0.0-20171201184301-3d8438da9589 // indirect
	github.com/hashicorp/serf v0.0.0-20160317193612-598c54895cc5 // indirect
	github.com/imdario/mergo v0.3.7
	github.com/inconshreveable/mousetrap v1.0.0 // indirect
	github.com/ishidawataru/sctp v0.0.0-20180918013207-6e2cb1366111 // indirect
	github.com/jmespath/go-jmespath v0.0.0-20160202185014-0b12d6b521d8 // indirect
	github.com/konsorten/go-windows-terminal-sequences v1.0.2 // indirect
	github.com/mattn/go-shellwords v1.0.5
	github.com/matttproud/golang_protobuf_extensions v1.0.1 // indirect
	github.com/miekg/dns v1.0.7 // indirect
	github.com/mistifyio/go-zfs v0.0.0-20190413222219-f784269be439
	github.com/moby/buildkit v0.0.0-20200131050553-57e8ad52170d
	github.com/morikuni/aec v1.0.0
	github.com/opencontainers/go-digest v1.0.0-rc1
	github.com/opencontainers/image-spec v1.0.1
	github.com/opencontainers/runc v1.0.0-rc8
	github.com/opencontainers/runtime-spec v0.1.2-0.20190507144316-5b71a03e2700
	github.com/opencontainers/selinux v0.0.0-20190929122143-5215b1806f52
	github.com/philhofer/fwd v1.0.0 // indirect
	github.com/pkg/errors v0.8.1
	github.com/prometheus/client_golang v0.8.0
	github.com/prometheus/client_model v0.0.0-20170216185247-6f3806018612 // indirect
	github.com/prometheus/common v0.0.0-20180518154759-7600349dcfe1 // indirect
	github.com/samuel/go-zookeeper v0.0.0-20150415181332-d0e0d8e11f31 // indirect
	github.com/sean-/seed v0.0.0-20170313163322-e2103e2c3529 // indirect
	github.com/seccomp/libseccomp-golang v0.0.0-20160531183505-32f571b70023
	github.com/sirupsen/logrus v1.4.1
	github.com/spf13/cobra v0.0.3
	github.com/spf13/pflag v1.0.3
	github.com/syndtr/gocapability v0.0.0-20180916011248-d98352740cb2
	github.com/tchap/go-patricia v2.3.0+incompatible
	github.com/tinylib/msgp v1.1.0 // indirect
	github.com/tonistiigi/fsutil v0.0.0-20200128191323-6c909ab392c1
	github.com/ugorji/go v1.1.1 // indirect
	github.com/vbatts/tar-split v0.11.1
	github.com/vishvananda/netlink v1.0.0
	github.com/vishvananda/netns v0.0.0-20190625233234-7109fa855b0f // indirect
	go.etcd.io/bbolt v1.3.3
	golang.org/x/crypto v0.0.0-20200128174031-69ecbb4d6d5d // indirect
	golang.org/x/net v0.0.0-20190522155817-f3200d17e092
	golang.org/x/sync v0.0.0-20190423024810-112230192c58
	golang.org/x/sys v0.0.0-20190916202348-b4ddaad3f8a3
	golang.org/x/time v0.0.0-20180412165947-fbb02b2291d2
	google.golang.org/api v0.0.0-20180530150455-de943baf05a0 // indirect
	google.golang.org/genproto v0.0.0-20190425155659-357c62f0e4bb
	google.golang.org/grpc v1.23.0
	gotest.tools v2.2.0+incompatible
)
