# Setup fzf
# ---------
if [[ ! "$PATH" == */home/betoharres/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/betoharres/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/betoharres/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/share/fzf/key-bindings.zsh"
