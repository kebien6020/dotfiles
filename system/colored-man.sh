# Setup less so that man-pages are colored
man() {
    LESS_TERMCAP_md=$'\e[01;34m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[38;5;34m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[42;30m' \
    LESS_TERMCAP_se=$'\e[0m' \
    command man "$@"
}
