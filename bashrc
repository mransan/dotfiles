#
# history search using up/down
#
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

#
# don't put duplicate lines in the history. See bash(1) for more options
#
export HISTCONTROL=ignoredups

#
# remember 10000 commands
#
export HISTFILESIZE=100000

#
#
#
. $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
