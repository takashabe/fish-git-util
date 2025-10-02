# fish-git-util
Convenient command collection to streamline everyday Git operations. Utilities for the fish shell.

## Installation

Clone this repository and add the `functions` directory to your fish function path:

```fish
fisher install takashabe/fish-git-util
```


## Functions

### git_remove_index_lock

Remove `.git/index.lock` file. Works with both regular repositories and worktrees.

```fish
git_remove_index_lock
```
