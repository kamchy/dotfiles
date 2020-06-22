case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac

#------ Paths ----
JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$PATH:$HOME/bin:$HOME/.local/bin:$JAVA_HOME

#------ Git prompt ----
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
#PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "



# start of StackOverflow answer
# https://stackoverflow.com/questions/16715103/bash-prompt-with-last-exit-code
PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

__prompt_command() {
    local EXIT="$?"             # This needs to be first
    PS1=""

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Cya='\[\e[0;36m\]' 
    local Pur='\[\e[0;35m\]'

    if [ $EXIT != 0 ]; then
        PS1+=" ${Red}"      # Add red if exit code non 0
    else
        PS1+=" ${Gre}"
    fi
    # see bash manual, PROMPTING section for details
    PS1+="\u@\h${BYel}\w${Gre} ${BBlu}\$(__git_ps1)${BYel} λ ${RCol} "
}
# end of StackOverflow answer

# PROMPT_COMMAND is defined so this won't be used 
export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;c2m\]\u@\h\[\033[01;34m\] \w \[\033[38;5;181m\] \$(__git_ps1)\[\033[00m\] \$ "

# Git autocomplete
source /etc/bash_completion.d/git-prompt
#source /usr/share/bash-completion/completions/git

