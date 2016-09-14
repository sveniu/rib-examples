debian-jessie-simple
====================
Summary: Debian Jessie amd64/i386 standard; image size 164 MiB.

This is a proof of concept [`rib`][1] build profile for Debian Jessie,
primarily designed to fully explain the process of building a complete image
from scratch. The build outputs a `vmlinuz` kernel and an `initrd` image that
embeds the entire Debian Jessie root filesystem in a squashfs image. These two
files can be easily booted by qemu or over the network. The root filesystem is
kept as vanilla as possible, with only a minimal amount of required changes.

Features:

* A completely unrestricted, standard Debian install, where you can log in and
run any command, install any package, etc.

* Lots of comments that explain every step of the process.

* The final initrd size, which includes the squashfs root image, is 164 MiB.
NOTE: While such a size is already manageable, it is fairly straight-forward to
remove nonessential files from the root filesystem, reducing it to around half
the size. See other examples.

* Uses ~225 MiB memory after boot-up. In other words, a system with 512 MiB
memory is left with 287 MiB of available memory after the boot process
completes. This free space is used by normal programs, but also by changing
or adding new files in the filesystem due to the tmpfs aufs overlay on top of
the read-only squashfs image.

Build with `rib build -v`; test with qemu:
```sh
qemu-system-x86_64 -nographic -m 512M -append "console=ttyS0" \
  -kernel vmlinuz-3.16.0-4-amd64 -initrd initrd-3.16.0-4-amd64.cpio.gz
```

[1]: https://github.com/sveniu/rib/
