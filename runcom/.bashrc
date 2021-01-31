# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# Completion options

# Any completions you add in ~/.bash_completion are sourced last.
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options

# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

# Aliases

if [ -f "${HOME}/.bash_aliases" ]; then
  source "${HOME}/.bash_aliases"
fi
