[top](../../README.md) =&gt; [Failures](../failures.md)

## Arch Linux - FAIL

The Arch Linux installation guide is more a test of character than an actual installation guide. As for me: My worthiness has not been established.

### tl;dr - I gave up on this

You can read through the step-by-step if you think there might be value in doing so, but ultimately I did not produce a bootable Arch Linux instance after about 80 hours of effort. I _think_ I came pretty close on the last try (which is represented by the description below), but it's hard to tell, as the process of working with Arch seems to consist of

```ruby
loop do
  step_forward 1
  step_back 2
  break if tired_of_the_bullshit?
end
beers.each do|beer|
  drink
end
```

The Arch Linux installation guide can be summarized by the following illustration:

![Arch Linux Installation Guide](images/draw-an-owl.jpg)


In the immediate aftermath, when my spirit hasn't settled down yet, I attribute the difficulties to two factors:

- The documentation is almost, but not quite, entirely undecipherable. The authors have gone to great lengths not to repeat themselves. To the reader, that means constantly linking out to other pages and back instead of having a coherent sequence of steps to follow. It's very easy to lose track of where you were and skip steps. They also offer multiple options for almost every installation step, making it hard to tell what is required and what isn't. It reminded me of the way IBM documentation was organized in the 1970s. You'd have to find a sentence in Manual A, a sentence in Manual B, and so on through Manual M or N before you could construct a clear statement of how to do Thing X. The experience of navigating the Arch Linux documentation feels very much the same, only it's pixels instead of paper. I got tired of that. Actually, I was tired of it by 1980.
- There is a tremendous amount of information online regarding Arch Linux installation and configuration. Probably about 90% of it is in the form of questions posed to forums that are answered with some variation of "RTFM," "works for me," or "you fucked up somewhere." When you can find a "solution" to a problem, it usually turns out to be a workaround rather than a real solution, and doesn't work in your situation for one reason or another. The general tone of the online community around Arch is adolescent, condescending, and snarky. I got tired of that. Actually, I was tired of it by 1972. 

My conclusion is that Arch Linux is primarily a toy for people who are interested in fiddling with Linux, as opposed to a platform intended for people who want to do useful work _on top of_ Linux. Fiddling with Linux is not the purpose of my immediate project, which is to set up a lightweight software development environment on a variety of different Linux and Unix systems. So, I guess Arch Linux is off that list. 

Maybe I'll try again another time. Or maybe not. I think the next time I feel like exploring the innards of Linux, I'll build from source. That way I won't have the insurmountable barrier of Arch's installation procedure standing between me and a bootable system. 

Now for the long version. 

### 1. Set realistic expectations

Unfortuately, this has to be the first step when you attempt to install Arch Linux. 

#### Expectation 1: The installation procedure does not work

You can expect to attempt this installation several times before you get it working (if ever). My experience has been that the installation procedure, documentation, and general attitude of the community add up to a sort of hazing ritual to initiate you into the Arch club, rather than sincere help with getting started. 

#### Expectation 2: The community will not help you

If you post pleas for help on forums, you will likely discover the community is willing to spend more time composing a response along the lines of "RTFM" or "Works on _my_ machine" than it would take them just to answer your question straight up. Sometimes they will post a link to another question, which contains a link to a third question, which contains a link back to the first question, with no answer in sight. 

Sometimes they will remind the OP that Arch is supported by volunteers, and there is no "support department." That being the case, if someone really is too busy to answer a question, then how do they find the time to post an "RTFM" response? Doesn't it follow logically that they are too busy to respond _at all_? If only they would refrain, at least we wouldn't find hundreds of useless postings when we're searching for answers. 

#### Expectation 3: The documentation is of uneven quality

Some observations:

