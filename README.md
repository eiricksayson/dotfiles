# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## What's inside

### ~/.config/

| Config | Tool | Description |
|---|---|---|
| .config/nvim | Neovim + LazyVim | Editor config, plugins, keymaps |
| .config/fish | Fish shell | Shell config, tide prompt, functions, completions |
| .config/ghostty | Ghostty | Terminal emulator config and solarized theme |
| .config/tmux | tmux | Multiplexer — theme, statusline, macos, utility modules |
| .config/tmuxp | tmuxp | Saved tmux session layouts |
| .config/lazygit | lazygit | Git TUI config |

### ~/  (home directory)

| File | Description |
|---|---|
| .gitconfig | Global git identity, aliases, LFS, conditional includes per workspace |
| .gitignore_global | Global gitignore — DS_Store, caches, history files |
| .tool-versions | asdf version pins — language runtimes & DevOps tools that need per-project pinning (java, maven, nodejs, terraform, packer, python, rust, ruby) |
| Brewfile | Homebrew bundle — `brew bundle --file=Brewfile` installs the global CLI utilities (git, neovim, lazygit, eza, ripgrep, peco, ghq, uv, bun, zoxide, tmuxp, gcloud-cli) |
| INSTALL.md | Per-tool breakdown of asdf and Homebrew installs |
| .vimrc | Vim fallback config (when nvim is unavailable) |

## Installing apps

See [INSTALL.md](./INSTALL.md) for the full list of apps and install steps.

Quick version:

- **`.tool-versions` (asdf)** — language runtimes and DevOps tools where different projects may need different exact versions (java, maven, nodejs, python, ruby, rust, terraform, packer). Same on every OS: `asdf install`.
- **Global CLI utilities** — used the same way everywhere, with no per-project pinning need (git, neovim, lazygit, eza, ripgrep, peco, ghq, uv, bun, zoxide, tmuxp, gcloud-cli). `brew bundle --file=Brewfile` installs them all.

## Setup on a new machine

1. Install chezmoi

       brew install chezmoi
       # or: sh -c "$(curl -fsLS get.chezmoi.io)"

2. Choose the source directory

   This repo is checked out to a custom location (`~/Developer/<github-username>/dotfiles`),
   NOT chezmoi's default `~/.local/share/chezmoi`. Configure that before init:

       mkdir -p ~/.config/chezmoi
       echo 'sourceDir = "/home/<user>/Developer/eiricksayson/dotfiles"' > ~/.config/chezmoi/chezmoi.toml

3. Initialize and apply

       chezmoi init --ssh --apply eiricksayson

4. Install global CLI utilities (Homebrew)

       brew bundle --file="$(chezmoi source-path)/Brewfile"

5. Install asdf tools (language runtimes & DevOps tools)

       asdf install

6. Install tmux plugin manager

       git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

7. Open tmux and install plugins

       ⌘+b  I

## Managing dotfiles

| Task | Command |
|---|---|
| Edit a file (preferred) | `chezmoi edit <file>` — opens source copy, auto-applies on save |
| Re-apply after a manual $HOME edit | `chezmoi re-add <file>` then `chezmoi apply` |
| Preview pending changes | `chezmoi diff` |
| Check for drift | `chezmoi status` |
| Add a new file | `chezmoi add <path>` |
| Push changes | `chezmoi cd && git add -A && git commit -m "..." && git push` |
| Pull latest + apply | `chezmoi update` |

See [CHEATSHEET.md](./CHEATSHEET.md) for the full chezmoi command reference.

## Notes

- `config-local.fish` is intentionally excluded — contains machine-specific secrets (AWS, Kafka, signing keys)
- `fish_variables` is excluded — fish-managed runtime file, not portable
- `lazy-lock.json` is excluded — nvim plugin lockfile, regenerated on install
- tmux prefix key is `⌘+b`

## Cheatsheet

See [CHEATSHEET.md](./CHEATSHEET.md) for keyboard shortcuts reference.

Open it anytime inside tmux with `⌘+b /`.
