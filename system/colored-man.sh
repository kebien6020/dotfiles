# Setup less so that man-pages are colored
man() {
	if [ "$COLUMNS" -gt 120 ]; then
		export MANWIDTH=120
	fi
    LESS_TERMCAP_md=$'\e[01;34m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[38;5;34m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[42;30m' \
    LESS_TERMCAP_se=$'\e[0m' \
    GROFF_NO_SGR=1 \
    command man "$@"
}
