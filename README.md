# My dotfiles

Some of the configuration includes:

* Editor - [neovim](https://neovim.io)
    * Configured in Lua
    * See [`config/nvim/lua/j/plugins/`](./config/nvim/lua/j/plugins) for 
      the used plugins
    * [Kanagawa color 
      scheme](https://github.com/rebelot/kanagawa.nvim)
    * Neovim's built-in LSP client
    * [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter/) 
      for highlighting
    * [`telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim) for 
      navigation
* Terminal emulator - [Kitty](https://sw.kovidgoyal.net/kitty)
* Shell - [Zsh](https://www.zsh.org) (custom configuration)
* [Wallpaper](https://www.reddit.com/r/ghibli/comments/16scnnt/i_made_a_set_of_totoro_wallpaper_for_pc_and/)


## Installation

```sh
git clone --recurse-submodules git@github.com:JoosepAlviste/dotfiles.git

cd dotfiles
chmod +x bin/makesymlinks
./bin/makesymlinks
```

This will symlink all of the files and folders inside `dots/` into your home 
folder prefixed by `.` and everything from `config/` to your `~/.config/` 
folder.

The next time you start `vim`, it will automatically install `lazy.nvim` and Vim 
plugins. You should run `:MasonInstallAll` in order to install the required 
external programs. Also, check out 
[`Brewfile`](./Brewfile) for extra programs to 
install.

The utility scripts in `bin/` are automatically added to the Zsh path, so you 
can run `makesymlinks` anywhere.


## Update

```bash
git pull
```

Maybe run `./bin/makesymlinks` again.


## Neovim configuration structure

The Neovim configuration is split into many files and is located in 
[`config/nvim/`](./config/nvim).

* [`lua/josean/`](./config/nvim/lua/j): Lua files for settings, mappings, and my own 
  modules
* [`lua/josean/plugins/`](./config/nvim/lua/j/plugins): configuration of plugins
* [`lua/josean/plugins/lsp/`](./config/nvim/lua/j/plugins/lsp): configuration for 
  Neovim's built-in LSP
* [`init.lua`](./config/nvim/init.lua): basic settings and requiring other files


## Screenshots
<img width="1890" alt="image" src="https://github.com/user-attachments/assets/19e78315-51d8-464f-ad5b-664eac2f7e38" />

[space] is <leader> I just happen to use space for my leader key
<img width="1038" alt="image" src="https://github.com/user-attachments/assets/969995c1-256a-4dbd-8e20-31175821c97d" />

