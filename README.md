# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's inside

### ~/.config/

| Config | Tool | Description |
|---|---|---|
| .config/nvim | Neovim + LazyVim | Editor config, plugins, keymaps |
| .config/fish | Fish shell | Shell config, tide prompt, functions, completions |
| .config/ghostty | Ghostty | Terminal emulator config and solarized theme |
| .config/tmux | tmux | Multiplexer — theme, statusline, macos, utility modules |

### ~/  (home directory)

| File | Description |
|---|---|
| .gitconfig | Global git identity, aliases, LFS, conditional includes per workspace |
| .gitignore_global | Global gitignore — DS_Store, caches, history files |
| .tool-versions | asdf version pins — language runtimes & DevOps tools that need per-project pinning (java, maven, nodejs, terraform, packer, python, rust, ruby) |
| Brewfile | Homebrew bundle — `brew bundle --file=Brewfile` installs the global CLI utilities (git, neovim, lazygit, eza, ripgrep, peco, ghq, uv, bun, zoxide, gcloud-cli) |
| INSTALL.md | Per-tool breakdown of asdf and Homebrew installs |
| .vimrc | Vim fallback config (when nvim is unavailable) |

## Installing apps

See [INSTALL.md](./INSTALL.md) for the full list of apps and install steps.

Quick version:

- **`.tool-versions` (asdf)** — language runtimes and DevOps tools where different projects may need different exact versions (java, maven, nodejs, python, ruby, rust, terraform, packer). Same on every OS: `asdf install`.
- **Global CLI utilities** — used the same way everywhere, with no per-project pinning need (git, neovim, lazygit, eza, ripgrep, peco, ghq, uv, bun, zoxide, gcloud-cli). `brew bundle --file=Brewfile` installs them all.

## Setup on a new machine

1. Clone the repo

       git clone git@github.com:eiricksayson/dotfiles.git ~/dotfiles

2. Install GNU Stow

       brew install stow

3. Apply all symlinks

       cd ~/dotfiles
       stow --target=$HOME --no-folding .

4. Install global CLI utilities (Homebrew)

       brew bundle --file=Brewfile

5. Install asdf tools (language runtimes & DevOps tools)

       asdf install

6. Install tmux plugin manager

       git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

7. Open tmux and install plugins

       ⌘+b  I

## Managing dotfiles

| Task | Command |
|---|---|
| Re-apply symlinks | `cd ~/dotfiles && stow --target=$HOME --no-folding --restow .` |
| Add a ~/.config tool | copy into `~/dotfiles/.config/<tool>/` then restow |
| Add a home dotfile | copy into `~/dotfiles/` then restow |
| Push changes | `git add -A && git commit -m "..." && git push origin main` |

## Notes

- `config-local.fish` is intentionally excluded — contains machine-specific secrets (AWS, Kafka, signing keys)
- `fish_variables` is excluded — fish-managed runtime file, not portable
- `lazy-lock.json` is excluded — nvim plugin lockfile, regenerated on install
- tmux prefix key is `⌘+b`

## Cheatsheet

See [CHEATSHEET.md](./CHEATSHEET.md) for keyboard shortcuts reference.

Open it anytime inside tmux with `⌘+b /`.
