# global helper functions

function add_textblock_to_file() {
    text_block="$1"
    rcfile="$HOME/$2"

    if ! grep -qF "$text_block" "$rcfile"; then
        echo "Adding bash extra to bashfile"
        echo "$text_block" >> "$rcfile"
    fi
}

function is_debian() {
 if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ -f /etc/os-release ]; then
      . /etc/os-release
      OS=$ID
      if [[ "$OS" == "debian" ]]; then
        return 0
      fi
    fi
  fi
  return 1
}

function is_ubuntu() {
 if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ -f /etc/os-release ]; then
      . /etc/os-release
      OS=$ID
      if [[ "$OS" == "ubuntu" ]]; then
        return 0
      fi
    fi
  fi
  return 1
}

function is_macos() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    return 0
  fi

  return 1
}

function is_wsl() {
  if [ -n "$WSLENV" ]; then
    return 0
  fi

  return 1
}

function linkDotfile() {
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

function command_exists() {
  if ! command -v $1 &> /dev/null
  then
    echo "$1 could not be found"
    return 1
  fi   
}

function test_requirements() {
  if ! command_exists "git"; then exit 1; fi
  if ! command_exists "curl"; then exit 1; fi
  if ! command_exists "sudo"; then exit 1; fi
}
