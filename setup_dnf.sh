#!/usr/bin/env bash

read -p "This script installs a bunch of packages. Are you sure? (y/N) ";
echo "";
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "Aborted...";
  exit;
fi;

# setup flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install dnf packages
sudo dnf install --assumeyes \
  neofetch \
  rust \
  cargo \
  git;

# install flatpak apps
flatpak install --assumeyes \
  com.tchx84.Flatseal \
  com.Eloston.UngoogledChromium \
  com.bitwarden.desktop;

# install rust apps
cargo install lsd starship cargo-update;
