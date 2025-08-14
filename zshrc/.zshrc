# Function to get current git branch
git_branch() {
  local branch
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    [[ -n $branch ]] && echo "($branch)"
  fi
}

# Set the prompt dynamically
set_prompt() {
  PROMPT="%m %1~ $(git_branch) %# "
}

# Hook prompt update before each command
autoload -U add-zsh-hook
add-zsh-hook precmd set_prompt
