# Default to human readable figures
alias df='df -h'
alias du='du -h'

alias less='less -r'                          # raw control characters

# Color
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

# Shorthand for date: Use like `d +5min` -> 2021-02-11 03:55:10
alias d="date '+%D %T' -d"

# Curl for JSON REST APIs
alias jcurl='curl -H "Accept: application/json" -H "Content-Type: application/json"'
alias acurl='curl -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN"'

# Restore vim session
alias svim='vim -S Session.vim'
