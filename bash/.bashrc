#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

export EDITOR="vim"

# ignorespace and ignoredups
export HISTCONTROL=ignoreboth

# fix line overlapping
shopt -s checkwinsize

# pkgfile hook
source /usr/share/doc/pkgfile/command-not-found.bash
