#!/bin/bash

if command -v tmux &> /dev/null && [ -n "&PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux new-session -A -s main -n home;
fi

main() {
  tmux set remain-on-exit on
  case "$1" in
    crypto)
      crypto $2
      ;;
  esac
}

crypto() {
  tmux neww -c ~/Projects/crypto -n crypto \;
  case "$1" in
    api)
     tmux neww -n crypto-api -c ~/Projects/crypto/code/crypto-api \; \
       splitw -v \;
     ;;
    ui)
     tmux neww -n crypto-ui -c ~/Projects/crypto/code/crypto-ui \; \
       splitw -v \;
      ;;
    *)
     tmux neww -n crypto-api -c ~/Projects/crypto/code/crypto-api \; \
       splitw -v \; \
       neww -n crypto-ui -c ~/Projects/crypto/code/crypto-ui \; \
       splitw -v \;
      ;;
  esac
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main "$@"
fi

