# dotfiles

My personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)
- [Neovim](https://neovim.io/)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [Zsh](https://www.zsh.org/) + [Oh My Zsh](https://ohmyz.sh/)
- [Git](https://git-scm.com/)

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

Install vim-plug, then the Neovim plugins:

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qa
```

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
├── nvim/                    # Neovim (vim-plug)
│   └── .config/
│       └── nvim/
│           └── init.vim
├── Makefile
├── .stow-local-ignore
└── README.md
```

## Local overrides

- **Git**: Copy `git/.gitconfig.local.example` to `~/.gitconfig.local` and fill in your name/email.
- **Zsh**: Create `~/.zshrc.local` for machine-specific config (auto-sourced).
- **Nvim**: Add `Plug '...'` lines to `nvim/.config/nvim/init.vim`, then run `:PlugInstall`.

## License

[MIT](LICENSE.md)
