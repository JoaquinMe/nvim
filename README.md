# Neovim configuration

This repository is the shared source of truth for my Neovim configuration. It
uses AstroNvim v6 and `lazy.nvim`; `lazy-lock.json` is versioned so all
computers use the same plugin revisions.

## Install on a new computer

Install Neovim and Git first. If `~/.config/nvim` already exists, back it up
before cloning:

```sh
mv ~/.config/nvim ~/.config/nvim.backup
git clone git@github.com:JoaquinMe/nvim.git ~/.config/nvim
nvim
```

The first launch installs the pinned plugins. Tools installed by Mason and
Neovim cache/state files remain local to each computer, which avoids sharing
OS-specific binaries and transient data.

## Keep computers synchronized

Before editing, bring the current computer up to date:

```sh
cd ~/.config/nvim
git pull --ff-only
```

After a shared configuration change, commit and publish it:

```sh
git add .
git commit -m "Describe the configuration change"
git push
```

If a pull cannot fast-forward, inspect `git status`, resolve the conflict,
then continue the rebase or merge before pushing. Do not commit generated
runtime files or credentials.

## Per-computer settings

For settings that genuinely differ between machines, create `lua/local.lua`
from the tracked example:

```sh
cp lua/local.example.lua lua/local.lua
```

`lua/local.lua` is loaded automatically by `lua/polish.lua` when present and
is ignored by Git. Use it for executable paths, private tokens, and other
machine-specific settings; keep shared editor behavior in the tracked files.
