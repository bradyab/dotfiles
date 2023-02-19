# vscode
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

# git
alias gco="git checkout -b"
alias ga="git add"
alias push="git push"
alias fwl="git push --force-with-lease"
alias gaa="git add ."
alias gst="git status"
alias gcm="git commit -m"
alias grc="git rebase --continue"
alias log="git log --oneline"
alias last="git log -1 HEAD --stat"
alias startgit='cd `git rev-parse --show-toplevel` && git checkout master && git pull'
alias cg='cd `git rev-parse --show-toplevel`'

# colorize Git Branch

parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Folder Color

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# bash
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
alias sour="source ~/.bash_profile && source ~/.bashrc"
alias bpf="code ~/.bash_profile"
alias brc="code ~/.bashrc"
alias ..='cd ..'
alias hist='history|grep'
alias rec='ls -t -1'
alias count='find . -type f | wc -l'
alias cpv='rsync -ah --info=progress2'

function gr() {
   grep -r "$@" .
   # grep -r -E -o ".{0,20}$@.{0,20}" *
}

# py
export PATH=$PATH:/Users/bradyanthony-brumfield/Library/Python/3.8/bin
alias p="python3"
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
alias jup='conda activate jupyterlab-debugger && jupyter-lab'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/bradyanthony-brumfield/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/bradyanthony-brumfield/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/bradyanthony-brumfield/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/bradyanthony-brumfield/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

