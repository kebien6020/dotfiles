# Don't put duplicate lines in the history.
timed export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

timed export EDITOR="nvim"
timed export SYSTEMD_EDITOR="nvim"
timed export DOT=$HOME/.dotfiles
timed export GPG_TTY; GPG_TTY="$(tty)"

timed export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
timed export LESSHISTFILE="${XDG_CONFIG_HOME}/lesshst"
timed export NODE_REPL_HISTORY="${XDG_CONFIG_HOME}/node_repl_history"
timed export TS_NODE_HISTORY="${XDG_CONFIG_HOME}/ts_node_repl_history"
timed export SQLITE_HISTORY="${XDG_CONFIG_HOME}/sqlite_history"
timed export BAT_THEME="TwoDark"

# Add home folder binaries (at the start)
export PATH=$HOME/bin:$PATH
