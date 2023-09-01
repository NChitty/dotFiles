alias python="python3.10"

if command -v nvim &>/dev/null; then
    alias vim='nvim'
fi

function dlogs () {
    docker compose logs -f $1
}

function dnames() {
    for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
    do
    docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed '/"//g'
    done
}

alias dcr="docker compose run"
alias dce="docker compose exec"
alias dcu="docker compose up -d"
alias dcd="docker compose down"

alias windows="~/windows.sh"

