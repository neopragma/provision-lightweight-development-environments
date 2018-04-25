[top](README.md)

## Common configuration 

For all operating systems, the base build includes the following:

- user account 'dev' with password 'developer', sudo-enabled if applicable
- user account 'root' with password 'admin'
- Ethernet and wireless networking support 
- ssh server configured to enable remote login as root (with password)
- X windows client and server
- a basic window manager (OpenBox if available, else Fluxbox if available, else whatever is available for the target platform)
- a terminal emulator (depends on platform)
- Chef Client (used in the provisioning process)
- git command line client 
- Bash 4, Ruby 2.4, Python, Python3, GNU C/C++
- NeoVim text editor with selected plugins

## OpenBox configuration

OpenBox configuration is as it comes, with the addition of a key binding to start a terminal emulator:

- Ctrl+t

## Aliases and symlinks 

In an attempt to keep all these environments generally consistent, the following are defined either as aliases or symlinks on each:

- **cli** - issued when using a terminal emulator in an X session, this closes OpenBox and returns you to the command line.
- **gui** - issued when working on the command line, this starts an X session and opens an instance of the terminal emulator. 
- **cook** - runs chef-client to re-run one or more recipes from the provisioning cookbook, in case you need to do that.
- **provision** - runs chef-client to re-run the entire provisioning script, in case you need to do that.
- **runchefspec** - runs the Chef unit checks (rspec specs), in case you need to do that.

## Notes 

[1] For Debian and derivatives, ```lxterminal``` is installed. For CentOS/Fedora and derivatives, ```rxvt-unicode-256color``` is installed (```urxvt256c```). 

[2] For CentOS, the user name ```dev``` is reserved. The bootstrap script creates user ```developer``` instead. 