# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

export EDITOR="nvim"
export DOT=$HOME/.dotfiles
export GPG_TTY; GPG_TTY="$(tty)"

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export LESSHISTFILE="${XDG_CONFIG_HOME}/lesshst"
export NODE_REPL_HISTORY="${XDG_CONFIG_HOME}/node_repl_history"
export TS_NODE_HISTORY="${XDG_CONFIG_HOME}/ts_node_repl_history"
export SQLITE_HISTORY="${XDG_CONFIG_HOME}/sqlite_history"

# Add home folder binaries (at the start)
export PATH=$HOME/bin:$PATH
