# Profiling
# PS4='+ $(/opt/homebrew/opt/coreutils/bin/gdate "+%s.%N")\011 '
# PS4='+ $(date "+%s.%N")\011 '
# exec 3>&2 2>/tmp/bashstart.$$.log
# set -x

# START_TIME=$(date "+%s.%N")

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

function timed() {
	# local start_time end_time elapsed
	# start_time=$(date "+%s.%N")
	"$@"
	# end_time=$(date "+%s.%N")
	# elapsed=$(echo "($end_time - $start_time) * 1000" | bc)
	# echo "'$*': ${elapsed}ms"
}

# Source all
DOT=$HOME/.dotfiles
timed source "$DOT/system/alias.sh"
timed source "$DOT/system/env.sh"
timed source "$DOT/system/functions.sh"
timed source "$DOT/system/prompt.sh"
timed source "$DOT/system/shell.bash"
timed source "$DOT/system/os.sh"
timed source "$DOT/system/colored-man.sh"

# System completions
[[ -f /etc/bash_completion ]] && timed source /etc/bash_completion

# Source local settings for this particular system
[[ -f ~/.bashrc.local ]] && timed source ~/.bashrc.local

# END_TIME=$(date "+%s.%N")
# echo "Bash startup: $(echo "($END_TIME - $START_TIME)*1000" | bc)ms"

# Stop Profile
# set +x
# exec 2>&3 3>&-
