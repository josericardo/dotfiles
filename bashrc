set -o vi

alias l="ls -lh"
alias la="ls -lha"
alias vv="vim ~/.vimrc"

export PYTHONDONTWRITEBYTECODE=true
export PYTHONIOENCODING=utf-8
export EDITOR=vim
export GREP_OPTIONS="--color"
export HISTSIZE=100000

# prevents commands that start with a space from going into history 
# also ignore duplicate commands,
export HISTCONTROL=ignoreboth
export HISTIGNORE='ls:bg:fg:history'
export PROMPT_COMMAND='history -a'
shopt -s histappend

function fname() { find . -iname "*$@*"; }
function psgrep() { ps axu | grep -v grep | grep "$@" -i --color=auto; }
function pipgrep() { pip freeze | grep "$@" -i --color=auto; }
function usevenv() { source ~/.python-venvs/$1/bin/activate ; }

fh() {
  $(cat ~/.bash_history | sort -u | selecta)
}

# git
function sln() { git s | cut -c4- | sed "$1q;d" ; }
function galn() { git add $(sln $@); }

# thanks to http://en.newinstance.it/2010/05/23/git-autocompletion-and-enhanced-bash-prompt/
# Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi

GIT_PS1_SHOWDIRTYSTATE=true

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# all files under links in ~/bin are added to PATH
PATH="${PATH}:~/bin"
export PATH=${PATH}:$(find $HOME/bin -type l | tr '\n' ':' | sed 's/:$//')

export PIP_DOWNLOAD_CACHE=$HOME/.pip_cache

# Run twolfson/sexy-bash-prompt
. ~/.bash_prompt

# https://github.com/kennethreitz/autoenv
source /usr/local/opt/autoenv/activate.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
