ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git)

export PATH="/usr/local/bin:$PATH"
export EDITOR='vim'

source $ZSH/oh-my-zsh.sh

# apparentally needed for mactex?
# according to brew cask it should be placed in .zprofile, but
# zsh documentation states, that .zprofile should not change
# shell environment at all.
eval `/usr/libexec/path_helper -s`

if [ ! $(uname -s) = "Darwin" ]; then
  # Simulate OSX's pbcopy and pbpaste on other platforms
  alias pbcopy='xclip -sel clip -i'
  alias pbpaste='xclip -sel clip -o'
fi

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# shortcuts for folders
p() { cd ~/projects/$1; }
_p() { _files -W ~/projects -/; }
compdef _p p

h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h

c() { cd ~/projects/clojure/$1; }
_c() { _files -W ~/ -/; }
compdef _c c

# autocorrect is more annoying than helpful
unsetopt correct_all

# a few aliases I like
alias gs='git status'
alias gd='git diff'
alias vimrc='vim ~/.vimrc'

#alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vim='/usr/local/bin/nvim'
alias n='/usr/local/bin/nvim'

# for lilypond
export PATH=$PATH:~/bin

# for nvim
export LANG="en_US.UTF-8"
