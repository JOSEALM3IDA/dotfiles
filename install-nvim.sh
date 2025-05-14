#!/usr/bin/env bash
set -euo pipefail

# Helper to prompt: default no (unless default_yes=true)
prompt() {
  local prompt_msg="$1"
  local default_yes=${2:-false}
  local yn default
  if $default_yes; then
    default=Y
    prompt_msg+=" [Y/n]: "
  else
    default=N
    prompt_msg+=" [y/N]: "
  fi
  read -rp "$prompt_msg" yn
  yn=${yn:-$default}
  case "$yn" in
    [Yy]*) return 0 ;;
    *)      return 1 ;;
  esac
}

if command -v nvim >/dev/null 2>&1; then
  CURRENT_VER=$(nvim --version | head -n1 | awk '{print $2}')
  echo "Detected Neovim version: $CURRENT_VER"
  HAS_NVIM=true
else
  echo "Neovim is not currently installed."
  HAS_NVIM=false
fi

echo "Fetching latest Neovim release tag from GitHub..."
LATEST_TAG=$(curl -fsSL \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/neovim/neovim/releases/latest \
  | grep -Po '"tag_name":\s*"\K.*?(?=")')
if [[ -z "$LATEST_TAG" ]]; then
  echo "Error: Could not fetch latest release tag."
  exit 1
fi
echo "Latest Neovim release: $LATEST_TAG"

if $HAS_NVIM; then
  if [[ "$CURRENT_VER" == "$LATEST_TAG" ]]; then
    if prompt "You already have the latest version. Reinstall?" false; then
      ACTION="reinstall"
    else
      echo "Aborting - nothing to do."
      exit 0
    fi
  else
    if prompt "Update Neovim from $CURRENT_VER to $LATEST_TAG?" false; then
      ACTION="update"
    else
      echo "Aborting - will not update."
      exit 0
    fi
  fi
else
  if prompt "Install Neovim $LATEST_TAG?" true; then
    ACTION="install"
  else
    echo "Aborting - will not install."
    exit 0
  fi
fi

if [[ "$ACTION" == "update" || "$ACTION" == "reinstall" ]]; then
  echo "Removing existing Neovim..."
  sudo rm -rf /usr/local/bin/nvim \
               /usr/local/share/nvim \
               /usr/local/lib/nvim \
               /usr/local/include/nvim
fi

echo "Cloning Neovim $LATEST_TAG..."
git clone --depth 1 --branch "$LATEST_TAG" \
  https://github.com/neovim/neovim.git /tmp/neovim

echo "Building Neovim (RelWithDebInfo)..."
cd /tmp/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo

echo "Installing Neovim..."
sudo make install

cd /
rm -rf /tmp/neovim

echo "Neovim $LATEST_TAG has been ${ACTION}ed successfully!"

