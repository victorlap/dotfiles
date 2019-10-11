# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadcli="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -ahlF --color --group-directories-first"
weather() { curl -4 wttr.in/${1:-enschede} }
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"
alias zbundle="antibody bundle < $DOTFILES/zsh_plugins.txt > $DOTFILES/zsh_plugins.sh"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"

# Laravel
alias art="php artisan"
alias mfs="php artisan migrate:fresh --seed"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"

# Docker
alias docker-stop-all='docker container stop $(docker container ls -aq)'
alias dcupd="docker-compose up -d"
#alias dpurgecontainers="dstop && docker rm $(docker ps -a -q)"
#alias dpurgeimages="docker rmi $(docker images -q)"
#dbuild() { docker build -t=$1 .; }
dcsh() { docker exec -it $(docker ps -aqf "name=${1:-app}") bash; }

# Git
alias commit="git add . && git commit -m"
alias gcommit="git add . && git commit"
alias amend="git commit --amend --no-edit"
alias amendall="git add . && amend"
alias wip="commit wip"
alias gs="git status"
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"
#alias resolve="git add . && git commit --no-edit"
alias gl="git log --oneline --decorate --color"
alias nah="git clean -df && git reset --hard"
