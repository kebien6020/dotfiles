# Profiling
# PS4='+ $(/opt/homebrew/opt/coreutils/bin/gdate "+%s.%N")\011 '
# exec 3>&2 2>/tmp/bashstart.$$.log
# set -x

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# System completions
[[ -f /etc/bash_completion ]] && . /etc/bash_completion


# Source all
DOT=$HOME/.dotfiles
source "$DOT/system/alias.sh"
source "$DOT/system/env.sh"
source "$DOT/system/functions.sh"
source "$DOT/system/prompt.sh"
source "$DOT/system/shell.bash"
source "$DOT/system/os.sh"
source "$DOT/system/colored-man.sh"

# Source local settings for this particular system
[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local

# Stop Profile
# set +x
# exec 2>&3 3>&-
