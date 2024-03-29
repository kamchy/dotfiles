#------ System aliases ----
alias la='exa -al'
alias ll='exa -l'
#------ Git aliases ----
alias g="git"
alias gco="git checkout"
alias grb="git rebase"
alias ga="git add -u"
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gdc='git diff --cached'
alias gk='gitk --all&'
alias glg='git log --graph --full-history --all --color  --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias grl='git reflog -n10'
alias gma='git merge --abort'
alias gmm='git merge --log --no-ff'
alias mc='.  /usr/share/mc/bin/mc-wrapper.sh'
alias vim="nvim"
alias emacs='emacsclient -c -a ""'
# pbcopy (after xlicp installation
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi
