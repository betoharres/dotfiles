# Setup fzf
# ---------
if [[ ! "$PATH" == */home/betoharres/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/betoharres/.fzf/bin"
fi

source <(fzf --zsh)
