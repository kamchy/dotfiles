case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac

#------ Paths ----
export PATH=$PATH:$HOME/bin

#------ Git prompt ----
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
#PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \[\033[38;5;181m\] \$(__git_ps1)\[\033[00m\] \$ "

# Git autocomplete
source /etc/bash_completion.d/git-prompt
source /usr/share/bash-completion/completions/git
__git_complete gco _git_checkout
__git_complete gd _git_diff