- The installation guide omits details that bite you as you progress further with the procedure.  
- The installation guide reads as if no errors ever occur, rather than including helpful tips for dealing with common errors. 
- The installation guide lists multiple options for this or that without suggesting a practical default starting point. Flexibility is good. So is a _working_ default starting point. 
- The iso behaves differently each time you start it. Sometimes networking fails; sometimes the package installs fail; sometimes there are disk space issues that weren't there before; sometimes a command that worked previously just hangs, and you get no logs or console messages, etc. [Arch is "like a box of chocolates."](https://en.wiktionary.org/wiki/life_is_like_a_box_of_chocolates)
- Arch documentation is extensive, but the quality is uneven. I found useful help in some areas by reading the Gentoo guide instead of the Arch guide.
- Sometimes it seems as if commands have no effect at all, or they don't have the documented effect, or the effect doesn't stick.
- Supposedly you can restart the iso and it remembers where you left off, but sometimes it comes up pristine, having "forgotten" everything you did.
- Sometimes on restart, the iso "remembers" just the wrong things, and you get stuck at a certain point with no way to recover short of starting over.
- If you manage to get through the whole process, when you reboot there's no obvious way to select the newly-minted Linux system from the boot menu. "Boot Arch Linux" merely starts the installation iso again. "Boot existing OS" merely displays the text, ```Booting...``` and hangs there forever. We are not amused.

#### Information sources 

There are many (probably thousands) of websites, forums, and wikis containing questions about how to resolve various installation issues for Arch Linux. Most of them are unhelpful, so I thought it would be useful to list the ones where I found actionable information. Maybe it will save you a little time, because Expectations #1 and #2.  

