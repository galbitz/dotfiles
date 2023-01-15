#!/bin/bash

dotfilesDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

sudo -n true 2>/dev/null
cansudo=$?

function add_bash_extra {
    text_block=$(cat <<EOF
# dotfile block starts
source \$HOME/.bashrc_extra
# dotfile block ends

EOF
)
    bashfile="$HOME/.bashrc"
    if ! grep -qF "$text_block" "$bashfile"; then
        echo "Adding bash extra to bashfile"
        echo "$text_block" >> "$bashfile"
    fi
}

function install_starship {
    bindir=$([ "$cansudo" -ne 0 ] && echo --bin-dir $HOME/.local/bin)
    curl -sS https://starship.rs/install.sh | sh -s --  --force $bindir
}

function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dotfilesDir}/${1} -> ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

function install_applications {

  if [ "$cansudo" -ne 0 ]; then
    echo "User cannot sudo. Skipping applications"
    return 0
  fi

  if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "MacOS detected"
    source ${dotfilesDir}/install_macos.sh
    return 0
  fi

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Linux detected"
    if [ -f /etc/os-release ]; then
      . /etc/os-release
      OS=$NAME
      if [[ "$OS" == "Ubuntu" ]]; then
        echo "Running install for $OS"
        source ${dotfilesDir}/install_ubuntu.sh
      else
        echo "Don't know how to install apps on $OS"
      fi
    else
      echo "Cannot determine distribution type"
    fi    
  fi

  echo "No OS detected. Skipping applications"
}

echo "Dotfile install started."

echo "Installing bash extras"
add_bash_extra
echo "Installing starship"
install_starship
echo "Adding symlinks"
linkDotfile .bashrc_extra
linkDotfile .config/starship.toml

source ~/.bashrc

echo "Install additonal applications"
install_applications

echo "Dotfile install finished."