# Shortcuts
alias copyssh='pbcopy < $HOME/.ssh/id_rsa.pub'
alias reloadcli='source $HOME/.zshrc'
alias reloaddns='dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
alias ll='/usr/local/opt/coreutils/libexec/gnubin/ls -ahlF --color --group-directories-first'
weather() { curl -4 wttr.in/${1:-enschede} }
alias phpstorm='open -a /Applications/PhpStorm.app '`pwd`''
alias shrug='echo "¯\_(ツ)_/¯" | pbcopy'
alias c='clear'
alias zbundle='antibody bundle < $DOTFILES/zsh_plugins.txt > $DOTFILES/zsh_plugins.sh'
alias pw='pwgen -s1 32 | pbcopy'
bak() { cp $1{,.bak}; }
expiry() { echo | openssl s_client -servername $1 -connect $1:443 2>/dev/null | openssl x509 -noout -enddate}

# Directories
alias dotfiles='cd $DOTFILES'
alias library='cd $HOME/Library'
alias sites='cd $HOME/Sites'

# Laravel
alias art='php artisan'
alias mfs='php artisan migrate:fresh --seed'

# PHP
alias cfresh='rm -rf vendor/ composer.lock && composer i'

# JS
alias nfresh='rm -rf node_modules/ package-lock.json && npm install'
#alias watch='npm run watch'

# Docker
alias docker-stop-all='docker container stop $(docker container ls -q) || true'
alias dcupd='docker-compose up -d'
alias dcopen='open http://${PWD##*/}.elnino-local.com'
dcsh() { docker exec -it $(docker ps -qf "name=${1:-app}") sh; }
dclog() { docker-compose logs ${1:-app} $2}
elninoup() { cd ~/Sites/elnino/elnino-docker-dev; docker-compose up -d; cd -; docker-compose up -d }

# Git
alias commit='git add . && git commit -m'
alias gcommit='git add . && git commit'
alias amend='git commit --amend --no-edit'
alias amendall='git add . && amend'
alias wip='commit wip'
alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
#alias resolve='git add . && git commit --no-edit'
alias gl='git log --oneline --decorate --color'
alias nah='git clean -df && git reset --hard'

# Kubernetes
s4connect() {
    export S3_ACCESS_KEY=$(kubectl -n rook-ceph get secret rook-ceph-object-user-object-store-${1} -o yaml | grep ' AccessKey' | awk '{print $2}' | base64 --decode)
    export S3_SECRET_KEY=$(kubectl -n rook-ceph get secret rook-ceph-object-user-object-store-${1} -o yaml | grep ' SecretKey' | awk '{print $2}' | base64 --decode)
    export AWS_ACCESS_KEY_ID=$S3_ACCESS_KEY
    export AWS_SECRET_ACCESS_KEY=$S3_SECRET_KEY
}
alias s4pf='kubectl port-forward -n rook-ceph svc/rook-ceph-rgw-object-store 8000:80'
alias s4='s4cmd --endpoint-url=http://localhost:8000'
alias s5='s5cmd --endpoint-url=http://localhost:8000'

alias loc='open https://$(basename $(pwd)).elnino-local.com'
alias dev='open https://$(basename $(pwd)).k.elnino-dev.com'
alias acc='open https://$(basename $(pwd)).k.elnino-acceptance.com'
alias prod='open https://$(basename $(pwd)).k.elnino-production.com'

alias conf='kubectl get -o yaml cm $(basename $(pwd))-config'
# edit project config in current namespace
alias econf='kubectl edit -o yaml cm $(basename $(pwd))-config'
# restart deployment, for config changes to go into effect
alias roll='kubectl rollout restart deployment $(basename $(pwd))'
# view logs of pods of project in current namespace
alias logs='kubectl logs --tail=100 -f -l app=$(basename $(pwd)) -c=$(basename $(pwd)) '
# open gitlab page for current project
alias gitlab='open https://gitlab.elnino.tech/$(git config --get remote.origin.url | cut -d: -f2 | cut -d. -f1)'
# open gitlab pipelines page for current project
alias pipe='open https://gitlab.elnino.tech/$(git config --get remote.origin.url | cut -d: -f2 | cut -d. -f1)/pipelines'
# open the last pipeline for the current project for the current branch (handy for just after git push) needs glab installed/configured
alias pipes='open https://gitlab.elnino.tech/$(git config --get remote.origin.url | cut -d: -f2 | cut -d. -f1)/pipelines/$(glab pipeline list | grep -m1 $(git rev-parse --abbrev-ref HEAD --) | cut -d\# -f2 | cut -d\  -f1)'


alias retry='until $@; do sleep 1; done; say Done'
