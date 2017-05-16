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
. /etc/profile.d/vte.sh
eval $(dircolors ~/.dircolors)

# Alias:
alias ls="ls --color -F"
alias ll='ls -l --color=auto --human-readable --group-directories-first --classify'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
#alias vim='nvim'
alias mc='ranger'

export WORKON_HOME="$HOME/.virtualenvs"
source /usr/bin/virtualenvwrapper.sh

if [[ $(hostname) == "elxf0zgxy1-vf" ]]; then
    export PATH=$PATH:$HOME/bin:$HOME/.local/bin
    #export PATH=$PATH:$HOME/bin:$HOME/.gem/ruby/2.3.0/bin:$HOME/.local/bin
    #source /usr/lib/ruby/gems/2.3.0/gems/tmuxinator-0.9.0/completion/tmuxinator.zsh
    alias ts='export TERM=xterm-256color; ssh -q -t eselnts1403.mo.sw.ericsson.se "exec zsh"'
    alias tmx='export TERM=xterm-256color; ssh -t eselnts1403.mo.sw.ericsson.se "exec bin/tmx work"'
    alias ln09='xrandr --output LVDS1 --auto --left-of HDMI2 --output HDMI2 --auto --output HDMI1 --off; sleep 1; bspc monitor LVDS1 -d I II III IV V; bspc monitor HDMI2 -d VI VII VIII IX X; nitrogen --restore'
    alias ln01='xrandr --output LVDS1 --auto --right-of HDMI1 --output HDMI1 --auto --output HDMI2 --off; sleep 1; bspc monitor LVDS1 -d I II III IV V; bspc monitor HDMI1 -d VI VII VIII IX X; nitrogen --restore'
    alias screen_light='sudo tee /sys/class/backlight/acpi_video0/brightness <<< 95'
    alias standalone_screen='xrandr --output LVDS1 --output HDMI1 --off --output HDMI2 --off; sleep 1; bspc monitor LVDS1 -d I II III IV V VI VII VIII IX X; nitrogen --restore'
    alias vmware='rdesktop -K -d ERICSSON -u ehandoy -p - -g 1600x1000 eselnmw1037'
    alias g_tun='ssh -L29418:selngerrit.mo.sw.ericsson.se:29418 eselnts1403'
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
