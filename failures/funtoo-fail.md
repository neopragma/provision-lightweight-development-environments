[Top](http://github.com/neopragma/provision-lightweight-development-environments) =&gt; [Failures](../failures.md)

# Funtoo Linux: FAIL

## tl;dr

I was able to build a bootable instance based on Funtoo Linux, but beyond that it proved impractical (impossible?) to install the necessary packages to configure a usable environment. The Boost libraries would not compile, and that prevented certain other key installs from working. Gentoo forums point to out-of-memory errors as the typical cause, but in my case this was not the cause. There appeared to be simple syntax errors in the source code, and the compile phase failed. As a result, there was no way to install SDDM or LightDM. At that point, I gave up on this distro. 

In the context of the exercise to create small-footprint development environments quickly, Funtoo would not be a good choice (even if it worked) due to the time it takes to build the OS and install packages. Everything is installed as source and built on demand, which means every step you take requires at least minutes and in some cases hours. 

That characteristic means Funtoo cannot serve in a situation when people need to spin up new instances and customize them quickly. Ideally, we want a developer to be able to spin up a VM or container with a usable development environment in no more than a couple of minutes. Funtoo (and Gentoo generally) seems instead to be geared for building highly customized instances that are meant to stay up and running for an extended time. There is definitely a role for that sort of distro in the grand scheme of things.

My impression, too, is that "the Gentoo way" is extremely sensitive and idiosyncratic, to the point that the distro _feels_ fragile. I suppose, like other complicated software, once a person gets used to it Gentoo wouldn't feel fragile, but initially it definitely does. (I've experienced the same sort of learning curve with other software in the past.) Any small mistake can cause the system to be unbootable. This means everything you do has to be very painstaking and slow, and you have to take point-in-time backups along the way unless you want to spend days recompiling to get back to a point when the system was bootable. That sort of thing isn't necessary when you begin with a Debian- or Fedora-based distro.

Probably because of the focus on customizability, nothing "just installs" on Funtoo (or Gentoo generally). Everything you do..._every single fricking thing_...will complain about USE flags, configuration files, unresolved dependencies, and compiler options. You can't just execute ```emerge``` and be done with it; it does not handle dependencies and configuration settings automatically or even particularly well. You must handle some or all of those details yourself, manually. That means you have to understand how the system works on a deep level even to accomplish the simplest task in less than a day. 

At first I chased each problem down and found a resolution, and I managed to get a couple of packages installed, but then I realized this was neither effective nor sustainable. It could take _weeks_ to provision a usable system in this way. That sort of lead time does not align with the use case at hand. 

On the plus side, ```emerge``` generates reasonably helpful error messages to suggest how you might fix whatever errors occurred. In fact, the error messages are more comprehensive and better-written than I've seen on any other system to date. Also on the plus side, the online documentation is clear and well-organized and the community is relatively helpful and professional as compared with some of the other Linux communities. Childish snark and "RTFM" responses get old really fast, and I appreciate the tenor of the Gentoo community.

Even so, Gentoo is not a distro for people who just need to get work done. Each package you want to install requires a certain investment in time and effort just to get it in place. This is not a suitable work flow for developers who need to spin up instances quickly. 

### 1. Install

Comment: This is a lengthy process. My first attempt took two days. Once you know the drill, it will take the better part a day due to compile time, not typing time. For that reason, I suggest you save the bootable VM file once you have the OS installed and perform further configuration on copies of that file, so you won't have to return to Square One in case of errors. 

#### 1.1. Obtain iso

