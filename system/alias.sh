# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc
alias less='less -R'                          # raw control characters
alias cl='clear'

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

# Run dot container
alias dot-disp='docker run --name dot --hostname disp --rm -itd -v projects:/home/kevin/projects -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/.ssh:/home/kevin/.ssh --network host ghcr.io/kebien6020/dotfiles tail -f /dev/null'
alias dot='docker exec -it dot bash'
alias dot-rm='docker rm -f dot'
alias dot-pull='docker pull ghcr.io/kebien6020/dotfiles'

alias gswitch='git branch -a --format="%(refname:short)" | fzf --preview="git lg {}" --bind="enter:execute(git switch {})" --preview-window=up'
