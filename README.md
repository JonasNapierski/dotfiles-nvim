# NVim Configuration
Hello, this is my "custom" nvim configuration. Currently it is mostly a replicaof different youtube and blog posts. After a while this will be more custom


## Installation
Install `neovim` and `neovim.packer`

## Arch
```
yay -S nvim-packer-git
```

## Other
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```


## Supported Languages

- lua
- c
- python
- Rust
- (incomming) JavaScript

## Structure

`lua/jpudel/` inside the folder a general settings for my nvim config, for example `remap.lua` in there are all the git shortcuts etc

`lua/plugin_config` contains to every plugin in a seperated lua file the configuration
## Todos 

- [ ] Add install script to simplify the installation process
- [ ] configure vim-dadbod and vim-dadbod-ui prop. 
- [ ] Add support for autocompiling markdown files and open them with evince (a default pdf viewer for ubuntu)
## What is the Purpose of this Repo

Currently this just a place for me to update my configuration. This will change in the future. 
