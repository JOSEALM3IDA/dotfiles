#!/bin/bash

LOCAL_DIR="./.config/nvim"
USER_DIR="$HOME/.config/nvim"

echo "What do you want to do?"
echo "1) Copy from USER config ($USER_DIR) → LOCAL ($LOCAL_DIR)"
echo "2) Copy from LOCAL ($LOCAL_DIR) → USER config ($USER_DIR)"
read -p "Choose 1 or 2: " choice

case $choice in
  1)
    echo "Copying from $USER_DIR to $LOCAL_DIR"
    mkdir -p "$(dirname "$LOCAL_DIR")"
    cp -r "$USER_DIR/"* "$LOCAL_DIR"
    echo "Done."
    ;;
  2)
    if [ -d "$USER_DIR" ]; then
      read -p "$USER_DIR already exists. Overwrite? [y/N]: " confirm
      if [[ "$confirm" =~ ^[Yy]$ ]]; then
        cp -r "$LOCAL_DIR/"* "$(dirname "$USER_DIR")"
        echo "Updated user config."
      else
        echo "Aborted."
      fi
    else
      mkdir -p "$(dirname "$USER_DIR")"
      cp -r "$LOCAL_DIR/"* "$USER_DIR"
      echo "Copied local config to user directory."
    fi
    ;;
  *)
    echo "Invalid choice."
    ;;
esac
