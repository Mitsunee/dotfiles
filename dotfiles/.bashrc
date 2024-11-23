# source global definitions
if [ -f "/etc/bashrc" ]; then
  . /etc/bashrc;
fi

# user specific aliases and functions
if [[ -d "$XDG_CONFIG_HOME/bashrc" ]]; then
  for FILE in "$XDG_CONFIG_HOME/bashrc"/*; do
    # source all files not called head
    [[ -f "$FILE" && "$FILE" != *head ]] && . "$FILE";
  done
fi

# other bash config scripts
if [[ -d "$XDG_CONFIG_HOME/bash" ]]; then
  for FILE in "$XDG_CONFIG_HOME/bash"/*; do
    [[ -f "$FILE" ]] && . "$FILE";
  done
fi

# user bash head file
HEAD_FILE="$XDG_CONFIG_HOME/bashrc/head";
[[ -f "$HEAD_FILE" ]] && . "$HEAD_FILE";
unset HEAD_FILE;
