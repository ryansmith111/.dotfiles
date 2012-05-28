
# add home bin dir for my own scripts
export PATH=~/bin:$PATH

# add brew bin to front of path to override system defaults
export PATH=/usr/local/bin:$PATH

# define NODE_PATH so npm libraries will be picked up
export NODE_PATH='/usr/local/lib/node_modules'

# add npm module bin dir to path
export PATH=$PATH:/usr/local/share/npm/bin

# add brew nginx dir to path
export PATH=$PATH:/usr/local/sbin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# adds the current git branch to the command prompt in green surrounded by brackets
function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}
PS1="\h:\W \u\[\033[0;32m\]\$(parse_git_branch_and_add_brackets) \[\033[0m\]\$ "

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# git-flow completion
source ~/.dotfiles/git-flow-completion.bash

# ALIASES
alias ls='ls -laFG'
alias rt='cd ~/Development/webapp-core'
