# Provision lightweight development environments

The term _lightweight development environment_ means an environment configured with minimal GUI support and a text editor rather than IDEs. It is for developers who prefer working on the command line. 

A _base_ instance provides a template for provisioning environments tailored for different kinds of development and testing work. 

## The general idea 

![illustration of the idea](images/environments.png)

## How to build a base instance from...

- [Linux: CentOS 7](http://github.com/neopragma/bootstrap-centos-7-dev-base) - Fedora style
- [Linux: Debian 9](http://github.com/neopragma/bootstrap-debian-9-dev-base) - Debian style
- [Linux: Manjaro](http://github.com/neopragma/bootstrap-manjaro-dev-base) - Arch style
- [Linux: Ubuntu 16.04 LTS](http://github.com/neopragma/bootstrap-ubuntu-server-16.04-dev-base) - Ubuntu style
- Linux: Raspberry Pi: Raspbian Jessie (TBD)
- [Unix: TrueOS Desktop](http://github.com/neopragma/bootstrap-trueos-freebsd-dev-base) - FreeBSD style

For most purposes, the instance will be usable as a 512 MB VM, and can be containerized or loaded onto a small computer such as a Raspberry Pi. The instance can run with any [hypervisor](hypervisor.md).

## Why the different options?

Individuals have preferences regarding the underlying operating system, even if the command line, common system commands, general behavior of Unix/Linux systems, functionality of Vim and NeoVim, and available packages are all essentially the same. It may be that you are accustomed to a certain package manager or directory structure conventions or whatever, and you want your lightweight development environment to be consistent with your other systems. With that in mind, I tried to find practical ways to stand up a usable lightweight environment using a variety of distros as starting points. 

## Notes

- [Common configuration](common-configuration.md)
- [NeoVim configuration](neovim-configuration.md)
- [Watch progress of bootstrap script](watch-bootstrap.md)
- [Why do this? The backstory](backstory.md)
- [Command-line and keyboard orientation](keyboard-centric.md)
- [Choosing a distro as a base](choosing-distro.md)
- [Failed attempts](failures.md)

## References

- [Information about hardware and hypervisors](references.md)







