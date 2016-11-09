
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
zstyle :compinstall filename '/home/marulkan/.zshrc'
autoload -Uz compinit
compinit
eval $(dircolors ~/.dircolors)

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
#alias vim='nvim'
alias mc='ranger'

export WORKON_HOME="$HOME/.virtualenvs"
source /usr/bin/virtualenvwrapper.sh

# export PATH=$PATH:/home/marulkan/.gem/ruby/2.0.0/bin
# PS1 stuffs:
# Time: %*

# Prompt end: %#

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}+"
GIT_PROMPT_PREFIX="%{$fg[white]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[white]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}z%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}*%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}*%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}*%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {
  # Compose this value via multiple conditional appends.
  local GIT_STATE=""
  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi
  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi
  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi
  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi
  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi
  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi
}

# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
}

# Set the right-hand prompt
RPS1='$(git_prompt_string)'

#PS1='[%T][%n@%m][%<<%~] '
PROMPT="[%T][%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%}][%{$fg_no_bold[yellow]%}%~%{$reset_color%}]
%{$reset_color%}>"

[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char

