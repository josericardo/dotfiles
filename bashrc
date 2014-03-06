set -o vi

alias l="ls -lh"
alias la="ls -lha"
alias vv="vim ~/.vimrc"

export PYTHONDONTWRITEBYTECODE=true
export PYTHONIOENCODING=utf-8
export EDITOR=vim
export MAVEN_OPTS=-Xmx2024m
export GREP_OPTIONS="--color"
export HISTSIZE=100000

shopt -s histappend

function fname() { find . -iname "*$@*"; }
function psgrep() { ps axu | grep -v grep | grep "$@" -i --color=auto; }
function killany() { psgrep "$@" | awk ' { print $2 } ' | xargs kill -9; }
function extgrep() { grep -iR --include=$@ . ; }
function mvnnotests() { mvn clean install -DskipTests=true; }

# git
function galn() { git add $(sln $@); }
alias gau="git add -u"

alias .bert="bundle exec rake test"
alias .beri="bundle exec rake integration"
alias .ber="bundle exec rake"
alias .rbash="source ~/.bash_profile"

# thanks to http://en.newinstance.it/2010/05/23/git-autocompletion-and-enhanced-bash-prompt/
# Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi

GIT_PS1_SHOWDIRTYSTATE=true

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# all files under links in ~/bin are added to PATH
export PATH=${PATH}:$(find $HOME/bin -type l | tr '\n' ':' | sed 's/:$//')
