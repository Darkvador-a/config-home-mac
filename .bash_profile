# Get the Git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Make Git branch a variable
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

# Add context|namespace kubernet
#
# Source: https://github.com/jonmosco/kube-ps1
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"

PS1='$(kube_ps1)\[\033[01;31m\]\w\[\033[00m\]\n${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u\[\033[01;32m\]@\[\033[01;34m\]\h\[\033[00m\]\$ '
# Custom bash prompt
#
# Includes custom character for the prompt, path, and Git branch name.
#
# Source: kirsle.net/wizards/ps1.html
export PS1="$PS1\[$(tput setaf 3)\]\$(parse_git_branch)\[$(tput sgr0)\]"




export PATH=/opt/local/bin:/opt/local/sbin:${PATH}

# Aliases

## Shortcuts
alias ll='ls -al'
#alias editgit='atom ~/.gitconfig'
#alias editbash='atom ~/.bash_profile'
alias resource='source ~/.bash_profile && echo "Done!"'
alias vi=vim
alias josh=sudo
alias ..=cd ..

## Git commands
alias log='git log'
alias wut='git log master...${branch} --oneline'
alias diff='git diff'
alias branch='git branch'
alias st='git status'
alias fetch='git fetch'
alias push='git push origin head'
alias pull='git pull'
alias fp='fetch && pull'
alias gmm='git merge master'
alias recent='git for-each-ref --sort=-committerdate refs/heads/'
alias branch_new="git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)'"
alias rm-branch="git branch --merged | egrep -v \"(^\*|master|main|dev)\" | xargs git branch -d"

## Git branch switching
alias master='git co master'
alias ghp='git co gh-pages'

## Switch repos
DIR=~/work
alias h='cd ~/'
alias w='cd ${DIR}'
alias bs='cd ${DIR}/bootstrap'

## Core GitHub apps
alias gh='cd ~/github'
alias gg='cd ~/github/github'

## Server guick starts
alias ss='script/server'
alias js='bundle exec jekyll serve --watch'
alias ps='python -m SimpleHTTPServer 4000'
alias gtest='testrb test/integration/bundle_test.rb'

## Mobile iOS testing
alias ios='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
