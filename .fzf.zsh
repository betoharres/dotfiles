# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/albertohrocha/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/albertohrocha/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/albertohrocha/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/albertohrocha/.fzf/shell/key-bindings.zsh"
