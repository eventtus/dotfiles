# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

shoot() {
  ps ax | grep $1 | grep -v grep | awk '{print $1}' | xargs kill -9
}

bugem() {
  bundle update $@ && git add Gemfile.lock && git commit -m "Updated gem(s): $@"
}

# ALIASES
alias nets='netstat -an | grep LISTEN'
alias reload='source ~/.zshrc'
alias ..='cd ..'

# RAILS ALIASES
alias rup='git pull && bundle && rake db:migrate && foreman start'

# GIT ALIASES
alias j='git'
alias ja='git add -A'
alias jap='git add -p'
alias jb='git branch'
alias jba='git branch -va'
alias jbm='git branch --merged'
alias jc='git commit'
alias jgc='git fetch -p && git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d && git gc --prune=now'
alias jca='git commit --amend --no-edit'
alias jcp='git cherry-pick'
alias jd='git diff -u'
alias jdc='git diff -u --cached'
alias jf='git fetch'
alias ji='git update-index --assume-unchanged'
alias jii='git update-index --no-assume-unchanged'
alias jl='git log'
alias jls='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
alias jm='git merge --no-edit'
alias jlp='git log -p --stat'
alias jo='git checkout'
alias jp='git push -u origin HEAD'
alias jph='git push heroku'
alias jpa='git push --all'
alias js='git status'
alias jswitch='git commit -am "WIP" && git checkout master && git pull origin master'
alias jtb='git branch --set-upstream-to=origin/`git rev-parse --abbrev-ref HEAD` `git rev-parse --abbrev-ref HEAD`'
alias ju='git reset HEAD'
alias jx='git stash'
alias jxp='git stash pop'
alias jy='echo "Synchronizing...\n1. Pulling:\n------------" && git pull && echo "\n2. Pushing:\n------------" && git push && tn "Git sync complete"'
alias jup='echo "Pulling from upstream: " && git checkout master && git pull upstream master'

jt() {
  git tag -a "$@" -m "v$@" && git push --tags
}


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ruby rails rake bundler coffee textmate terminalapp battery brew osx postgres)

source $ZSH/oh-my-zsh.sh

# AWS CLI
#source /usr/local/share/zsh/site-functions/_aws
# eval `boot2docker shellinit 2>/dev/null`

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export RAILS_ENV=development
export RACK_ENV=development
export EDITOR='vim'
export PORT=3000

# Defaults
export PATH=/opt/local/bin:/usr/local/sbin:/usr/local/bin:$PATH

umask 022
