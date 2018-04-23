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
