[top](http://github.com/provision-lightweight-development-environments) =&gt; [Failures](../failures.md)

## exGENT Gentoo: FAIL

I struggled for a couple of days on my own based on the available documentation, and was stumped. After an email exchange with Arne Exton, creator of exGENT, I wanted to try one more time to install the system to disk. After about 6 hours stuck at Step 5 (below), I called it "done." This documents the experience for future reference.

Useful links:

- [Release announcement](http://exgent.exton.net)
- [Download live iso](https://sourceforge.net/projects/exgent/)
- [Installation guide](http://exgent.exton.net/?page_id=25)

The following is based in part on information in the installation guide and in part on information from Arne's email in response to my request for help. 

## Download iso

Download the live iso from [Sourceforge](https://sourceforge.net/projects/exgent/)

## Start the iso in VMware

VMware Fusion (OS X) settings:

- Linux =&gt; Other Linux 3.x or later kernel 64-bit
- Customize settings
- Processors &amp; Memory:
  - 1 processor core
  - 1024 MB memory
- Hard Disk (SCSI):
  - 20 GB

Start Up.

From the boot menu, choose ```exGENT x86_64```

**Note:** The boot process does not start correctly by default after the menu times out. If the menu times out, you will see the message: ```Boot failed: press a key to retry...``` In that case, press a key (I used ```Enter```) to return to the boot menu. This time, don't sit there reading the menu, press ```Enter``` immediately to start the boot process. 

The system boots to a login form. Log in as user 'root' with password 'root'. This will take you to an LXQt desktop environment. 

This is a fully-functional but non-persistent instance. If you wish, you can explore the environment and run programs. However, any work you save will be lost when you shut down the instance. In this state, the system is only a toy or demo environment.

## Install to disk

#### 1. Check your hard disk device

If you're working with VMware Fusion, you have a 20 GB drive at ```/dev/sda```. Verify this, or discover what you actually have in your case:

```shell
fdisk -l
``` 

In my case, I saw the virtual disk VMware Fusion created: 

```
Disk /dev/sda: 20 GiB, 21474836480 bytes, 41943040 sectors
Units: sectors of 1 * 512 = 512 bytes 
Sector size (logical/physical): 512 bytes / 512 bytes 
I/O size (minimum/optimal): 512 bytes / 512 bytes
``` 

If you see something similar to that, then you are where you should be at this stage. 

#### 2. Ensure partitions are created correctly 

Using VMware Fusion, you didn't explicitly define the partition map for the virtual disk drive. Check what was generated to see that it comforms with requirements to install exGENT:

```shell
parted /dev/sda print
``` 

In my case, this is what I saw:

```
Error: /dev/sda: unrecognized disk label 
Model: VMware, VMware Virtual S (scsi)
...and other information...
``` 

This means no partitions are defined on the virtual drive. I defined partitions this way:

```shell
Partition  Filesystem      Size      Description 
/dev/sda1  (bootloader)    2 MB      BIOS boot partition
/dev/sda2  ext2            128 MB    Boot system partition 
/dev/sda3  (swap)          512 MB    Swap partition
/dev/sda4  ext4            remainder Root partition
```

Here are the commands to create those partitions using ```parted```. Note that ```(parted)``` is the prompt displayed by the parted repl; don't type ```(parted)``` when you enter the commands on your system. 

```shell 
parted -a optimal /dev/sda 
(parted) mklabel gpt
(parted) unit mib
(parted) mkpart primary 1 3
(parted) name 1 grub
(parted) set 1 bios_grub on
(parted) mkpart primary 3 131 
(parted) name 2 boot 
(parted) set 2 boot on
(parted) mkpart primary 131 643
(parted) name 3 swap 
(parted) mkpart primary 643 -1
(parted) name 4 rootfs
(parted) quit
```

Now when you run

```shell
parted /dev/sda print
```

You should see something like this:

```
Number  Start    End      Size      File system  Name    Flags
 1      1049kB   3146kB   2097kB                 grub    bios_grub
 2      3146kB   137MB    134MB                  boot    boot, esp
 3      137MB    674MB    537MB                  swap
 4      674MB    21.5GB   20.8GB                 rootfs
```

#### 3. Create file systems 

Create file systems for the grub and boot partitions:

```shell
mkfs.ext2 /dev/sda1
mkfs.ext2 /dev/sda2 
```

At this point, we are ready for Step 3 as documented on the [installation instructions](http://exgent.exton.net/?page_id=25) page on Exton's site. 

Create the file system for the rootfs partition according to Arne's instructions:

```shell 
mke2fs -L / -I 128 -F -j -O dir_index /dev/sda4
```

#### 4. Install into the root filesystem 

Continuing with Step 4 of the instructions of the [installation instructions](http://exgent.exton.net/?page_id=25). First argument is the install partition and second argument is the swap partition.

```shell
cd /root/install
./install /dev/sda4 /dev/sda3
```

#### 5. Install grub boot loader (this part does not work)

Here the procedure differs from the basic installation instructions. The following sequence of commands is from Arne's email. He suggested this _instead of_ running the ```./install_boot.sh``` script mentioned in the standard instructions. As far as I know this is not documented elsewhere.

It results in ```failed to get canonical path: /dev/sda4``` on the ```grub-install``` command.

```shell
mkdir /mnt/sda4
mount /dev/sda4 /mnt/sda4
mount -t proc proc /mnt/sda4/proc
mount -o bind /sys /mnt/sda4/sys
mount --bind /dev /mnt/sda4/dev
mount -o bind /dev/pts /mnt/sda4/dev/pts
chroot /mnt/sda4 /bin/bash 
grub-install /dev/sda         <======= failed to get canonical path: /dev/sda4
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount /mnt/sda4/proc
umount /mnt/sda4/sys
umount /mnt/sda4/dev/pts
umount /mnt/sda4/dev
umount /mnt/sda4
```

I was unable to find any useful help online. I tried a number of variations, and ended up with the following. This goes further than the original commands. On boot, a grub menu is displayed. The boot does not complete. It get ```Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)```. I was unable to find usable help for this problem. 

```shell 
mkdir /mnt
mount /dev/sda4 /mnt
mount -t proc proc /mnt/proc
mount -o bind /sys /mnt/sys
mount --bind /dev /mnt/dev
mount -o bind /dev/pts /mnt/dev/pts
chroot /mnt /bin/bash 
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount /mnt/proc
umount /mnt/sys
umount /mnt/dev/pts
umount /mnt/dev
umount /mnt
```

This was as close as I came to a bootable system. 

At this point I decided I had invested enough time in the effort. Done. 
