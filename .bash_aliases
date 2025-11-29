alias bat='batcat'
alias cm='git commit -m'
alias emacs='emacsclient -c -a ""'
alias ev='nvim ~/.config/nvim-kickstart2/init.lua'
alias fd='fdfind'
alias g="git"
alias ga="git add -u"
alias ga="git add"
alias gb="git branch"
alias gc='git commit'
alias gco="git checkout"
alias gd="git diff"
alias gdc="git diff --cached"
alias gk='gitk --all&'
alias glg='git log --graph --full-history --all --color  --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gma='git merge --abort'
alias gmm='git merge --log --no-ff'
alias grb="git rebase"
alias grl='git reflog -n10'
alias gs="git status"
alias j='just'
alias la='eza -al'
alias ll='exa -l'
alias ls='eza'
alias mc='.  /usr/share/mc/bin/mc-wrapper.sh'
alias mvncp="mvn clean package"
alias now='sh ~/bin/now.sh'
alias nvim='NVIM_APPNAME="nvim-kickstart2" nvim'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias sz="source ~/.bash_profile"
alias upd="sudo apt update && sudo apt upgrade -y"
alias vim="nvim"

if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi
