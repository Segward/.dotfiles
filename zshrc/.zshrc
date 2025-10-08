# Load color definitions
autoload -U colors
colors

# Function to get current git branch
git_branch() {
  local branch
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    [[ -n $branch ]] && echo "($branch)"
  fi
}

# Set the prompt
set_prompt() {
  local yellow="%{$fg[yellow]%}"
  local white="%{$fg[white]%}"
  local purple="%{$fg[magenta]%}"
  local blue="%{$fg[blue]%}"
  local reset="%{$reset_color%}"
  PROMPT="${yellow}%* ${white}%m ${purple}%1~ ${blue}$(git_branch)${reset} %# "
}

# Hook prompt update before each command
autoload -U add-zsh-hook
add-zsh-hook precmd set_prompt
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
