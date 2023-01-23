#!/usr/bin/env bash

read -p "This script installs a bunch of packages. Are you sure? (y/N) ";
echo "";
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "Aborted...";
  exit;
fi;

# install dnf packages
sudo dnf install --assumeyes \
  python3-pip \
  gcc-c++ \
  clang \
  clang-tools-extra \
  autoconf \
  automake \
  cmake \
  meson \
  SDL2-devel \
  ffms2-devel \
  libusb-devel \
  libcxx \
  SFML-devel \
  android-tools \
  steam \
  wine;

# install flatpaks
flatpak install --assumeyes \
  com.discordapp.Discord \
  com.github.fabiocolacio.marker \
  org.gimp.GIMP \
  org.inkscape.Inkscape \
  com.obsproject.Studio \
  com.obsproject.Studio.Plugin.OBSVkCapture \
  com.spotify.Client \
  org.keepassxc.KeePassXC \
  com.vscodium.codium \
  org.filezillaproject.Filezilla \
  net.davidotek.pupgui2 \
  com.transmissionbt.Transmission;

# prepare node.js
mkdir -p "$XDG_STATE_HOME/node_repl"
touch "$NODE_REPL_HISTORY"
mkdir -p "$XDG_CONFIG_HOME/npm"

# install node.js
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o /tmp/n;
bash /tmp/n --no-preserve lts;
npm uninstall -g corepack;

# install node.js packages
npm install -g \
  n@latest \
  npm-check-updates@latest \
  npm@latest \
  yarn@latest \
  pnpm@latest \
  lerna@latest \
  npkill@latest \
  yarn-deduplicate@latest \
  vercel@latest \
  snyk@latest;

# install go packages
go install github.com/cheat/cheat/cmd/cheat@latest;
go install github.com/charmbracelet/glow@latest;
