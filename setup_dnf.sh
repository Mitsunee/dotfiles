#!/usr/bin/env bash

read -p "This script installs a bunch of packages. Are you sure? (y/N) ";
echo "";
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "Aborted...";
  exit;
fi;

# install dnf packages
sudo dnf install --assumeyes \
  openssl-devel \
  flatpak \
  neofetch \
  rust \
  cargo;

# setup flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;

# install flatpak apps
flatpak install --assumeyes \
  com.github.tchx84.Flatseal \
  com.github.Eloston.UngoogledChromium \
  com.bitwarden.desktop;

# install rust apps
cargo install \
  lsd \
  starship \
  cargo-update;
