#!/usr/bin/env sh

set -e
# set -x

C_CONFIG=~/.vim/coc-settings.json
mkdir -p ~/.vim
mkdir -p ~/.config/coc
[ -f "$C_CONFIG" ] || echo "{}" > "$C_CONFIG"

# eslint config
cat $C_CONFIG | jq "$(cat <<EOF
. * {
  "eslint.autoFixOnSave": true
}
EOF
)" -r > $C_CONFIG

# Purescript
cat $C_CONFIG | jq "$(cat <<EOF
. * {
  languageserver: {
    purescript: {
      "command": "purescript-language-server",
      "args": ["--stdio"],
      "filetypes": ["purescript"],
      "trace.server": "off",
      "rootPatterns": ["bower.json", "psc-package.json", "spago.dhall"],
      "settings": {
        "purescript": {
          "addSpagoSources": true,
          "addNpmPath": true
        }
      }
    }
  }
}
EOF
)" -r > $C_CONFIG

# Haskell
cat $C_CONFIG | jq "$(cat <<EOF
. * {
  languageserver: {
    "haskell": {
      "trace.server": "verbose",
      "detached": true,
      "command": "haskell-language-server-wrapper",
      "args": [ "--lsp", "--debug" ],
      "rootPatterns": [
        "*.cabal",
        "stack.yaml",
        "cabal.project",
        "package.yaml",
        "hie.yaml"
      ],
      "filetypes": [
        "haskell",
        "lhaskell"
      ],
      "initializationOptions": {
        "languageServerHaskell": {
          "hlintOn": false,
          "maxNumberOfProblems": 100,
          "completionSnippetsOn": false
        }
      }
    }
  }
}
EOF
)" -r > $C_CONFIG

# Rescript
cat $C_CONFIG | jq "$(cat <<EOF
. * {
  languageserver: {
    "rescript": {
      "enable": true,
      "module": "~/.vim/plugged/vim-rescript/rescript-vscode/extension/server/out/server.js",
      "args": ["--node-ipc"],
      "filetypes": ["rescript"],
      "rootPatterns": ["bsconfig.json"]
    }
  }
}
EOF
)" -r > $C_CONFIG

cat $C_CONFIG | jq .
