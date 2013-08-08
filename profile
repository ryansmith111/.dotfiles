# add home bin dir for my own scripts

export PATH=~/bin:$PATH

# add brew bin to front of path to override system defaults
export PATH=/usr/local/bin:$PATH

# define NODE_PATH so npm libraries will be picked up
export NODE_PATH='/usr/local/lib/node_modules'

# add android tools to path
export PATH=$PATH:~/Development/android-adt/sdk/platform-tools:~/Development/android-adt/sdk/tools

# add npm module bin dir to path
export PATH=$PATH:/usr/local/share/npm/bin

# add brew nginx dir to path
export PATH=$PATH:/usr/local/sbin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# allow per-directory ack configuration
export ACKRC=".ackrc"

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

# todo.txt completion
source ~/.dotfiles/todo_completion
complete -F _todo t

# ALIASES
alias ls='ls -laFG'
alias rt='cd ~/Development/webapp-core'
alias g='git'
alias vtemp='rm ~/.vim/_temp/*'
# Dir navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias ll='tree --dirsfirst -ChFupDaLg'
# nginx aliases
alias nxklog='rm ~/Development/webapp-core/local/log/*'
alias nxtlog='tail -f ~/Development/webapp-core/local/log/*.log'
alias nxreload='nginx -c ~/Development/webapp-core/build/nginx/rw_portal-local/nginx/nginx.conf -s reload'
alias nx='nginx -c ~/Development/webapp-core/build/nginx/rw_portal-local/nginx/nginx.conf'
alias nxq='nginx -c ~/Development/webapp-core/build/nginx/rw_portal-local/nginx/nginx.conf -s quit'
alias nxr='rt;clear;nxreload;nxklog;nxtlog'
alias nxn='rt;clear;nxq;nxklog;nx;nxtlog'
alias nxps='ps -aef | grep nginx'

#git aliases
# brsync - list branches which are out of sync with their remote
alias brsync='git branch -a -v | sed -n -E -e "/(ahead|behind)/p"'

# SASS watch files
alias swatch='rt;sass -l -t expanded --watch  assets/sass/app.scss:build/css/app.css'

#'alias delta='/Applications/DeltaWalker.app/Contents/MacOS/Deltawalker -mi $0 $1'
# these aliases are needed because sucky rvm environment. see https://github.com/carlhuda/janus/wiki/Rvm
# for a more detailed explanation
alias vim='rvm system do /Applications/MacVim.app/Contents/MacOS/Vim $@'
alias mvim='rvm system do /Applications/MacVim.app/Contents/MacOS/MacVim $@'

# todo.txt
alias t='todo.sh -c -d ~/.dotfiles/.todo.cfg'
alias thelp='t help'
alias tprj='t lsprj'
alias tls='t ls'
alias tpv='t projectview'

set -o vi
