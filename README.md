# dotfiles

My personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)
- [Neovim](https://neovim.io/) (>= 0.10)
- [Zsh](https://www.zsh.org/) + [Oh My Zsh](https://ohmyz.sh/)
- [Git](https://git-scm.com/)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for Telescope live grep)
- A [Nerd Font](https://www.nerdfonts.com/) (for icons in nvim)

## Installation

### On a new machine

```bash
# Clone the repo
git clone git@github.com:egraba/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install everything
make install

# Or install individual packages
make stow-git
make stow-zsh
make stow-nvim
```

Neovim plugins will auto-install on first launch via lazy.nvim.

### Uninstall

```bash
# Remove all symlinks
make uninstall

# Or remove individual packages
make unstow-git
```

## Structure

```
~/dotfiles/
├── git/                     # Git configuration
│   ├── .gitconfig
│   └── .gitconfig.local.example
├── zsh/                     # Zsh + Oh My Zsh
│   ├── .zshrc
│   └── .oh-my-zsh/
│       └── custom/
│           ├── aliases.zsh
│           └── exports.zsh
├── nvim/                    # Neovim (Lua + lazy.nvim)
│   └── .config/
│       └── nvim/
│           ├── init.lua
│           └── lua/
│               ├── config/
│               │   ├── lazy.lua
│               │   ├── options.lua
│               │   ├── keymaps.lua
│               │   └── autocmds.lua
│               └── plugins/
│                   ├── colorscheme.lua
│                   ├── treesitter.lua
│                   ├── lsp.lua
│                   ├── completion.lua
│                   ├── telescope.lua
│                   ├── filetree.lua
│                   ├── statusline.lua
│                   ├── git.lua
│                   └── editing.lua
├── Makefile
├── .stow-local-ignore
└── README.md
```

## Local overrides

- **Git**: Copy `git/.gitconfig.local.example` to `~/.gitconfig.local` and fill in your name/email.
- **Zsh**: Create `~/.zshrc.local` for machine-specific config (auto-sourced).
- **Nvim**: Add plugin specs to `nvim/.config/nvim/lua/plugins/` — lazy.nvim auto-loads all `.lua` files in that directory.

## License

[MIT](LICENSE.md)
