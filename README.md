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

## Why the different options?

Individuals have preferences regarding the underlying operating system, even if the command line, common system commands, general behavior of Unix/Linux systems, functionality of Vim and NeoVim, and available packages are all essentially the same. It may be that you are accustomed to a certain package manager or directory structure conventions or whatever, and you want your lightweight development environment to be consistent with your other systems. With that in mind, I tried to find practical ways to stand up a usable lightweight environment using a variety of distros as starting points. 

## Notes

- [Common configuration](common-configuration.md)
- [NeoVim configuration](neovim-configuration.md)
- [Watch progress of bootstrap script](watch-bootstrap.md)

## References

[Information about hardware and hypervisors](references.md)

## Background

For most purposes, the instance will be usable as a 512 MB VM, and can be containerized or loaded onto a small computer such as a Raspberry Pi. The instance can run with any [hypervisor](hypervisor.md).

This came about when I asked myself whether we really "need" a hefty system loaded to the gills with various IDEs. Taking stock of the laptop I was working with at the time, I noted 25 IDEs were installed. There were mainstream ones like IntelliJ IDEA and VSCode, and also a number of specialized ones such as Arduino Studio and Eiffel Studio. 

What would the _opposite_ sort of development environment look like, and how would the work flow _feel_ in comparison to today's typical IDE-dependent work flow? 

If that seemed practical, then what would it take to enable a painless, quick, "no-brainer" sort of setup procedure to spin up such an environment and tailor it to different development needs?

## Command-line and keyboard orientation

In principle, you don't need a graphical environment at all to use this setup. You have six ttys so you can have up to six command lines open at a time, and the NeoVim editor feels very much like a full-screen graphical editor. It can open a terminal panel and you can also enter individual commands from within the editor. 

In reality, you will probably need a GUI environment for _something_, even if only a Web browser to look up technical information as you work. When you customize one of the base instances, you may wish to add various other graphical programs, as well. The base configuration includes X window support and a lightweight terminal emulator.

The concept is you will rely on command-line build tools and shell scripts to deal with project metadata, dependencies, compilation, test execution, and so forth rather than depending on IDE features; tools like make, npm, rake, maven, gradle, sbt, dotnet, ghci, etc. This keeps the setup simple while enabling you to work with a wide variety of languages through a single text editor. You can add graphical tools as needed, such as Web browsers or testing tools like SoapUI or Postman.

## Choosing a distro

We have a large number of choices when it comes to Linux and Unix distributions. They cover a spectrum from do-it-yourself-from-source to copy-the-appliance-and-go. The range of choices runs more-or-less like this:

- [1] build from source (see [kernel.org](https://www.kernel.org), [linuxfromscratch.org](http://www.linuxfromscratch.org))
- [2] follow a guided config/build process based on a partial build (see [Gentoo](https://gentoo.org), [Arch](https://www.archlinux.org), others)
- [3] install a "minimal" distro and add packages to it (see [Ubuntu Server](https://www.ubuntu.com/download/server), [Core](http://distro.ibiblio.org/tinycorelinux/downloads.html), others)
- [4] install a ready-to-run iso with no (or a minimal) desktop and add packages to it (see [Debian w/o desktop](https://www.debian.org), [Mabox](https://maboxlinux.org), others)
- [5] install a consumer-friendly desktop distro and remove packages from it (see [Manjaro](https://manjaro.org), [Mint](https://linuxmint.com), others)

The use case here is to set up a low-footprint OS instance suitable for software development. We aren't looking for a way to explore the internals of Linux. Conversely, we aren't looking for a slick desktop environment with lots of bells and whistles. We want to get up and running quickly; this isn't the time for chasing down build errors or experimenting with kernel configuration options. 

My experience with attempting to set this up various ways leads me to recommend starting with category [4]: _a ready-to-run iso with no desktop and add packages to it_. 

I tried several Linux distros and had mixed results. Some "failure stories" are documented here: [Failures](failures.md). 

## Roads not taken

Some distros that are designed for end-user convenience were not included in this exercise. This is not a reflection on their quality. It only means they didn't seem to be a fit for the immediate use case. For example, <a href="https://www.bodhilinux.com">Bodhi Linux</a> is a nice packaging of Ubuntu that makes it a little easier for most people to get a working desktop environment up and running. That makes it a category [5] distro according to the taxonomy described above. For our purposes, that would mean removing all the niceties that have been built into the distro, to strip it down into a minimal environment. That just doesn't seem like a very logical thing to do. Besides, we already have an option for an Ubuntu-based configuration by starting with Ubuntu Server. 

There are some category [5] distros that seem reasonable as starting points, as there isn't as much to remove. For example, <a href="https://manjaro.org">Manjaro</a> offers several options including an XFCE desktop edition. That's a fairly lightweight environment already, and it doesn't feel as if we're destroying a lot of add-on work when we strip it down. 





