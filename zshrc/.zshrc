# Get the git branch
git_branch() {
  local branch
  branch=$(git branch --show-current 2>/dev/null)
  [[ -n $branch ]] && echo "($branch)"
}

# Set the default editor
PROMPT="%m %1d $(git_branch) %# "
