[top](README.md)

# Create base for lightweight development environment

## From -> To

**From:** You have an iso or the means to create one.

**To:** You have a base OS instance configured to run provisioning tools.  

## Characteristics

- Operating System: Linux/Unix variants
- Provisioning tools: Bash, Chef
- Window system: X
- Window manager: OpenBox
- Terminal emulator: See note [1]
- Default editor: NeoVim (preferred) or Vim 
- Development and testing tools: (selectable)
- Database systems: (selectable)

## Dependencies 

- ```dev``` or ```developer```[2] with password ```developer``` defined 
- ```root``` user defined with password ```admin``` 
- bash 4 or later installed as default shell 
- network support enabled 
- ssh server support installed
- git command line client installed
- ruby version installed that supports current chef version (for Chef 2.0.28, that is Ruby 2.4 or later)

## Notes 

[1] For Debian and derivatives, ```lxterminal``` is installed. For CentOS/Fedora and derivatives, ```rxvt-unicode-256color``` is installed (```urxvt256c```). 

[2] For CentOS, the user name ```dev``` is reserved. The bootstrap script creates user ```developer``` instead. 



