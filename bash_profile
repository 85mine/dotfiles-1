stty -ixon
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
function _update_ps1() {
    PS1="$(powerline-go  -modules=venv,user,ssh,cwd,git,exit,root,jobs,perms  -cwd-max-depth=1 -truncate-segment-width=0 $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
export EDITOR=vim
export PATH=/Users/phucngo/.config/yarn/global/node_modules/.bin:$PATH
export PATH=/usr/local/php5/bin:$PATH
export PATH=/usr/local/bin:$PATH
export GOPATH=/Users/phucngo/workspace/go
export PATH=$GOPATH/bin:$PATH
alias w="cd ~/workspace"
alias gw="cd /Users/phucngo/workspace/go/src/github.com/remotefulltime"
alias gl="git log --graph"
alias gs="git status"
alias gf="git diff"
alias gb="git branch"
alias ll="ls -al"

# home local dev server
alias apidev="ssh phuc@192.168.1.7"
