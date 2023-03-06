# vscode
# export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

# git
alias gco="git fetch && git checkout"
alias gnb="git fetch && git checkout -b"
alias ga="git add"
alias push="git push"
alias pull="git pull"
alias fwl="git push --force-with-lease"
alias gaa="git add ."
alias gst="git status"
# alias gcm="git commit -m $@ && git push"
function gcm() {
    git commit -m "$1"
    git push
}
alias grc="git fetch && git rebase --continue"
alias merge="git fetch && git merge"
alias log="git log --oneline"
alias last="git log -1 HEAD --stat"
alias startgit='cd `git rev-parse --show-toplevel` && git checkout master && git pull'
alias inst='cd ui; pnpm install; gco origin/tom/layout vite.config.js; pnpm dev'
alias dev='cd ui; gco origin/tom/layout vite.config.js; pnpm dev'
alias pret='cd ui; pnpm prettier'
alias port='cd ~/portal-branches/development'
alias cg='cd `git rev-parse --show-toplevel`'

# bash
# export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
alias sour="source ~/.bashrc && source ~/.bash_profile"
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
# export PATH=$PATH:/Users/bradyanthony-brumfield/Library/Python/3.8/bin
alias p="python3"
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
alias jup='conda activate jupyterlab-debugger && jupyter-lab'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/bradyanthony-brumfield/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/bradyanthony-brumfield/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/bradyanthony-brumfield/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/bradyanthony-brumfield/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# pnpm
export PNPM_HOME="/home/blabrumfield/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# colorize Git Branch - something else in this file overwrites this if it's not placed at the end

parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Folder Color

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
