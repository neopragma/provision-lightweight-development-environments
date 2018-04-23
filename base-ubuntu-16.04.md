# Ubuntu 16.04 LTS: Build Base 

[top](README.md)

## From -> To

**From:** No operating system installed.

**To:** Ubuntu Server 16.04 LTS configured to receive provisioning to customize it for software development.

## 1. Install Ubuntu Server 16.04 LTS

### 1.1. Download iso

Download iso from <a href="https://www.ubuntu.com/download/server">https://www.ubuntu.com/download/server</a>.

### 1.2. Install Ubuntu Server 16.04 LTS.

Install Ubuntu Server as a VM (any [hypervisor](hypervisor.md)). 

### 1.3. Set a root password 

Ubuntu distros are intentionally configured with no root password as a way to encourage us to avoid logging in directly as root. To enable root login, create a root password as follows.

```shell 
sudo passwd  
``` 

When prompted, enter the dev password, 'developer'. 

When prompted for a new root password, enter 'admin'.

When prompted, re-type the root password.

## 2. Provision the instance as a "base" for development environments.

This will install enough software on the instance to enable it to be used as a template for building software development environments tailored to different programming languages and development/testing tools. 

### 2.1. Install git.

The provisioning scripts are on Github. The instance needs git support to clone the repository and complete the configuration. 

```shell 
sudo apt install -y git 
``` 

or

``` 
su - 
[enter root password]
apt install -y git
exit
```

### 2.2. Clone the repository.

Login as root. Clone the repository for Ubuntu Server 16.04:

```shell 
cd 
git clone git://github.com/neopragma/bootstrap-ubuntu-server-16.04-base
``` 

### 2.3. (Optional) Review default configuration and modify as desired.

If you want your template to be configured differently than the default, make the necessary changes to bash scripts, Chef recipes, and configuration files. 

In particular, look at:

- ubuntu_prep/recipes/install_neovim.rb - the ```pip2 --install``` command will probably not work if you are running this with ssh. When testing, I had to run it while logged into the target instance as root. Even if run locally, people have reported problems with it on Ubuntu 16.04. 
- openbox/autostart - this contains xrandr commands corresponding to the monitor I used when testing the script. There were problems with Ubuntu 16.04 getting Xorg configuration to work as documented. Including xrandr settings in the autostart file is a brute-force workaround. You might want to try configuring X the usual way on your instance, and it might work. 

The directory structure of the provisioning repository looks like this:

```
bootstrap-ubuntu-server-16.04-base/
    bootstrap              Bash script to prepare the instance to run Chef
                           and kick off the Chef cookbook that completes
                           the provisioning.

    scripts/               ```bootstrap``` copies these files to /usr/local/bin.
        cli                Escape from OpenBox to command line from terminal
        provision          Run the Chef cookbook to provision the instance
        cook               Run one Chef cookbook or cookbook::recipe
        recipes            List the available Chef recipes for provisioning
        runchefspec        Run `bundle exec rake` to run rspec on Chef recipes

    ubuntu_prep/           ```bootstrap``` copies these files to prepare Chef
        Gemfile            => /root/chef-repo/cookbooks/ubuntu_prep/
        Rakefile           => /root/chef-repo/cookbooks/ubuntu_prep/
        recipes/           => /root/chef-repo/cookbooks/ubuntu_prep/
        spec/
            spec_helper.rb => /root/chef-repo/cookbooks/ubuntu_prep/spec
            unit/recipes/  => /root/chef-repo/cookbooks/ubuntu_prep/spec/unit/recipes

    neovim/                Chef recipe ```install_neovim``` performs these copies.
                           => /root/.config/nvim/
                           => /dev/.config/nvim/

    openbox/               Chef recipe ```install_x``` performs these copies.
                           => /dev/.config/openbox/
```

### 2.4. Run the bootstrap script.

If all goes well, this will provision the instance as a base or template for building development environments. Check the results carefully in case of errors. There are many steps and anything can happen despite care in preparing the script. 

```shell 
cd /root/bootstrap-ubuntu-server-16.04-dev-base
./bootstrap
``` 

### 3. Manual configuration of NeoVim.

Some steps can't be scripted. 

#### 3.1. Install python support for NeoVim plugins.

There are issues on Ubuntu distros with pip2. Might require some fiddling.

```shell 
pip2 install --user neovim 
pip3 install --user neovim 
```

#### 3.2. Enable plugins 

One-time run of :UpdateRemotePlugins for certain plugins.

- Start neovim 
- Run the editor command :UpdateRemotePlugins
- Quit neovim

#### 3.3. Set NeoVim as the default editor 

The install_neovim Chef recipe installs NeoVim into the alternatives system, but you may have to make it the default selection manually:

```shell 
update-alternatives --config editor 
``` 

Choose the number corresponding to NeoVim and press Enter.


### 4. Known issues with the bootstrap process

#### 4.1. Please use apt-cdrom

You may get the error "Please use apt-cdrom to make this CD-ROM recognized by APT, apt-get update cannot be used to add new CD-ROMs".

Find out which lines in the sources list refer to CD-ROMs:

```shell 
cat /etc/apt/sources.list | grep cdrom
``` 

Comment those lines out of the sources list and re-run the script.

#### 4.2 update-alternatives reports broken link group

If the bootstrap script partially completes and you re-run it, you might see the following warnings:

```
update-alternatives: warning: forcing reinstallation of alternative /usr/bin/gem2.4 because link group gem is broken

update-alternatives: warning: forcing reinstallation of alternative /usr/bin/ruby2.4 because link group ruby is broken
```

This will not affect the installation and no corrective action is needed.

#### 4.3. dpkg status database is locked by another process

If you interrupt the bootstrap script while an `apt install` is in progress, the dpkg status lock file may not be deleted. When that happens you will get this message on re-running the script. 

Delete the lock file and reconfigure dpkg:

```shell 
rm /var/lib/dpkg/lock 
dpkg --configure -a 
```

### 5. Known issues after system comes up

#### 5.1. Errors from xinit/startx for non-root user

Odd behavior on startx/xinit for non-root user; error messages appear but everything works anyway. Impact is 20 second delay before first terminal window is usable. Observed on Ubuntu Server 16.04 builds.
