# Create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@" || return
}

function kev-package-review() {
	paru -Qq |
		fzf \
			--preview='paru -Qi {}; pactree -r {}' \
			--bind='ctrl-r:execute(paru -Rsc {})+reload(paru -Qq)' \
			--bind='ctrl-d:execute(paru -D --asexplicit {})+reload(paru -Qq)' \
			--bind='ctrl-f:preview(paru -Ql {})' \
			--bind='esc:change-query()'
}

function kev-package-review-orphans() {
	paru -Qqdt |
		fzf \
			--preview='paru -Qi {}; pactree -r {}' \
			--bind='ctrl-r:execute(paru -Rsc {})+reload(paru -Qqdt)' \
			--bind='ctrl-d:execute(paru -D --asexplicit {})+reload(paru -Qqdt)' \
			--bind='ctrl-f:preview(paru -Ql {})' \
			--bind='esc:change-query()'
}
