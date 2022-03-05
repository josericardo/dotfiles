set -o vi

######################################################
# Python
######################################################

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

######################################################
# git
######################################################

function sln() { git s | cut -c4- | sed "$1q;d" ; }
function galn() { git add $(sln $@); }

######################################################
# Elixir
######################################################

# make it easy to run script installed by mix
PATH="$PATH:$HOME/.mix/escripts"

# persist iex commands history
export ERL_AFLAGS="-kernel shell_history enabled"
