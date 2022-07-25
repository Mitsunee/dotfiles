#!/usr/bin/env bash

# Credit: mathiasbynens
# https://github.com/mathiasbynens/dotfiles/blob/main/bootstrap.sh

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
  pushd ./dotfiles &> /dev/null;
	rsync -avh --no-perms . ~;
  popd &> /dev/null;
	#source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/N) ";
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
