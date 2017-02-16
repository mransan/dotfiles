set -o vi
#
# history search using up/down
#
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"OA": history-search-backward'
bind '"OB": history-search-forward'

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

alias truncdir='pwd'
PS1='\[\033[0;32m\]\u@\h:\[\033[0;36m\]`truncdir`\n\[\033[00m\]\$ '

