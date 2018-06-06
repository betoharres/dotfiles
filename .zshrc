PROMPT="%~ $ "

source ~/.aliases

##############################################################################
# History Configuration
##############################################################################
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=10000              #Number of history entries to save to disk
#HISTDUP=erase              #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed


# personal
function c() { cd ~/code/$@; }
function h() { cd ~/$@; }
function v() { vim $@; }
function gamend() {git commit --amend -m "$*";}
function gcp() {git add -A && git commit -m "$*" && git push;}
function opendiff () { vim -p $(git status -s | awk '{print $2}') }
function youtube-mp3() {
  youtube-dl --extract-audio --audio-format mp3 $1;
}

LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

export PATH=/usr/local/bin:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

##############################################################################
# vi-mode
##############################################################################
# enable vi mode
zle -N edit-command-line

bindkey -v

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# fzf (this needs to be after vi-mode to avoid being overwritten)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# hit CTRL + z to go to background and foreground
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}