- [Arch Linux installation guide](http://wiki.archlinux.org/index.php/Installation_guide)
- [Gentoo Handbook: Disks: Partition Tables](http://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Disks#Partition_tables)
- [Using EFI/UEFI Firmware in a VMware Virtual Machine](https://communities.vmware.com/docs/DOC-28494)
- [Arch wiki: dhcpcd](http://wiki.archlinux.org/index.php/dhcpcd)
- [Arch BBS: \[SOLVED\](vmware) networking post-install](https://bbs.archlinux.org/viewtopic.php?id=191288)
- [Arch wiki: LVM](https://wiki.archlinux.org/index.php/LVM)
- [StackExchange: dhcpcd can't startup at boot](https://unix.stackexchange.com/questions/76587/dhcpcd-cant-startup-at-boot)
- [Tecmint: timedatectl tutorial](https://www.tecmint.com/set-time-timezone-and-synchronize-time-using-timedatectl-command/)
- [nixCraft: Linux View Hard Drive Partitions with fdisk and parted commands](http://www.cyberciti.biz/faq/linux-viewing-drive-partitions-with-fdisk-parted/)
- [GNU: Parted Manual](http://www.gnu.org/software/parted/manual/html_chapter/parted_7.html)
- [Computing for Geeks: Start to Install Arch Linux with LVM](http://computingforgeeks.com/install-arch-linux-with-lvm-on-uefi-system)

### 2. Plan your disk partitions 

This is not the first step in the procedure, but it's best if you know how you intend to partition the drive(s) before you get to that point. 

What is documented here was not my first attempt. I partitioned the virtual disk many times using different options and different-sized partitions in an attempt to get the installation process far enough along to actually download packages and install them. The partition layout shown in this section is what I defined on my final attempt, when I made the most progress toward completing the installation process. 

The Arch community does not offer an "easy" installer that provides a default partitioning scheme. The rationale is to provide maximum flexibility for users to configure their systems as needed. Arch documentation offers little concrete guidance in this area. Numerous "gotchas" lie in wait for the unprepared. 

As part of the installation procedure, you will run a script named ```pacstrap``` that installs a number of packages. You need to have adequate real or virtual storage ("disk drive" space) partitioned in a way that avoids running out of space during the install. 

When you look for help online, you'll find different users insisting that you need a big or small boot partition, a big or small root partition, or no boot partition at all. There is no clear, unambiguous guidance. 

There are many partitioning schemes that will work, and many _more_ that will not. After many hours of trial and error, this is the arrangement I ended up with that enabled the install to finish (although it did _not_ result in a bootable system):

``` 
Number  Start    End     Size    File system  Name           Flags
 1      1049kB   538MB   537MB   fat32        efi-partition  boot, esp 
 2      538MB    839MB   301MB                boot-partition 
 3      839MB    21.5GB  20.6GB               lvm-partition  lvm 
```

### 3. Obtain the iso 

Arch Linux is distributed as an iso that will boot with just enough functionality to support the installation procedure. Obtain one from [Arch Linux](http://www.archlinux.org/download/).

### 4. Install as VMware guest OS

This section contains information you will not find on the Arch Linux wiki.

This section pertains only to installing Arch Linux as a VMware guest OS. If you are using a different hypervisor, you might want to scan this section to see if there are any implications for the product you are using.

There are a couple of nuances when you install an Arch instance as a VMware guest OS. One has to do with connecting to Ethernet through VMware; that is covered later. Another is the requirement for UEFI; we will deal with that now.

To work with Arch Linux, the hypervisor has to be set to boot in UEFI mode. At the time this was written (April, 2018), the current VMware Workstation products supported UEFI as a UI setting, but VMware Fusion 10.0.1 did not. However, the product _does_ support UEFI. You have to add a setting to the .vmx file to enable it.

_After_ creating the VM (so that the .vmx file exists) but _before_ beginning the installation procedure, edit the .vmx file and add the following specification:

```
firmware = "efi"
``` 

### 5. Verify the iso was started in UEFI mode 

If this command returns a result, then the iso was started in UEFI mode and you're good to go forward. Otherwise, go back and ensure you're starting the iso in UEFI mode. The details will vary by hypervisor.

```shell 
ls /sys/firmware/efi/efivars 
``` 

### 6. VMware host and Ethernet  

If you are installing onto hardware and you have an Ethernet connection, the iso should come up with Ethernet enabled on eth0. VMware passes Ethernet through to the host OS. The virtual Ethernet connection is assigned a different name from eth0. 

Find the name of the virtual Ethernet connection:

```
ip link 
``` 

Look for output similar to this:

``` 
ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_code1 state UP mode DEFAULT group default qlen 1000
link/ether _etc._ 
```

The entry that has "link/ether" somewhere is the right one. In this example, the name is ```ens33```. The name you see on your system might be different. I'll use the name ```ens33``` here.

Try these commands to start Ethernet on ens33:

```shell 
ip link set ens33 up
dhcpcd ens33
```

If you're lucky, you'll see output similar to this:

```
dev: loaded udev
DUID stuff 
ens33: IAID stuff
ens33: soliciting an IPv6 router
ens33: soliciting a DHCP lease
ens33: offered ipaddr from _gate wayipaddr 
ens33: probing address ipaddr 
ens33: leased ipaddr for 1800 seconds
ens33: adding route to ipaddr
ens33: adding default route to ipaddr 
forked to background, child pid 747
``` 

If you see something like ```rejected NAK``` with several retries, then you don't have a connection.

### 7. Verify you can get to the Internet 

Try pinging the Arch Linux site to see if you can reach the Internet: 

```shell 
ping -c 3 archlinux.org 
``` 

If all is well, you will see output similar to this:

```
PING archlinux.org (138.201.81.199) 56(84) bytes of data.
64 bytes from apollo.archlinux.org _stuff_ 

-- archlinux.org ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2005ms
rtt min/avg/max/mdev = 201.725/202.182/202.720/0.550 ms
``` 

Otherwise, you don't have a connection. 

You may or may not be in good shape - there's plenty of time for Arch to decide to eat its own heart for some reason or for no reason - but if you got this far then it _appears_ as if you will be able to proceed with the install. 

### 8. Set the keyboard layout 

The iso ships with the US console keymap enabled. If that's okay for you, skip this step. If you prefer a different keymap, you can list the available layouts with this command:

```
ls /usr/share/kbd/keymaps/**/*.map.gz | less
``` 

The filenames, but not the extension ".map.gz", are the names of keymaps that you can load with the ```loadkeys``` command. The example given in the Arch installation guide is a German keymap listed as ```/usr/share/kbd/keymaps/i386/qwertz/de-latin1.map.gz```. To set that one, pass just the ```de-latin1``` part of the name to ```loadkeys```, like this:

```shell 
loadkeys de-latin1
```

### 9. Set the system time from the network 

Update the system clock with this command:

```shell 
timedatectl set-ntp true 
``` 

To see what time the system thinks it is, use this command:

```shell
timedatectl status 
``` 

If all is well, you'll see the time in UTC but your local timezone will not be set. 

To list the available timezones:

```shell 
timedatectl list-timezones
``` 

You can limit the quantity of output by grepping for your geographical region. For example, this shows entries for the Americas:

```shell 
timedatectl list-timezones | grep "America"
``` 

When you find the entry you want, set it like this:

```shell 
timedatectl set-timezone "America/Phoenix"
```

Now check to see that the timezone was set:

```shell
timedatectl | grep Time
``` 

You should see something like this:

```
Time zone: America/Phoenix (MST, -0700)
``` 

For the America/Phoenix example, you might see (PST, -0800) depending on the time of year, as Arizona does not use Daylight Saving Time. 

### 10. Partition the drive 

#### 10.1. Identify your drive(s)

First, identify the drive(s) that you need to partition: 

```shell 
fdisk -l 
``` 

You will see output similar to this:

```
Disk /dev/sda: 20 GiB, stuff 
Units: sectors of stuff 
Sector size (logical/physical) stuff
I/O size (minimum/optimal) stuff 

Disk /dev/loop0: 446.8 MiB, stuff 
Units: sectors of stuff 
Sector size (logical/physical) stuff
I/O size (minimum/optimal) stuff 
```

The entries like ```/dev/sda``` or ```/dev/sha``` represent logical "disk drives." In this example, there is one "disk drive" and it is ```/dev/sda```.

#### 10.2. Partition the drive(s)

The Arch installation guide mentions multiple tools for partitioning storage, and that can be confusing if you don't do this often. For that reason, I'm going to stick with just one tool for partitioning: ```parted```. 

You may have used the graphical version of ```parted```, ```gparted```, when installing other Linux distros or other OSes. These notes will refer to the command-line version, ```parted```, as we don't have a graphical environment on the Arch installation iso. 

First, see what the partition table looks like right now. 

```shell 
parted /dev/sda print  
```

On the first startup of the Arch iso, this is what I saw in response to that command:

```
Error: /dev/sda: unrecognised disk label
Model: VMware, VMware Virtual S (scsi)
Disk /dev/sda: 21.5GB
Sector size (logical/physical): 512B/512B
Partition Table: unknown
Disk Flags:
``` 

Although the output begins with the scary word, _Error_, it only means there is no Partition Table. That is what we expect at this point, because we haven't (yet) partitioned the drive wrong. Once we've done that, we'll have to eliminate the old definitions before we can get into the inevitable loop of doing it wrong and re-doing it again and again. 

The program ```parted``` will run as a repl, and we enter commands within it to create the partitions. It shows a prompt, ```(parted)```, while the repl is active. To exit the repl, enter ```quit```. 

When following the example below, don't type "(parted)", as that is only the prompt displayed by ```parted``` while the repl is active. Type the text that appears _after_ ```(parted)```.

```shell
parted /dev/sda 
(parted) mkpart ESP fat32 1MiB 513MiB
(parted) set 1 boot on 
(parted) name 1 efi-partition 
(parted) mkpart primary 513MiB 800MiB 
(parted) name 2 boot-partition 
(parted) mkpart primary 800MiB 100% 
(parted) name 3 lvm-partition 
(parted) set 3 lvm on 
(parted) print 
(parted) quit 
```

Compare the output from ```print``` with the partition table you planned in step 2 above. 

LVM uses _physical volumes_ that contain _volume groups_ that contain _logical volumes_. We set these up using special LVM utilities. 

Partition number 3 is the LVM partition, so we will create the _physical volume_ on /dev/sda3.

```shell 
pvcreate /dev/sda3
```

Output should be similar to this:

``` 
Physical volume "/dev/sda3" successfully created.
```

Now we create a single _volume group_ and name it "arch-lvm" so we'll be able to recognize what it is later on, after we've forgotten all these gory details. That will occur at one of two times: (1) five minutes after we successfully start an Arch Linux instance, or (2) five minutes after we give up on Arch Linux and turn to another distro. Where were we? Oh yeah: Volume group.

```shell 
vgcreate arch-lvm /dev/sda3 
``` 

Output should be similar to this:

```
Volume group "arch-lvm" successfully created. 
``` 

Now we create _logical volumes_ within the _volume group_. These are _conceptually analogous_ to partitions, but technically they are not partitions. 

I'm going to create a swap and put everything else into a single logical volume. For the lightweight development environment there's no need to separate ```root``` and ```home```. 

```shell
lvcreate -n arch-swap -l 2G arch-lvm 
lvcreate -n arch-root -l 100%FREE arch-lvm 
lvs 
```

Output should be similar to this:

```
Logical volume "arch-swap" created.
Logical volume "arch-root" created.

LV        VG       Attr       LSize
arch-root arch-lvm -wi-a----- 17.21g
arch-swap arch-lvm -wi-a-----  2.00g
``` 

### 11. Create filesystems 

So, /dev/sda1 is the EFI boot partition, /dev/sda2 is the regular boot partition, and /dev/sda3 is the LVM area. We're defining a single logical volume there, ```arch-root```. 

```shell 
mkfs.fat -F32 /dev/sda1
mkfs.ext2 /dev/sda2
mkfs.ext4 -L root /dev/arch-lvm/arch-root
``` 

Output should be similar to this:

``` 
mke2fs 1.44.1 (24-Mar-2018)
Creating filesystem with 4512768 4k blocks and 1128288 inodes
Filesystem UUID: stuff
Superblock backups stored stuff
Allocating group tables: done
Writing inode tables: done 
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done
``` 

Now we initialize the swap area:

```shell 
mkswap /dev/arch-lvm/arch-swap 
swapon /dev/arch-lvm/arch-swap 
``` 

Output from ```mkswap``` should be similar to this:

``` 
Setting up swapspace version 1, size = 2 GiB (2147479552 bytes) 
no label, UUID=stuff

``` 

and no output from the ```swapon``` command. 

### 12. Create mount points and mount the filesystem

Mount ```arch-root``` to /mnt _before_ creating the /mnt/boot and /mnt/boot/efi directories. If you create the directories first, then when you mount ```arch-root``` the system will not "see" the directories.

```shell 
mount /dev/arch-lvm/arch-root /mnt 
mkdir /mnt/boot
mkdir /mnt/boot/efi
mount /dev/sda2 /mnt/boot 
mount /dev/sda1 /mnt/boot/efi 
``` 

### 13. Install base system 

Now it's time to see if ```pacstrap``` can pull anything from the Arch mirror sites. This is the part of the process where I spent upwards of 70 hours trying to make it work. 

We want to set up a development environment, so we need the ```base-devel``` packages as well as ```base```. We're using UEFI, so we need the ```efibootmgr``` as well. 

```shell 
pacstrap /mnt base base-devel efibootmgr
``` 

### 14. Generate fstab file 

Generate the fstab file using UUIDs for source identifiers (the -U option).

```shell 
genfstab -U /mnt > /mnt/etc/fstab 
``` 

### 15. Enable efivars 

If you don't do this while still operating in the installation iso environment, when you get around to installing the bootloader it will not work properly. 

```shell 
modprobe efivars
```

### 15. Change root into the new system 

The ```arch-chroot``` command performs some minor magic related to the Arch installation iso that the standard ```chroot``` command doesn't know about. 

```shell 
arch-chroot /mnt
``` 

### 16. Set the system time and timezone 

Find the region and city that pertain to you:

```shell 
ls -la /usr/share/zoneinfo
```

Define a symlink to that file:

```shell 
ln -sf /usr/share/zoneifo/America/Phoenix /etc/localtime 
``` 

Generate ```/etc/adjtime```:

```shell 
hwclock --systohc
``` 

Edit the file ```/etc/locale.gen``` and uncomment all the localizations you want on your system. For example, replace 

``` 
# en_US.UTF-8 UTF-8
```

with

```
en_US.UTF-8 UTF-8
```
 
Now generate the localizations:

```shell 
locale-gen
``` 

Now set the ```LANG``` variable in ```/etc/locale.conf``` accordingly.

``` 
LANG=en_US.UTF-8
``` 

### 17. Make the keyboard setting persistent 

If you set a different keyboard mapping than the default, create ```/etc/vconsole.conf``` with the following content. (This example uses the same example as above, ```de-latin1```. Use the one you really set, if it's different.)

```
KEYMAP=de-latin1
```

### 18. Set the hostname 

Create the ```/etc/hostname``` file containing the hostname you want to set for this instance. I'm using ```archlinux``` here. 

```shell
echo 'archlinux' > /etc/hostname
``` 

Add corresponding entries to ```/etc/hosts```:

```shell 
echo '127.0.0.1 localhost' >> /etc/hosts
echo '::1 localhost' >> /etc/hosts 
echo '127.0.0.1 archlinux.localdomain archlinux' >> /etc/hosts
``` 

To check the result, see if you can ping localhost by the hostname you defined:

```shell 
ping -c 3 archlinux
```

### 19. Set the root password 

For these lightweight development environments, I use ```admin``` as the root password. 

```shell 
passwd
``` 

### 20. Add the developer account 

This is the standard account on all the lightweight development environment instances, except when an OS reserves that username (e.g., CentOS).

```shell 
useradd -m -p developer -G wheel dev 
``` 

### 21. Configure Ethernet network access (again)

According to the official installation guide, the network settings we made earlier were strictly to connect the installation iso with the Arch mirror sites, and did not configure any network settings on the actual Arch instance. However, when I finally got this far into the installation procedure, I found the ethernet connection on ens33 was still working.

Repeat actions in Step 6 above while in the chroot environment. 

### 22. Install grub bootloader

Arch Linux does not come with a bootloader because they want people to have the option to select whichever bootloader they prefer. Install grub:

```shell 
pacman -Sy grub os-prober efibootmgr
``` 

Make sure ```/boot/efi``` is mounted. You might have to repeat the ```mount``` commands from Step 12 while in the chroot environment. 

We'll use ```GRUB``` as the bootloader identifier. It will become the name of a subdirectory off ```/boot/efi``` where the EFI binary bootloader will live. The name will also appear in the EFI boot menu. 

The following will install the grub UEFI application ```grubx64.efi``` to ```/boot/efi/GRUB``` and install its modules to ```/boot/grub/x86_64.efi```.

```shell 
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
```

When I ran this, I got the following output:

```
Installing for x86_64-efi platform.
EFI variables are not supported on this system.
EFI variables are not supported on this system.
Installation finished. No error reported.
```

So, were there errors or not? I searched for help with this problem and found suggestions to exit chroot and run ```modprobe efivars```. Didn't work. No directory ```/sys/firmware/efi``` exists. No module ```efivars``` present in ```/lib/modules/4.15.14-1-ARCH```. Found a couple of items that said this was all obsolete, as ```efivars``` was no longer a module but had been incorported into the Linux kernel. 

In this case, it is not only the Arch Linux documentation that is confusing, but the general information online, as well. There must have been some fairly recent changes in the way this is implemented, as different sources contradict each other about what to do to solve the problem. I was nervous about rebooting, but I gave it a try. 

The first option in the boot list merely restarts the installation iso. 

The second option, "existing OS," merely hangs with the message, ```Booting...```. 

There _is_ a ```/boot/efi/grub/grub.cfg``` file. 


### 23. Reboot and see if the instance will start 

First, exit the ```chroot``` environment and then issue the ```reboot``` command.

```shell 
exit
reboot now
```

Doesn't work. You might as well have done nothing at all. 
