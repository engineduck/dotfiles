ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

#plugins=(git bundler brew gem)
plugins=(git web-search mercurial python git-flow)

export PATH="/usr/local/bin:$PATH"
export EDITOR='vim'

source $ZSH/oh-my-zsh.sh

if [ ! $(uname -s) = "Darwin" ]; then
  # Simulate OSX's pbcopy and pbpaste on other platforms
  alias pbcopy='xclip -sel clip -i'
  alias pbpaste='xclip -sel clip -o'
fi

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# based on rbates plugin
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
