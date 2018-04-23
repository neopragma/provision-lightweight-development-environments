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

When prompted:

- Username: dev 
- Password: developer 

When prompted:

- Root password: admin

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
cd 
./bootstrap
``` 

### 3. Finish configuring NeoVim.

- Start neovim 
- Run the editor command :UpdateRemotePlugins
- Quit neovim

### 4. Known issues.

- Odd behavior on startx/xinit for non-root user; error messages appear but everything works anyway. Impact is 20 second delay before first terminal window is usable. Observed on Ubuntu Server 16.04 builds.
