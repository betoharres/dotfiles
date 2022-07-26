# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/betoharres/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/betoharres/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/betoharres/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/betoharres/.fzf/shell/key-bindings.zsh"
