# Setup fzf
# ---------
if [[ ! "$PATH" == */home/betoharres/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/betoharres/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/betoharres/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------ pacman -S fzf
source "/home/betoharres/.fzf/shell/key-bindings.bash"
