# dotfiles

This repository contains part of my dotfiles. **Use at your own risk**

## Usage

```sh
sudo dnf install -y rsync git
git clone https://github.com/Mitsunee/dotfiles
cd dotfiles
```

## bootstrap.sh

This script unpacks the content of the [`dotfiles`](dotfiles) directory into your home directory. This **WILL** wipe any already existing files of the same names!

## Setup scripts

These script install a bunch of packages I use. They were made for Fedora-based distros. `setup_dnf.sh` contains the bare minimum I install on every machine, while `setup_dnf_extras.sh` contains most of what I use on my desktop sans stuff built from source.
