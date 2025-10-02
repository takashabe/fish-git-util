function git_remove_index_lock -d "Remove .git/index.lock file"
  # Get the git directory of the repository (supports worktrees)
  set -l git_dir (command git rev-parse --git-dir 2>/dev/null)

  if test -z "$git_dir"
    echo "Error: Not a git repository" >&2
    return 1
  end

  # Construct the path to index.lock
  set -l lock_file "$git_dir/index.lock"

  if test -f "$lock_file"
    # Check if the file is writable before attempting to remove
    if not test -w "$lock_file"
      echo "Error: Permission denied. Cannot remove $lock_file" >&2
      return 1
    end

    if command rm -f "$lock_file"
      echo "Removed: $lock_file"
      return 0
    else
      echo "Error: Failed to remove $lock_file" >&2
      return 1
    end
  else
    echo "No index.lock found at: $lock_file"
    return 0
  end
end
