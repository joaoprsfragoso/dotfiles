#!/usr/bin/zsh

# start prompt
eval "$(starship init zsh)"

# config options
setopt AUTO_CD
setopt CDABLE_VARS
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
setopt GLOB_COMPLETE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
unsetopt BEEP

# config history
export HISTFILE="$ZDOTDIR/.zshistory"
export HISTSIZE=100000
export SAVEHIST=100000

# config completion
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
zstyle ':completion:*' completer _oldlist _expand _complete _match _ignored _approximate
zstyle ':completion:*' insert-tab pending
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' rehash true
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*:descriptions' format

# edit current line with vim
autoload -U edit-command-line
zle -N edit-command-line

# source plugins
source $ZDOTDIR/.zshplugins
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# config plugins
ZSH_AUTOSUGGEST_USE_ASYNC=true
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=none,fg=none'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=none,fg=re'
HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'
FZF_DEFAULT_COMMAND='fd --type f'
FZF_DEFAULT_OPTS="--height=10 --min-height=1 --layout=reverse-list --info=hidden -i"
FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#ffffff,hl:#ffffff --color=fg+:#00ff0d,hl+:#00ff0d --color=info:#ffffff,prompt:#0009ff,pointer:#00ff0d --color=marker:#00ff0d,spinner:#ffffff,header:#ffffff'

# config keybindings
bindkey -v '^?' backward-delete-char
bindkey -v '^[[3~' delete-char
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^E' edit-command-line

# source alias
source $ZDOTDIR/.alias

# source other things
source $ZDOTDIR/.other