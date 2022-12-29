# My dotfiles

![Main](https://user-images.githubusercontent.com/9450943/132948362-f8a47d32-05ef-4cbe-a592-e97ac933bf42.png)

Some of the configuration includes:

* Editor - [neovim](https://neovim.io)
    * Configured in Lua
    * See [`config/nvim/lua/j/plugins.lua`](./config/nvim/lua/j/plugins.lua) for 
      the used plugins
    * [Palenightfall color 
      scheme](https://github.com/JoosepAlviste/palenightfall.nvim)
    * Neovim's built-in LSP client
    * [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter/) 
      for highlighting
    * [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim) for 
      navigation
* Terminal emulator - [Kitty](https://sw.kovidgoyal.net/kitty)
* Shell - [Zsh](https://www.zsh.org) (custom configuration)
* [Wallpaper](https://www.reddit.com/r/wallpapers/comments/d6jy5b/mount_palenight6000_3892/)


## Installation

```sh
git clone --recurse-submodules git@github.com:JoosepAlviste/dotfiles.git

cd dotfiles
chmod +x bin/makesymlinks.sh
./bin/makesymlinks.sh
```

This will symlink all of the files and folders inside `dots/` into your home 
folder prefixed by `.` and everything from `config/` to your `~/.config/` 
folder.

The next time you start `vim`, it will automatically install `lazy.nvim` and Vim 
plugins. You should run `:MasonInstallAll` in order to install the required 
external programs. Also, check out 
[`packages_list.md`](./resources/packages_list.md) for extra programs to 
install.

The utility scripts in `bin/` are automatically added to the Zsh path, so you 
can run `makesymlinks` anywhere.


## Update

```bash
git pull
```

Maybe run `./bin/makesymlinks.sh` again.


## Neovim configuration structure

The Neovim configuration is split into many files and is located in 
[`config/nvim/`](./config/nvim).

* [`autoload/`](./config/nvim/autoload): functions that are used in other files 
  and can be autoloaded. I still have a few functions here that I haven't 
  converted to Lua.
* [`ftplugin/`](./config/nvim/ftplugin): configuration for specific file types
* [`lua/j/`](./config/nvim/lua/j): Lua files for settings, mappings, and my own 
  modules
* [`lua/j/plugins/`](./config/nvim/lua/j/plugins): configuration of plugins
* [`lua/j/plugins/lsp/`](./config/nvim/lua/j/plugins/lsp): configuration for 
  Neovim's built-in LSP
* [`init.lua`](./config/nvim/init.lua): basic settings and requiring other files


## More screenshots

![Busy](https://user-images.githubusercontent.com/9450943/132948366-4ae42714-2c3c-4ba5-a2fb-7bfc685764dd.png)

![Finder](https://user-images.githubusercontent.com/9450943/132948367-beb6b50e-29b9-4d0c-afc5-8d82e468e9dc.png)

![Completion](https://user-images.githubusercontent.com/9450943/132948371-e1c92844-ed43-4b30-a360-e8e284b4cf13.png)
