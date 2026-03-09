# Create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@" || return
}

function fzf-paru() {
	cmd="$1"
	$cmd |
		fzf \
			--preview='paru -Qi {}; pactree -r {}' \
			--bind="ctrl-r:execute(paru -Rsc {})+reload($cmd)" \
			--bind="ctrl-d:execute(paru -D --asexplicit {})+reload($cmd)" \
			--bind='ctrl-f:preview(paru -Ql {})' \
			--bind='ctrl-t:preview(pactree {})' \
			--bind='esc:change-query()'
}

function kev-package-review() {
	fzf-paru 'paru -Qq'
}

function kev-package-review-orphans() {
	fzf-paru 'paru -Qqdt'
}

function kev-package-review-manual() {
	script=$(mktemp)
	trap 'rm -f "$script"' RETURN

	echo '#!/bin/bash' > "$script"
	echo 'comm -23 <(paru -Qqett | sort) <(paru -Qqg base-devel | sort | uniq)' >> "$script"
	chmod +x "$script"
	fzf-paru "$script"
}