Dowload the iso using one of the links [Funtoo install page](https://www.funtoo.org/Install). This is described as a _system rescue CD_. 

#### 1.2. Start the iso in VMware

VMware Fusion (OS X) settings:

- Linux =&gt; Other Linux 3.x or later kernel 64-bit
- Customize settings
- Processors &amp; Memory:
  - 1 processor core
  - 1024 MB memory
- Hard Disk (SCSI):
  - 20 GB

Start Up.

A system rescue menu appears. A light blue color scheme indicates BIOS/MBR and a black and white color scheme indicates UEFI. Follow different installation instructions from the website accordingly. 

In my case it came up blue, so I followed the "old school" instructions to prepare the virtual disk. 

Choose "default boot options." It will boot to a command line.

#### 1.3. See if you have internet connectivity

```shell
ping -c 3 google.com
```

You should see

```
PING google.com (172.217.14.78) 565(84) bytes of data.
64 bytes from lax17s38-in-f14.1e100.net (172.217.14.78): icmp_seq=1 ttl=128 time=28.8 ms
64 bytes from lax17s38-in-f14.1e100.net (172.217.14.78): icmp_seq=2 ttl=128 time=26.6 ms
64 bytes from lax17s38-in-f14.1e100.net (172.217.14.78): icmp_seq=3 ttl=128 time=25.7 ms

--- google.com ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2004ms
rtt min/avg/max/mdev = 25.720/27.067/28.804/1.288 ms
```

The IP addresses, servers, and timings may differ, but the output should indicate that you can communicate. 

#### 1.4. Create partitions on the virtual disk

VMware Fusion will use ```/dev/sda``` as the first hard drive. Double-check to see what drive you are working with:

```shell 
fdisk -l
``` 

In my case, this returned:

```
Disk /dev/sda: 20 GiB, 21474836480 bytes, 41943040 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

This was as expected. 

Now erase any existing MBR or GPT partitions on the disk:

```shell 
sgdisk --zap-all /dev/sda
``` 

In my case, this resulted in:

```
Creating new GPT entries.
GPT data structures destroyed! You may now partition the disk using fdisk or other utilities.
```

We could probably partition the disk in the same way as we have for most of the other distros, but let's follow the installation instructions exactly. They call for us to use fdisk to create the partitions. 

```fdisk``` operates as a repl. Start it and enter the following commands. The text to the right that starts with "&lt;==" is not part of the command to enter, it's informational only.

```shell 
fdisk /dev/sda
Command (m for help): o                    <== empty the partition table 

Command (m for help): n                    <== create boot partition 
Partition type (default p): [Enter]        <== partition type 'p' == 'primary'
Partition number (1-4, default 1): [Enter] <== partition number
First sector: [Enter]                      <== calculated 
Last sector: +128M                         <== end of partition

Command (m for help): n                    <== create swap partition 
Partition type (default p): [Enter]        <== partition type 'p' == 'primary'
Partition number (1-4, default 1): [Enter] <== partition number
First sector: [Enter]                      <== calculated 
Last sector: +2G                           <== end of partition

Command (m for help): n                    <== create root partition 
Partition type (default p): [Enter]        <== partition type 'p' == 'primary'
Partition number (1-4, default 1): [Enter] <== partition number
First sector: [Enter]                      <== calculated 
Last sector: [Enter]                       <== all remaining space

Command (m for help): p                    <== 'p' == 'print'; visually review

Command (m for help): w                    <== 'w' == 'write'; save the data
```

#### 1.5. Create file systems 

```shell
mkfs.ext2 /dev/sda1                        <== boot partition ext2
mkswap /dev/sda2                           <== initialize swap partitio 
swapon /dev/sda2
mkfs.ext4 /dev/sda3                        <== root partition ext4 
```

#### 1.6. Mount file systems 

```shell 
mkdir /mnt/funtoo
mount /dev/sda3 /mnt/funtoo 
mkdir /mnt/funtoo/boot
mount /dev/sda1 /mnt/funtoo/boot

### 1.7. Set system date

Portage will not work correctly if the system date is wrong.

```shell 
date
``` 

In my case, the date was correct. If yours is incorrect, you can set it with the command ```date MMDDhhmmYYYY``` where ```hhmm``` is in 24-hour form.

Example of setting the date and copying it to the hardware date:

```shell 
date 050116302018
hwclock --systohc
``` 

#### 1.8. Download the stage 3 tarball 

In my case, at the time I did this the correct tarball to download was this one:

```shell
wget https://build.funtoo.org/funtoo-current/x86-64bit/intel64-haswell/stage3-latest.tar.xz
```

The section about [creating filesystems](https://www.funtoo.org/Install#Creating_filesystems) has guidance to help you choose the right version of the stage 3 tarball, about halfway down the page. 

It was not as easy as I expected to identify the right tarball for my build. Here is [a side rant](funtoo-tarball-rant.md) detailing the experience.

Next step is to uncompress it. The 'p' option preserves permissions on the files; it's important.

```shell 
tar xpf stage3-latest.tar.xz
``` 

#### 1.9. Chroot into Funtoo 

Create the root mount point and mount file systems.

```shell 
cd /mnt/funtoo
mount -t proc none proc
mount --rbind /sys sys
mount --rbind /dev dev
``` 

Copy ```/etc/resolv.conf``` to the new system to ensure hostname resolution. 

```shell
cp /etc/resolv.conf /mnt/funtoo/etc
``` 

Chroot into the new system. According to the installation documentation, this form of the command ensures no environment settings from the installation media are pulled into the new system. 

```shell 
env -i HOME=/root TERM=$TERM /bin/chroot . bash -l
``` 

If the prompt changes to ```sysrescd / #``` then all is well. 

Change the default command prompt to avoid potential confusion down the road.

```shell 
export PS1="(chroot) $PS1"
```

Check Internet name resolution from within the chroot.

```shell 
ping -c 3 google.com
``` 

#### 1.10. Update the local package repository

The package manager for Gentoo distros is Portage. Next step is to download the portage tree to initialize the local package repository. 

```shell 
ego sync
``` 

This can take time. 

#### 1.11. Update /etc/ftab

In my case, at this point there was no /etc/ftab file. I created one with the following contents, corresponding with the partitions created in Step 1.4 above:

```
# <fs>      <mountpoint>  <type>  <opts>          <dump/pass> 
/dev/sda1    /boot        ext2    noauto,noatime  1 2
/dev/sda2    none         swap    sw              0 0
/dev/sda3    /            ext4    noatime         0 1
```

#### 1.12. Set the timezone 

To list availaable timezones:

```shell 
less /usr/share/zoneinfo
```

Under ```zoneinfo``` there are regional directories, like ```America```. Under those, there are timezone files named for cities. For instance, my timezone is ```/etc/share/zoneinfo/America/Phoenix```. To set the timezone, I defined a symlink named ```/etc/localtime``` pointing to the Phoenix timezone:

```shell
ln -sf /usr/share/zoneinfo/America/Phoenix /etc/localtime
``` 

#### 1.13. Other configuration files

There's no need to modify other configuration files if your locale is en_US and encoding is UTF-8. Otherwise consult [the installation instructions](https://www.funtoo.org/Install#Creating_filesystems).

#### 1.14. Update /var/lib/portage/world

Having synced the system, update ```world``` before attempting to boot for the first time to avoid potential problems with dependencies on packages that have licensing requirements that prohibit their free distribution. Consult the [the installation instructions](https://www.funtoo.org/Install#Creating_filesystems) for further explanation. 

```shell 
emerge -auDN @world 
``` 

When it displays 

```
Would you like to merge these packages?
```

The correct answer is probably ```Yes```, unless you see output that looks highly questionable. 

An important warning from the installation instructions: "Make sure you read any post emerge messages and follow their instructions."

This step ran for two hours and fifteen minutes and ended with:

```
ERROR: dev-libs/boost-1.63.0::core-kit failed (compile phase):
  Building of Boost libraries failed
(call stack info)
``` 

The error messages suggest:

```
If you need support, post the output of `emerge --info '=dev-libs/boost-1.63.0::core-kit'`, the complete build log and the output of `emerge -pqv '=dev-libs-boost-1.63.0::core-kit'`. 
The complete build log is located at '/var/tmp/portage/dev-libs/boost-1.63.0/temp/environment'.
Working directory: '/var/tmp/portage/dev-libs/boost-1.63.0/work/boost_1_63_0-abi_x86_64.amd64'
S: '/var/tmp/portage/dev-libs/boost-1.63.0/work/boost_1_63_0'
``` 

I did not take those steps. Without reviewing logs, [this item](https://forums.gentoo.org/viewtopic-t-1053790-start-0.html) on Gentoo forums suggests the problem occurs because of an out-of-memory condition. I believe there is sufficient memory, storage, and swap space for a reasonable build. Also, the objective here is to build a _small_ instance, and I don't want to allocate more memory, storage, or swap space given the purpose of this exercise. I decided to proceed and hope for the best.

The last messages from the run read as if things are normal:

```
Regenerating GNU info directory index...
Processed 107 info files.
After world updates, it is important to remove obsolete packages with 
emerge --depclean. Refer to `man emerge` for more information.
```

I followed the advice: 

```shell
emerge --depclean
```

That resulted in:

```
Dependencies could not be completely resolved due to the following required packages not being installed:

  >=dev-libs/openssl-1.0.1:0/0=[bindist] pulled in by:
    net-misc/openssh-7.5_p1-r4

  >=dev-libs/openssl-1.0.1:0=[bindist] pulled in by:
    net-misc/openssh-7.5_p1-r4

Have you forgotten to do a complete update prior to depclean? The most comprehensive command for this purpose is as follows:

  emerge --update --newuse --deep --with-bdeps=y @world

(and more info)
```

Okay, I'm game. 

```shell
emerge --update --newuse -deep -with-bdeps=y @world
``` 

The first thing it tried to merge was ```dev-libs/boost-1.63.0::core-kit```. This did not give me a great sense of confidence. I expected it to fail again. How many hours this time? I watched it until it kicked off a series of compiles. The first few seemed to run without error. I went to watch a movie on television. 

Exactly the same error. Proceeding with the next step.

#### 1.15. Check to see if debian-sources is installed 

If ```debian-sources``` is installed, we can skip the remainder of the kernel section and move on to the bootloader section. 

```shell
emerge -s debian-sources
``` 

That command indicated ```sys-kernel/debian-sources 4.14.12``` was installed. That meant I didn't need to take the time to compile a kernel. 

#### 1.16. Install bootloader 

First, emerge ```boot-update```:

```shell
emerge boot-update
``` 

This ran more compiles, and completed with no error messages. 

#### 1.17. Update /etc/boot.conf

Modify the ```/etc/boot.conf``` file to correspond with the way the system has been built. Consult [the installation instructions](https://www.funtoo.org/Install) for an explanation of the entries. Based on those instructions, this is what I defined:

```
boot {
    generate grub
    default "Funtoo Linux genkernel"
    timeout 3
}

"Funtoo Linux" {
    kernel bzImage[-v]
}

"Funtoo Linux genkernel" {
    kernel kernel[-v]
    initrd initramfs[-v]
    params += real_root=auto
}

"Funtoo Linux better-initramfs" {
    kernel vmlinuz[-v]
    initrd /initramfs.cpio.gz
}
```

#### 1.18. Install grub to the MBR partition and generate grub.cfg

This is for "old school" BIOS/MBR booting.

```shell
grub-install --target=i386-pc --no-floppy /dev/sda 
boot-update
```

The ```boot-update``` command emitted the following warning:

```
WARN: Intel system detected - please emerge sys-firmware/intel-microcode and sys-apps/iucode_tool and run boot-update again; boot-update will then patch your system with the latest Intel CPU and chipset microcode patches at boot-time, protecting you against important vulnerabilities and errata.
```

I thought it prudent to comply with the recommendations. 

```shell
emerge sys-firmware/intel-microcode sys-apps/iucode_tool
boot-update
```

The merges ran without error and ```boot-update``` completed with no errors or warnings. 

#### 1.19. Configure network support

For the use case we're supporting, it's almost certain you will run instances based on this template OS in a hypervisor or container environment. Therefore, I followed the instructions to configure wired network connectivity with DHCP. 

If you want to build for wireless support, or change the configuration to support wireless later, then please consult [the installation instructions](https://www.funtoo.org/Install) for an explanation of the procedure. Further information is available on the [Funtoo networking page](https://www.funtoo.org/Networking).

The following is based on the "Desktop (Wired DHCP)" section of the installation instructions.

```shell
rc-update add dhcpcd default
``` 

#### 1.20. Change the hostname

Edit ```/etc/conf.d/hostname``` and define a meaningful hostname for the new system. 

```
hostname="funtoo"
```

#### 1.21. Set the root password

Set a password for the root account. My habit is to set this to ```root``` in base or 'template' systems and change it as appropriate when generating custom instances from the template. 

Run ```passwd``` and follow the prompts. It will warn you that ```root``` is too simple and too short to be a secure password. In context, that's okay (IMO).

```shell
passwd
```

#### 1.22. Exit from chroot and unmount file systems 

```shell
exit
umount -lR funtoo
```

When I ran ```exit``` it said there were active jobs. I ran ```exit``` a second time and it exited from chroot. The ```umount``` command said ```umount: funtoo: not found```. This did not appear to cause any problems.

### 1.23. Reboot

The moment of truth has arrived.

```
reboot
```

In my case, the system started normally and presented a boot menu with a single entry. I pressed Enter and the system booted to a root prompt. 

### 1.24. Create user dev with password developer

Log in as ```root```.

You can add whatever users you please. The ```bootstrap``` script depends on the existence of a user 'dev' with password 'developer'. 

```shell
useradd -m dev
passwd dev
[developer]
[developer]
```

### 1.25. Install git

The provisioning scripts are on Github. The instance needs git support to clone the repository and complete the configuration. If you need more information, consult the [Gentoo git page](https://wiki.gentoo.org/wiki/Git).

Install:

```shell
emerge --ask dev-vcs/git
``` 

See if it installed okay:

```shell
git --version
```

Define a user name and email so git won't complain:

```shell
git config --global user.name Developer
git config --global user.email dev@nowhere.com
```

## FAILURE

Beyond this point, I was unable to install packages necessary to provision a usable environment. I was able to install Ruby, but was not able to install any display manager. I tried SDDM and LightDM, and spent two days wrestling with compile errors. The root cause appears to have been the Boost libraries, which would not compile no matter what.
