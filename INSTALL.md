# Install Guide

All installable tools in this project fall into two groups:

- **Global CLI utilities** — used the same way on every project, no per-project version pinning needed. Installed via Homebrew (`Brewfile`).
- **Language runtimes & DevOps tools** — different projects may need different exact versions. Pinned in [`.tool-versions`](./.tool-versions), installed via [asdf](https://asdf-vm.com/).

## Quick start

```bash
brew bundle --file=Brewfile   # global CLI utilities
asdf install                  # language runtimes & DevOps tools — all versions pinned in .tool-versions
```

## Homebrew (global CLI utilities)

Covers: **git, neovim, lazygit, eza, ripgrep, peco, ghq, uv, bun, zoxide, gcloud-cli**

```bash
brew bundle --file=Brewfile
```

## Language runtimes & DevOps tools (asdf)

For any of these, add the plugin once (skip if already added — check with `asdf plugin list`), then install the pinned version. Or just run `asdf install` from the repo root to install everything in `.tool-versions` at once (plugins must already be added — `asdf install` does not add missing plugins automatically).

| Tool | Pinned version | Add plugin | Install |
|---|---|---|---|
| java | openjdk-25.0.2 | `asdf plugin add java` | `asdf install java openjdk-25.0.2` |
| maven | 3.9.16 | `asdf plugin add maven` | `asdf install maven 3.9.16` |
| nodejs | 24.21.0 | `asdf plugin add nodejs` | `asdf install nodejs 24.21.0` |
| terraform | 1.16.2 | `asdf plugin add terraform` | `asdf install terraform 1.16.2` |
| packer | 1.16.0 | `asdf plugin add packer` | `asdf install packer 1.16.0` |
| python | 3.14.7 | `asdf plugin add python` | `asdf install python 3.14.7` |
| rust | 1.98.1 | `asdf plugin add rust` | `asdf install rust 1.98.1` |
| ruby | 4.0.6 | `asdf plugin add ruby` | `asdf install ruby 4.0.6` |

Add every plugin in one go:
```bash
for tool in java maven nodejs terraform packer python rust ruby; do
  asdf plugin add "$tool"
done
asdf install
```

## Neovim (LazyVim + plugins)

Neovim config lives in `.config/nvim` (a [LazyVim](https://www.lazyvim.org/) setup). After stowing dotfiles, plugins install/sync automatically on first launch via `lazy.nvim`, or manually:

```bash
nvim --headless "+Lazy! sync" +qa
```

Notable plugins beyond the LazyVim defaults:

| Plugin | Purpose |
|---|---|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder (files, grep, buffers, help) — added on top of LazyVim's default `snacks.nvim` picker; keymaps: `<leader>ff` find files, `<leader>fg` live grep, `<leader>fb` buffers, `<leader>fh` help tags |

`snacks.nvim`'s file explorer/picker is configured to show hidden/dotfiles by default (see `lua/plugins/snacks-hidden.lua`) — press `H` inside the explorer to toggle if you ever need to hide them again.
