# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

export EDITOR="vim"
export DOT=$HOME/.dotfiles
export GPG_TTY; GPG_TTY="$(tty)"

# Add home folder binaries (at the start)
export PATH=$HOME/bin:$PATH
