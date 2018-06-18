HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

# Marulkan conf:
autoload -U colors && colors
setopt hist_ignore_dups
setopt hist_ignore_space
setopt noflowcontrol
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt prompt_subst

# Alias:
alias ls="ls --color -F"
alias ll='ls -l --color=auto --human-readable --group-directories-first --classify'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias vim='nvim'
alias mc='ranger'
alias mutt='neomutt'

export WORKON_HOME="$HOME/.virtualenvs"
source /usr/bin/virtualenvwrapper.sh

if [[ $(hostname) == "elxa2ls2bh2" ]]; then
    export PATH=$PATH:$HOME/bin:$HOME/.local/bin
    # alias ln01='xrandr --output LVDS1 --auto --right-of HDMI1 --output HDMI1 --auto --output HDMI2 --off; sleep 1; bspc monitor LVDS1 -d I II III IV V; bspc monitor HDMI1 -d VI VII VIII IX X; nitrogen --restore'
    # alias standalone_screen='xrandr --output LVDS1 --output HDMI1 --off --output HDMI2 --off; sleep 1; bspc monitor LVDS1 -d I II III IV V VI VII VIII IX X; nitrogen --restore'
    # alias g_tun='ssh -L29418:selngerrit.mo.sw.ericsson.se:29418 eselnts1403'
fi

export BROWSER=/usr/bin/qutebrowser
export SHELL=/usr/bin/zsh
# Prompt end: %#

fpath=( "$HOME/.zfunctions" $fpath )
autoload -U promptinit; promptinit
prompt pure

# Jira helper functions:
function jira-view {
    jira-cli view $@ --oneline && jira-cli view $@ --format "%description" && jira-cli view $@ --comments-only
}
function jira-done {
    jira-cli update $@ --transition "done"
}
function jira-close {
    jira-cli update $@ --transition "close"
}
function jira-new {
    jira-cli new --assignee ehandoy --extra customfield_10106='{"name": "ehandoy"}' --project SELNHUB --type ToDo $@
}
function jira-assign-me {
    jira-cli update --assign ehandoy $@
}
source /usr/share/fzf/key-bindings.zsh
