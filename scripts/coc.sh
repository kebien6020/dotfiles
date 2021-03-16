#!/usr/bin/env sh
set -e
# set -x

C_CONFIG=~/.vim/coc-settings.json
touch $C_CONFIG

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

cat $C_CONFIG | jq .
