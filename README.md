# Provision lightweight development environments

Note: This isn't ready yet. Don't use it.

A _base_ instance provides a template for provisioning environments tailored for different kinds of development and testing work. 

The term _lightweight development environment_ means an environment configured with minimal GUI support and a text editor rather than IDEs. It is for developers who prefer working on the command line _and_ who don't need a specialized IDE for a particular platform (Arduino, R, zOS) or to work with a language that benefits greatly from an IDE (Java, Groovy). 

For most purposes, the instance will be usable as a 512 MB VM, and can be containerized or loaded onto a small computer such as a Raspberry Pi. 

- [Create base (template) instances](base-general.md)
- How to build a base instance for...
- - [Linux: Debian 9 Jessie](in-development.md)
- - [Linux: Gentoo](in-development.md)
- - [Linux: Ubuntu 16.04 LTS](http://github.com/neopragma/bootstrap-ubuntu-server-16.04-dev-base)
- - [Linux: Raspberry Pi: Raspbian Jessie](in-development.md)
- [Common configuration](common-configuration.md)
- [NeoVim configuration](neovim-configuration.md)

## The general idea 

![illustration of the idea](images/environments.png)
