[top](http://github.com/neopragma/provision-lightweight-development-environments)

# Choosing a distro as a base

We have a large number of choices when it comes to Linux and Unix distributions. They cover a spectrum from do-it-yourself-from-source to copy-the-appliance-and-go. The range of choices runs more-or-less like this:

- [1] build from source (see [kernel.org](https://www.kernel.org), [linuxfromscratch.org](http://www.linuxfromscratch.org))
- [2] follow a guided config/build process based on a partial build (see [Gentoo](https://gentoo.org), [Arch](https://www.archlinux.org), others)
- [3] install a "minimal" distro and add packages to it (see [Ubuntu Server](https://www.ubuntu.com/download/server), [Core](http://distro.ibiblio.org/tinycorelinux/downloads.html), others)
- [4] install a ready-to-run iso with no (or a minimal) desktop and add packages to it (see [Debian w/o desktop](https://www.debian.org), [Mabox](https://maboxlinux.org), others)
- [5] install a consumer-friendly desktop distro and remove packages from it (see [Manjaro](https://manjaro.org), [Mint](https://linuxmint.com), others)

The use case here is to set up a low-footprint OS instance suitable for software development. We aren't looking for a way to explore the internals of Linux. Conversely, we aren't looking for a slick desktop environment with lots of bells and whistles. We want to get up and running quickly; this isn't the time for chasing down build errors or experimenting with kernel configuration options. 

My experience with attempting to set this up various ways leads me to recommend starting with category [4]: _a ready-to-run iso with no desktop and add packages to it_. 