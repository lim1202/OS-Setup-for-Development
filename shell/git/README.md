# Git

## Generate changelog from commit

```sh
git log $(git describe --tags --abbrev=0)..HEAD --pretty=format:"- %h %s" --no-merges

# features
git log $(git describe --tags --abbrev=0)..HEAD --pretty=format:"- %h %s" --no-merges --grep feat:

# bug fixes
git log $(git describe --tags --abbrev=0)..HEAD --pretty=format:"- %h %s" --no-merges --grep fix:
```


## Git Config Includes

```ini
[includeIf "gitdir:~/code/github/"]
    path = .gitconfig-github.inc

[includeIf "gitdir:~/code/work/"]
    path = .gitconfig-work.inc
```
