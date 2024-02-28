# Setup fzf
# ---------
if [[ ! "$PATH" == */home/betoharres/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/betoharres/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/betoharres/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/betoharres/.fzf/shell/key-bindings.zsh"
