# Setup fzf
# Auto-completion
# ---------------
if [[ $- == *i* ]]; then
  FZF_PATH=$(brew --prefix fzf)/shell
  source "$FZF_PATH/completion.zsh" 2> /dev/null
fi

# Key bindings
# ------------
FZF_PATH=$(brew --prefix fzf)/shell
source "$FZF_PATH/key-bindings.zsh"
