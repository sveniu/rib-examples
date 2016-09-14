Examples for the Root Image Build tool
======================================
[`rib`][1] is a simple tool that makes it easy to build Linux root and initrd
images for network or container booting. Put your build scripts in a folder,
and `rib` will execute them in order, with flags that activate wrappers like
fakeroot, [fakechroot][1] and chroot. `rib` always runs as a normal user.

These are example build profiles for some common use cases. Each profile comes
with an informative README file describing its features and dependencies.

* `debian-jessie-simple`: A standard Debian Jessie image. The simplicity refers
to how the build profile is kept as simple and informational as possible. It is
a good idea to read through all the build scripts to understand what's
happening.

[1]: https://github.com/sveniu/rib/


License
-------
See `COPYING`.
