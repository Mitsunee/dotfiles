sourcesafely () {
	if  [ -f "$*" ]; then
		. "$*";
	fi
}

# Source global definitions
sourcesafely /etc/bashrc;

# User specific aliases and functions
sourcesafely $XDG_CONFIG_HOME/bashrc/aliases;
sourcesafely $XDG_CONFIG_HOME/bashrc/head;

unset sourcesafely;
