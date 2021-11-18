## btfhub-tools

This repository is meant to be used together with:

- https://github.com/aquasecurity/btfhub

You may consider it as a spin off of the original btfhub repository tools,
scripts and binaries. The idea behind this is that, since we're maintaining
full BTF files to each supported kernel within that repository, we wanted to
split the tooling versioning so one could always have latest BTF files archive
(with latest kernel BTF files added) and, yet, use an older version of the
tooling.

### Generating Tailored (to one or multiple eBPF objects) BTF Files

1. Copy the contents of https://github.com/aquasecurity/btfhub/tree/main/archive into ./archive/ directory

2. Execute:

```
./tools/newbtfgen.sh -a $(uname -m) -o $HOME/files/one.bpf.o

...
SBTF: ./5.4.0-58-generic.btf
OBJ : /home/rafaeldtinoco/files/one.bpf.o
DBTF: ./custom-archive/ubuntu/18.04/x86_64/5.4.0-58-generic.btf
SBTF: ./5.4.0-66-generic.btf
OBJ : /home/rafaeldtinoco/files/one.bpf.o
DBTF: ./custom-archive/ubuntu/18.04/x86_64/5.4.0-66-generic.btf
SBTF: ./5.4.0-1034-azure.btf
OBJ : /home/rafaeldtinoco/files/one.bpf.o
DBTF: ./custom-archive/ubuntu/18.04/x86_64/5.4.0-1034-azure.btf
SBTF: ./5.4.0-47-generic.btf
OBJ : /home/rafaeldtinoco/files/one.bpf.o
DBTF: ./custom-archive/ubuntu/18.04/x86_64/5.4.0-47-generic.btf
SBTF: ./5.4.0-86-generic.btf
OBJ : /home/rafaeldtinoco/files/one.bpf.o
DBTF: ./custom-archive/ubuntu/18.04/x86_64/5.4.0-86-generic.btf
SBTF: ./5.4.0-1043-azure.btf
OBJ : /home/rafaeldtinoco/files/one.bpf.o
DBTF: ./custom-archive/ubuntu/18.04/x86_64/5.4.0-1043-azure.btf

...
```

3. Check ./custom-archive/ for the generated BTF files.

### Updating the main [BTFHub](https://github.com/aquasecurity/btfhub) repository.

1. Copy the contents of https://github.com/aquasecurity/btfhub/tree/main/archive into ./archive/ directory

2. Execute :

```
$ for distro in fedora29 fedora30 fedora31 fedora32 fedora33 fedora34 centos7 centos8 bionic focal; do ./tools/update.sh $distro; done

INFO: downloading https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/29/Everything/x86_64/debug/tree/Packages/k/ information
INFO: downloading https://archives.fedoraproject.org/pub/archive/fedora/linux/updates/29/Everything/x86_64/debug/Packages/k/ information
URL: https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/29/Everything/x86_64/debug/tree/Packages/k/kernel-debuginfo-4.18.16-300.fc29.x86_64.rpm
FILENAME: kernel-debuginfo-4.18.16-300.fc29.x86_64.rpm
VERSION: 4.18.16-300.fc29.x86_64
INFO: file 4.18.16-300.fc29.x86_64.btf already exists
URL: https://archives.fedoraproject.org/pub/archive/fedora/linux/updates/29/Everything/x86_64/debug/Packages/k/kernel-debuginfo-5.3.11-100.fc29.x86_64.rpm
FILENAME: kernel-debuginfo-5.3.11-100.fc29.x86_64.rpm
VERSION: 5.3.11-100.fc29.x86_64
INFO: file 5.3.11-100.fc29.x86_64.btf already exists
INFO: downloading https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/29/Everything/aarch64/debug/tree/Packages/k/ information
INFO: downloading https://archives.fedoraproject.org/pub/archive/fedora/linux/updates/29/Everything/aarch64/debug/Packages/k/ information

...
```

3. Copy the new generated BTF files to BTFHub repository and commit them.
