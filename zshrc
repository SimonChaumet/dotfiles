[ -f ~/.env ] && source ~/.env
export TERM="xterm-256color"
export SHELL="zsh"

source ~/.profile_env
# aliases
alias gaa="git add ."
alias gc="git commit"
alias bundle-zsh-plugins="antibody bundle < $DOTFILES_PATH/zsh/zsh_plugins.txt > $DOTFILES_PATH/zsh/zsh_plugins.sh"

# --- Colored LESS E.G for man ---
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# no beep bop boup
unsetopt BEEP

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
export ZSH_HIGHLIGHT_PATTERNS=('rm *\*' 'fg=white,bold,bg=red')

# starship
eval "$(starship init zsh)"

autoload bashcompinit
bashcompinit

autoload -Uz compinit
compinit
# End of lines added by compinstal

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi

# plugins
source $DOTFILES_PATH/zsh/zsh_plugins.sh

zstyle ':completion:*' menu select
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'


fzf-git-branch() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

fzf-git-checkout() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    local branch

    branch=$(fzf-git-branch)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    # If branch name starts with 'remotes/' then it is a remote branch. By
    # using --track and a remote branch name, it is the same as:
    # git checkout -b branchName --track origin/branchName
    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track $branch
    else
        git checkout $branch;
    fi
}
alias gb='fzf-git-branch'
alias gco='fzf-git-checkout'


# history
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# ctrl-left
bindkey "^[[1;5D" vi-backward-word
# alt-left aka not roussel
bindkey "^[[1;3D" vi-backward-word
# ctrl-right
bindkey "^[[1;5C" vi-forward-word
# alt-right aka facho
bindkey "^[[1;3C" vi-forward-word
# ctrl-backspace
bindkey "^H" vi-backward-kill-word
# ctrl-supp
bindkey "^[[3;5~" delete-word
# supp
bindkey "^[[3~" vi-delete-char
# end
bindkey "^[[F" end-of-line
# beginning
bindkey "^[[H" beginning-of-line

