# OS clipboard integration
function clip() {
  case "$OSTYPE" in
    linux*)
      if grep -q Microsoft /proc/version; then
        /mnt/c/Windows/System32/clip.exe "$@"
      else
        xsel -i --clipboard "$@"
      fi
      ;;
    cygwin*) clip.exe "$@" ;;
  esac
}

