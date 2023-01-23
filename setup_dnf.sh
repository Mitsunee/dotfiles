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
  cargo \
  golang \
  kitty;

# setup flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;

# install flatpak apps
flatpak install --assumeyes \
  com.github.tchx84.Flatseal \
  com.github.Eloston.UngoogledChromium \
  com.bitwarden.desktop;

# install rust packages
cargo install \
  lsd \
  starship \
  cargo-update;

# install go packages
go install github.com/Gelio/go-global-update@latest;
go install github.com/charmbracelet/gum@latest;
go install github.com/walles/moar@latest;