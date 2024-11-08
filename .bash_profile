if [ -r ~/.bashrc ]; then 
  . ~/.bashrc; 
fi

#------ Paths ----
JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
CARGO_HOME=$HOME/.cargo/bin
DENO_HOME=$HOME/.deno/bin
NVIM5_HOME=/snap/bin/nvim
FFOX_HOME=$HOME/prog/firefox-nightly
export EDITOR=/snap/bin/nvim

export PATH=$FFOX_HOME:$PATH:$HOME/bin:$HOME/.local/bin:$JAVA_HOME:$CARGO_HOME:$DENO_HOME

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
  local BBlu='\[\e[0;34m\]'
  local Cya='\[\e[0;36m\]'
  local Pur='\[\e[0;35m\]'

  local ExitCol=""
  if [ $EXIT != 0 ]; then
    ExitCol+="${Red}"      # Add red if exit code non 0
  else
    ExitCol+="${Gre}"
  fi
  # see bash manual, PROMPTING section for details
  PS1+="${Pur}\u${Cya}@${Gre}\h${BYel}\w${Gre} ${BBlu}\$(__git_ps1)${ExitCol} λ ${RCol} "
}
# end of StackOverflow answer

# PROMPT_COMMAND is defined so this won't be used
export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;c2m\]\u@\h\[\033[01;34m\] \w \[\033[38;5;181m\] \$(__git_ps1)\[\033[00m\] \$ "

# Git autocomplete
source /etc/bash_completion.d/git-prompt
#source /usr/share/bash-completion/completions/git

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source /home/karma/.config/broot/launcher/bash/br
