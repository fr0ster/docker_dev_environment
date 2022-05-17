# Dockerized development environment

## General information

This project helps create Linux userspace development environment in docker contaner.
For image building you can use make command.
You can choose:
base OS (Ubuntu or Debian),
architecture (amd64/i386),
version of base OS(for Ubuntu - 18.04/20.04/22.04/...)
Pay attention not all combination will work well.
It depends from availability of suitable base image.

On base image are installed radare2+r2ghidra, pwndbg, pwntools.
If full image for needed OS+architecture+version couldn't be compiled, you can use light image, whicn has base software + gdbserver only.

Pay attention, debugging works for amd64/i386 only, for ather architectires wors only statical disassembling.

## Using

### Image building

amd64, Ubuntu, latest version
```make run```
amd64, Debian, latest latest
```OS=Debian make build```
amd64, Ubuntu, 18.04
```VERSION=18.04 make build```
i386, Ubuntu, latest version
```ARCH=i386 make run```
i386, Debian, latest latest
```ARCH=i386 OS=Debian make build```
i386, Ubuntu, 18.04
```ARCH=i386 VERSION=18.04 make build```
