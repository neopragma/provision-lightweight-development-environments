[top](../README.md)

# Sabayon Server: FAIL

## tl;dr

After installation, every command fails with "invalid ELF header". The system thinks many, many .so files have the wrong magic number. I don't know if the .so files are really corrupted, or if something in Sabayon incorrectly "thinks" they are corrupted. In any case, it is not possible to run the package manager at all, and there is no documentation about this behavior on the Sabayon wiki, forum, or FAQ, so I did not find any way to fix the problem. 

Done.

The long story (which isn't so long, as the problem occurs very early on):

## 1. Install Sabayon Server

### 1.1. Download iso

Download the server edition of Sabayon Linux from <a href="https://www.sabayon.org/server/">https://www.sabayon.org/server/</a>.

### 1.2. Install Sabayon Server.

Install Sabayon Server as a VM (any [hypervisor](hypervisor.md)). 

Choose "Text Install".

Start the installation:

```shell
anaconda-installer
```

When prompted for installation options, select 

- Language Settings: choose yours (mine was English/US)
- Timezone Settings: choose yours (mine was US/Arizona)
- Installation Destination: choose yours (mine was VMware Virtual S), then 'c'
  - Autopartitioning Options: as you wish (mine was 2 Use All Space), then 'c'
  - Partition Scheme Options: as you wish (mine was 3 LVM), then 'c'
- Network Connection: choose yours (mine was Wired, and the installer correctly identified VMware's pseudo-Ethernet connection)
- User Creation: 
  - Fullname: Developer
  - Username: dev
  - Password: developer
  - Administrator: yes
  - Groups: wheel
- Root Password: root

Press 'b' to begin installation.

In my case, the installation completed in about 3 minutes. I was left at the root prompt. 

See if you can boot into the new system:

```
reboot now
```

I my case, the system booted cleanly and quickly. I logged in as dev/developer. The [Sabayon wiki](https://wiki.sabayon.org/index.php?title=En:Entropy) gives a couple of warnings to new users: 

- Don't use ```sudo``` to perform system maintenance, but rather switch to root with ```su -```. 
- Although Sabayon is based on Gentoo and portage is present in the system, use Sabayon's package manager, Entropy instead. They claim it "takes the best from Portage, Yum, and APT".

Entropy has two clients, Equo (command line) and Rigo (graphical). We have Equo on the server version.

FAIL: Every command gets "invalid ELF header" on some .so. Apparently every .so is hosed, or else something in Sabayon "thinks" the headers are wrong.

Worthless.
