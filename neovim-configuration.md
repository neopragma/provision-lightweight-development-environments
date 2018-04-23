[top](README.md)

## NeoVim configuration 

The following NeoVim plugins and configuration settings are included in the base build. (Language-specific customization may add more, and you can change whatever you wish.) 

### Settings 

- Editor shows line numbers
- Can split the editor screen horizontally to open a shell
- Enable filetype-specific plugins and indentation support

### Color scheme

- Spacegray

### Plugins 

- Shougo/deoplete - multi-language code completion 
- neomake/neomake - asynchronous linting support
- scrooloose/nerdtree - integrated file browser
- Xuyuanp/nerdtree-git-plugin - adds git status indicators to nerdtree

### Language editing support 

Because so many things are done with Bash, C/C++, Python, and Ruby, editor support for those languages is configured as part of the base build. For most languages, plugins support indentation, syntax highlighting, and code completion. You can add plugins to support quite a few additional languages.

There is no support for intellisense or assisted refactoring. 

Other than a plugin to display git status indicators, there is no integrated support for interacting with a version control system. The expectation is you will prefer to use the command line; otherwise, you probably would not be interested in this sort of minimal environment in the first place. 

Language-specific plugins in the base configuration:

- WolfgangMehner/bash-support
- WolfgangMehner/c-support
- klen/python-mode
- vim-ruby/vim-ruby

