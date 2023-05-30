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
ports() { lsof -nP -iTCP -sTCP:LISTEN | grep $1 }
tunup () {
    port=${1:-5000}
    echo "Forwarding web:5000 to local port $port"
    ssh -R 5000:127.0.0.1:$port stunning-tarantula
}

# Directories
alias dotfiles='cd $DOTFILES'
alias library='cd $HOME/Library'
alias sites='cd $HOME/Sites'


# Laravel
alias art='docker-compose exec app php artisan'
alias mfs='php artisan migrate:fresh --seed'

# PHP
alias cfresh='rm -rf vendor/ composer.lock && composer i'
alias cscripts='cat composer.json| jq .scripts'
# JS
alias nfresh='rm -rf node_modules/ package-lock.json && npm install'
alias watch='npm run watch'
alias nscripts='cat package.json | jq .scripts'

# Docker
alias docker-stop-all='docker container stop $(docker container ls -q) || true'
alias dcupd='docker-compose up -d'
alias dcopen='open http://${PWD##*/}.elnino-local.com'
dcsh() { docker exec -it $(docker ps -qf "name=${1:-app}") sh; }
dclog() { docker-compose logs ${1:-app} $2}
elninoup() { docker-compose -f ~/Sites/elnino/elnino-docker-dev/docker-compose.yaml up -d; docker-compose up -d }

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
alias kg='kubectl get'
alias kgp='kubectl get pod'
alias kgcm='kubectl get cm'
alias dev='kubens dev'
alias acc='kubens acceptance'
alias prod='kubens production'
kgg() {
  kubectl get $1 | grep $2
}

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


alias try='while true; do $@; done; say Done'
alias dbprod='kubectl -n production port-forward svc/mysql-shared 4002:3306'
alias dbacc='kubectl -n acceptance port-forward svc/mysql-shared 4001:3306'
alias dbdev='kubectl -n dev port-forward svc/mysql-shared 4000:3306'

smartresize() {
   mogrify -path $3 -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
}

