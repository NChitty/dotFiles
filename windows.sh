#!/bin/bash

main() {
  case "$1" in
    crypto)
      crypto $2
      ;;
    nps)
      nps $2
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

nps() {
  if ! tmux has-session -t nps &> /dev/null; then
    tmux new-session -d -s nps -n nps -c ~/Projects/nps \;
  else
    tmux a -t nps \;
    return
  fi

  tmux neww -t nps: -n payments-api -c ~/Projects/nps/code/payments-api \; \
    neww -t nps: -n payments-core -c ~/Projects/nps/code/payments-core \;
  case "$1" in
    payments | pa | payments-api)
      ;;
    shim)
        tmux neww -t nps: -n gateway-shim -c ~/Projects/nps/code/gateway-shim \; \
        ;;
    westpac)
        tmux neww -t nps: -n westpac -c ~/Projects/nps/code/westpac-processor-service \; \
        ;;
    *)
        tmux neww -t nps: -n gateway-shim -c ~/Projects/nps/code/gateway-shim \; \
        neww -t nps: -n westpac -c ~/Projects/nps/code/westpac-processor-service \; \
        ;;
  esac
  tmux neww -t nps: -n jump -c ~
  tmux a -t nps \;
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main "$@"
fi

