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
  local green="%{$fg[green]%}"
  local blue="%{$fg[blue]%}"
  local cyan="%{$fg[cyan]%}"
  local yellow="%{$fg[yellow]%}"
  local reset="%{$reset_color%}"
  PROMPT="${blue}%* ${cyan}%m ${green}%1~ ${yellow}$(git_branch)${reset} %# "
}

# Hook prompt update before each command
autoload -U add-zsh-hook
add-zsh-hook precmd set_prompt
