# EDITOR
export EDITOR="vim"
export VISUAL="vim"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# ZSH
export ZDOTDIR="$HOME"

# SSH + GPG
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
