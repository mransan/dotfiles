# 
# Setup vi mode 
#
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
# remember 130000 commands
#
export HISTSIZE=130000 HISTFILESIZE=-1

#
# Make sure the history between terminal is synced up
# see http://briancarper.net/blog/248.html
#
shopt -s histappend
export PROMPT_COMMAND="history -a; history -n"

#
# This is a simple PS1 which works great, more customizations can be found at
# ezprompt.net or bashrcgenerator.com
#
alias truncdir='pwd'
PS1='\[\033[0;32m\]\u@\h:\[\033[0;36m\]`truncdir`\n\[\033[00m\]\$ '

alias psme="ps -f -u $USER"
alias ls="ls --color"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#
# $HOME/.bashrc.local allows computer (ie work/home) specific commands
#
if [ -f "$HOME/.bashrc.local" ]; then source "$HOME/.bashrc.local"; fi

#
# Opam setup if present
#
if [ -f $HOME/.opam/opam-init/init.sh ]; then
  . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
fi

#
# Yarn setup if present
#
if [ -d "$HOME/.yarn/bin" ]; then
  export PATH="$HOME/.yarn/bin:$PATH";
fi

export EDITOR=vim

#
# Add $HOME/bin to path since this is where I usually put all my little
# scripts
#
if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH";
fi
