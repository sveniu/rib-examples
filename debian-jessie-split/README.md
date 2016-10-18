debian-jessie-split
===================
Summary: Debian Jessie amd64/i386 with separate squashfs; image size ~62 MiB.

This is a proof of concept [`rib`][1] build profile for Debian Jessie, designed
to keep the squashfs image separate from the initrd. The idea is to reduce the
download size at the PXE stage by only fetching the kernel and a relatively
small initrd (~5 MiB). The init stage will then fetch the squashfs image and
continue as usual.

A word of warning: There is quite a lot of complexity and portability
challenges introduced into the initrd image to make it capable of networking,
DNS, running curl, etc. Therefore, this approach should only be used as
a fallback option to downloading the full initrd (containing the squashfs
image) at the PXE stage.

Features:

* Same basic build process as the `debian-jessie-small` profile.

* A more complex init that supports networking. Kernel modules for network
cards are put into the initrd image in [`85-R-initrd`][2], and are loaded by
scanning the PCI bus in the [`init`][3] script.

* Network interfaces are configured in turn by using DHCP. There's currently no
facility in place to override this.

* The build process can include dynamic executables and libraries, to support
tools like curl.

* The squashfs image URL is specified via the `rib.squashfs_url` kernel
parameter.

Dependencies: `fakechroot`, `fakeroot`, `debootstrap`, `mksquashfs` (in package
`squashfs-tools` in Debian/Ubuntu).

Simple customizations are possible by adding an early build script that sets
various environment variables like `RIB_DEB_SUITE`, `RIB_DEB_MIRROR` and
`RIB_DEB_DEBOOTSTRAP_OPTS` before debootstrap is run.

Build with `rib build -v`; test with qemu:
```sh
qemu-system-x86_64 -nographic -m 512M -append "console=ttyS0" \
  -kernel vmlinuz-3.16.0-4-amd64 -initrd initrd-3.16.0-4-amd64.cpio.gz
```

[1]: https://github.com/sveniu/rib/
[2]: https://github.com/sveniu/rib-examples/blob/master/debian-jessie-split/build.d/85-R-initrd
[3]: https://github.com/sveniu/rib-examples/blob/master/debian-jessie-split/files/init
