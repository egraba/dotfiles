# dotfiles
My personal dotfiles.

## Sources of inspiration
[Move your dotfiles to version control](https://opensource.com/article/19/3/move-your-dotfiles-version-control), 
an excellent (and simple) article from [Matthew Broberg](https://github.com/mbbroberg).

[dotfiles](https://dotfiles.github.io/tutorials/), a collection of tutorials to create your own dotfiles.

## Notes

### Installation
```
git clone git@github.com:egraba/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
```

### Neovim
Launch nvim, execute PlugInstall, update the plugins, and exit:
```
nvim
:PlugInstall
:UpdateRemotePlugins
:q!
:q!
```

