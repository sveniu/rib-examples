Examples for the Root Image Build tool
======================================
[`rib`][1] is a simple tool that makes it easy to build Linux root and initrd
images for network or container booting. Put your build scripts in a folder,
and `rib` will execute them in order, with flags that activate wrappers like
fakeroot, [fakechroot][2] and chroot. `rib` always runs as a normal user.

These are example build profiles for some common use cases. Each profile comes
with an informative README file describing its features and dependencies.

* `debian-jessie-simple`: A standard Debian Jessie image. The simplicity refers
to how the build profile is kept as simple and informational as possible. It is
a good idea to read through all the build scripts to understand what's
happening.

* `debian-jessie-small`: A small ~62 MiB Debian Jessie image. Most of the build
scripts are symlinks to the simple example above.

* `debian-jessie-split`: Like the small profile, but the squashfs image is kept
separate from the initrd. The init script supports networking and fetching of
the squashfs image.

[1]: https://github.com/sveniu/rib/
[2]: https://github.com/dex4er/fakechroot/


License
-------
See `COPYING`.
