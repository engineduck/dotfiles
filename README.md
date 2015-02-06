# Dot Files

(Based on Ryan Bates Dot Files)

## Installation

```terminal
git clone git://github.com/engineduck/dotfiles ~/.dotfiles
cd ~/.dotfiles
rake install
```

## Features
Terminal shortcuts:
p -> ~/projects/
h -> ~

## Uninstall

To remove the dotfile configs, run the following commands. Be certain to double check the contents of the files before removing so you don't lose custom settings.

```
unlink ~/.bin
unlink ~/.gitignore
unlink ~/.gemrc
unlink ~/.gvimrc
unlink ~/.irbrc
unlink ~/.vim
unlink ~/.vimrc
rm ~/.zshrc # careful here
rm ~/.gitconfig
rm -rf ~/.dotfiles
rm -rf ~/.oh-my-zsh
chsh -s /bin/bash # change back to Bash if you want
```

Then open a new terminal window to see the effects.
