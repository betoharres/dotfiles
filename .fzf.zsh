# Setup fzf
# ---------
if [[ ! "$PATH" == */home/betoharres/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/betoharres/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/betoharres/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/betoharres/.fzf/shell/key-bindings.zsh"
