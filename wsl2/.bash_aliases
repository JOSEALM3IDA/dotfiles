# use Windows' git when working under C:\ drive
git() {
  if $(pwd -P | grep -q "^\/mnt\/c\/*"); then
    git.exe "$@"
  else
    command git "$@"
  fi
}
