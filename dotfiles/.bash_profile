# .bash_profile
# XDG USER
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

if  [ -f "$XDG_CONFIG_HOME/bashrc/env" ]; then
  . "$XDG_CONFIG_HOME/bashrc/env";
fi
