alias vim="nvim"
alias vi="nvim"

# use Windows' git when working under C:\ drive in WSL
if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
    git() {
        if $(pwd -P | grep -q "^\/mnt\/c\/*"); then
          git.exe "$@"
        else
          command git "$@"
        fi
    }
fi
