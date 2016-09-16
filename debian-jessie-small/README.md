debian-jessie-simple
====================
Summary: Small Debian Jessie amd64/i386 standard; image size ~62 MiB.

This is a proof of concept [`rib`][1] build profile for Debian Jessie, designed
to be comfortably small.

Features:

* A fairly vanilla Debian install; several non-essential files are removed to
preserve space.

* The final initrd size, which includes the squashfs root image, is 62 MiB.

* Uses ~128 MiB memory after boot-up. In other words, a system with 512 MiB
memory is left with ~384 MiB of available memory after the boot process
completes.

* A simple init that supports both overlayfs and aufs. You can override the
auto detection by setting the kernel command line parameter `rib.overlay` to
either `overlayfs` or `aufs`. It also supports `rib.debug=1`, which will give
you a shell during the init phase.

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
