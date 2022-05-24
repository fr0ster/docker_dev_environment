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

## included software

- [pwntools](https://github.com/Gallopsled/pwntools)  —— CTF framework and exploit development library
- [pwndbg](https://github.com/pwndbg/pwndbg)  —— a GDB plug-in that makes debugging with GDB suck less, with a focus on features needed by low-level software developers, hardware hackers, reverse-engineers and exploit developers
- [pwngdb](https://github.com/scwuaptx/Pwngdb) —— gdb for pwn
- [ROPgadget](https://github.com/JonathanSalwan/ROPgadget)  —— facilitate ROP exploitation tool
- [roputils](https://github.com/inaz2/roputils) 	—— A Return-oriented Programming toolkit
- [one_gadget](https://github.com/david942j/one_gadget) —— A searching one-gadget of execve('/bin/sh', NULL, NULL) tool for amd64 and i386
- [angr](https://github.com/angr/angr)   ——  A platform-agnostic binary analysis framework
- [radare2](https://github.com/radare/radare2) ——  A rewrite from scratch of radare in order to provide a set of libraries and tools to work with binary files
- [seccomp-tools](https://github.com/david942j/seccomp-tools) —— Provide powerful tools for seccomp analysis
- [tmux](https://tmux.github.io/) 	—— a terminal multiplexer
- [ltrace](https://linux.die.net/man/1/ltrace)      —— trace library function call
- [strace](https://linux.die.net/man/1/strace)     —— trace system call
- [frida](https://frida.re)     —— Dynamic instrumentation toolkit for developers, reverse-engineers, and security researchers.

## Using

### Image building

amd64, Ubuntu, latest version, radare2 5.6.8 (default version)
```
make build
```
amd64, Debian, latest latest, radare2 5.6.8 (default version)
```
OS=Debian make build
```
amd64, Ubuntu, 18.04, radare2 5.6.8 (default version)
```
VERSION=18.04 make build
```
amd64, Debian, 9.0, radare2 5.6.8 (default version)
```
OS=Debian VERSION=9.0 make build
```
i386, Ubuntu, latest version, radare2 5.6.8 (default version)
```
ARCH=i386 make build
```
i386, Debian, latest latest, radare2 5.6.8 (default version)
```
ARCH=i386 OS=Debian make build, radare2 5.6.8
```
i386, Ubuntu, 18.04, radare2 5.6.8 (default version)
```
ARCH=i386 VERSION=18.04 make build
```
i386, Debian, 9.0, radare2 5.6.8 (default version)
```
ARCH=i386 OS=Debian VERSION=9.0 make build
```

### Container running

#### From project folder

amd64, Ubuntu, latest version, radare2 5.6.8 (default version)
```
make run
```
amd64, Debian, latest latest, radare2 5.6.8 (default version)
```
OS=Debian make run
```
amd64, Ubuntu, 18.04, radare2 5.6.8 (default version)
```
VERSION=18.04 make run
```
amd64, Debian, 9.0, radare2 5.6.8 (default version)
```
OS=Debian VERSION=9.0 make run
```
i386, Ubuntu, latest version, radare2 5.6.8 (default version)
```
ARCH=i386 make run
```
i386, Debian, latest latest, radare2 5.6.8 (default version)
```
ARCH=i386 OS=Debian make run
```
i386, Ubuntu, 18.04, radare2 5.6.8 (default version)
```
ARCH=i386 VERSION=18.04 make run
```
i386, Debian, 9.0, radare2 5.6.8 (default version)
```
ARCH=i386 OS=Debian VERSION=9.0 make run
```

#### By docker

amd64, Ubuntu, latest version, radare2 5.6.8 (default version)
```
docker run --rm -v $(pwd)/test:/work_dir --network=host -it luckycatalex/dev_environment:amd64-ubuntu-latest-5.6.8
```
amd64, Debian, latest latest, radare2 5.6.8 (default version)
```
docker run --rm -v $(pwd)/test:/work_dir --network=host -it luckycatalex/dev_environment:amd64-debian-latest-5.6.8
```
amd64, Ubuntu, 18.04, radare2 5.6.8 (default version)
```
docker run --rm -v $(pwd)/test:/work_dir --network=host -it luckycatalex/dev_environment:amd64-ubuntu-18.04-5.6.8
```
amd64, Debian, 9.0, radare2 5.6.8 (default version)
```
docker run --rm -v $(pwd)/test:/work_dir --network=host -it luckycatalex/dev_environment:amd64-debian-9.0-5.6.8
```
i386, Ubuntu, latest version, radare2 5.6.8 (default version)
```
docker run --rm -v $(pwd)/test:/work_dir --network=host -it luckycatalex/dev_environment:i386-ubuntu-latest-5.6.8
```
i386, Debian, latest latest, radare2 5.6.8 (default version)
```
docker run --rm -v $(pwd)/test:/work_dir --network=host -it luckycatalex/dev_environment:i386-debian-latest-5.6.8
```
i386, Ubuntu, 18.04, radare2 5.6.8 (default version)
```
docker run --rm -v $(pwd)/test:/work_dir --network=host -it luckycatalex/dev_environment:i386-ubuntu-18.04-5.6.8
```
i386, Debian, 9.0, radare2 5.6.8 (default version)
```
docker run --rm -v $(pwd)/test:/work_dir --network=host -it luckycatalex/dev_environment:i386-debian-9.0-5.6.8
```

## Changelog

2002.05.24 - Was added frida, frida-tools for python and r2frida plugin
