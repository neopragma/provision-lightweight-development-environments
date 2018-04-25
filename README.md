# Provision lightweight development environments

The term _lightweight development environment_ means an environment configured with minimal GUI support and a text editor rather than IDEs. It is for developers who prefer working on the command line. 

A _base_ instance provides a template for provisioning environments tailored for different kinds of development and testing work. 

## The general idea 

![illustration of the idea](images/environments.png)

For most purposes, the instance will be usable as a 512 MB VM, and can be containerized or loaded onto a small computer such as a Raspberry Pi. The instance can run with any [hypervisor](hypervisor.md).

## Command-line and keyboard orientation

In principle, you don't need a graphical environment at all to use this setup. You have six ttys so you can have up to six command lines open at a time, and the NeoVim editor feels very much like a full-screen graphical editor. It can open a terminal panel and you can also enter individual commands from within the editor. 

In reality, you will probably need a GUI environment for _something_, even if only a Web browser to look up technical information as you work. When you customize one of the base instances, you may wish to add various other graphical programs, as well. The base configuration includes X window support and a lightweight terminal emulator.

The concept is you will rely on command-line build tools and shell scripts to deal with project metadata, dependencies, compilation, test execution, and so forth rather than depending on IDE features; tools like make, npm, rake, maven, gradle, sbt, dotnet, ghci, etc. This keeps the setup simple while enabling you to work with a wide variety of languages through a single text editor. You can add graphical tools as needed, such as Web browsers or testing tools like SoapUI or Postman.

## How to build a base instance from...

- [Linux: CentOS 7](http://github.com/neopragma/bootstrap-centos-7-dev-base)
- [Linux: Debian 9](http://github.com/neopragma/bootstrap-debian-9-dev-base)
- [Linux: Gentoo](in-development.md)
- [Linux: Ubuntu 16.04 LTS](http://github.com/neopragma/bootstrap-ubuntu-server-16.04-dev-base)
- [Linux: Raspberry Pi: Raspbian Jessie](in-development.md)

## Notes

- [Common configuration](common-configuration.md)
- [NeoVim configuration](neovim-configuration.md)


## Watching progress of the provisioning script

Provisioning begins with a bash script that you run on a clean install. The script prepares the environment to run Chef, installs Chef DK, and starts chef-client to complete the process.

If you want to watch progress you can tail the output. After you complete the manual step to clone the git repository, use ctrl-alt-F2 to switch to tty2. Use ctrl+alt+F1 and F2 to switch between the two. 

Log in as ```root ``` in both tty1 and tty2. 

In tty1:

```shell 
cd bootstrap-centos-7-dev-base 
touch bootstrap.out 
```

In tty2:

```shell 
cd bootstrap-centos-7-dev-base 
tail -f bootstrap.out 
```

In tty1:

```shell 
./bootstrap 2>&1> bootstrap.out 
```

Then you can watch for errors in tty2.
