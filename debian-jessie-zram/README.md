debian-jessie-zram
==================
Summary: Debian Jessie amd64/i386 with zram overlay; image size ~62 MiB.

This is a proof of concept [`rib`][1] build profile for Debian Jessie, designed
to enable a read-write zram overlay on top of the read-only squashfs
filesystem. If the system needs to write a significant amount of non-persistent
data, the zram approach can be a viable alternative to maintaining a
`/tmp`-like delete-on-boot approach on persistent storage. An example of such
data is installed packages that are brought in by configuration management, and
are prone to eating quite a lot of data in `/usr`. While packages could be
installed at the image build stage, it may be desirable to keep the base image
as generic as possibel, and let configuration management take care of
customizations on every boot.

A word of warning: This build profile uses most of the build scripts from the
[`debian-jessie-split`][2] profile, and inherits all of its complexity and
portability challenges.

Features:

* Same basic build process as the 'split' profile.

* A `rib.rdtype=type` kernel parameter that supports type `tmpfs` (default) and
`zram`.

Dependencies: `fakechroot`, `fakeroot`, `debootstrap`, `mksquashfs` (in package
`squashfs-tools` in Debian/Ubuntu).

Simple customizations are possible by adding an early build script that sets
various environment variables like `RIB_DEB_SUITE`, `RIB_DEB_MIRROR` and
`RIB_DEB_DEBOOTSTRAP_OPTS` before debootstrap is run.

Build with `rib build -v`; test with qemu:
```sh
qemu-system-x86_64 -nographic -m 512M \
  -append "console=ttyS0 rib.squashfs_url=http://.../rootfs.squashfs rib.rdtype=zram" \
  -kernel vmlinuz-* -initrd initrd-*.cpio.xz
```

[1]: https://github.com/sveniu/rib/
[2]: https://github.com/sveniu/rib-examples/blob/master/debian-jessie-split/
