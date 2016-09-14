Examples for the Root Image Build tool
======================================
[`rib`][1] is a simple tool that makes it easy to build Linux root and initrd
images for network or container booting. Put your build scripts in a folder,
and `rib` will execute them in order, with flags that activate wrappers like
fakeroot, [fakechroot][1] and chroot. `rib` always runs as a normal user.

These are example build profiles for some common use cases. Each profile comes
with an informative README file describing its features and dependencies.

[1]: https://github.com/sveniu/rib/


License
-------
See `COPYING`.
