# source global definitions
if [ -f "/etc/bashrc" ]; then
    . /etc/bashrc;
fi

# user specific aliases and functions
for FILE in "$XDG_CONFIG_HOME/bashrc"/*; do
    [[ -f "$FILE" && "$FILE" != *head ]] && . "$FILE";
done

# user bash head file
HEAD_FILE="$XDG_CONFIG_HOME/bashrc/head";
[[ -f "$HEAD_FILE" ]] && . "$HEAD_FILE";
unset HEAD_FILE;
