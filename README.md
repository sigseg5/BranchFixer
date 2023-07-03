# BranchFixer

BranchFixer – fix the mess with `master`/`main` git branches.

Do you have multiple repositories with a `master` and `main` branches?
Do you regularly forget which branch is the "main" in current repo?
Well, BranchFixer fixes that!

This tool integrates with `.bashrc`/`.zshrc` and keeps track of some git subcommands that require a branch name (`switch`, `checkout`, `merge`, `rebase`, `log` now supported).

If you mistype the branch name, BranchFixer will try to correct the command.
For example:  You type `git switch main`, but the `main` branch does not exist in the current repo – BranchFixer will correct the branch name to `master`.
Thus, `git switch master` will be executed instead of `git switch main`.

## Installation

There are several ways to integrate BranchFixer into your favorite shell:

### zsh

```bash
cat z.sh >> "$HOME/.zshrc"
```

### bash

```bash
cat ba.sh >> "$HOME/.bashrc"
```

or simply paste the content of [z.sh](/z.sh) or [ba.sh](/ba.sh) into your `.zshrc`/`.bashrc` file

## Network Installation

Also you can install BranchFixer via `curl` or `wget`:

### Network install and integration into zsh

- curl

```bash
curl -sSf --proto "=https" --tlsv1.2 "https://raw.githubusercontent.com/sigseg5/BranchFixer/blob/master/z.sh" >> "$HOME/.zshrc"
```

- wget

```bash
wget -qO- --https-only "https://raw.githubusercontent.com/sigseg5/BranchFixer/blob/master/z.sh" >> "$HOME/.zshrc"
```

### Network install and integration into bash

- curl

```bash
curl -sSf --proto "=https" --tlsv1.2 "https://raw.githubusercontent.com/sigseg5/BranchFixer/blob/master/ba.sh" >> "$HOME/.bashrc"
```

- wget

```bash
wget -qO- --https-only "https://raw.githubusercontent.com/sigseg5/BranchFixer/blob/master/ba.sh" >> "$HOME/.bashrc"
```

## Compatibility

This tool supports these shells and maybe more, who knows:

- zsh
- bash
