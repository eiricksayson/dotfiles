# Terminal Cheatsheet

> No-mouse, keyboard-first reference for tmux, nvim, fish, and terminal
> workflows.

---

## TMUX

> Prefix key: ⌘+b  (Cmd+b)

### Sessions

| Key | Action |
| --- | --- |
| tmux | new session |
| tmux a | attach last session |
| tmux ls | list sessions |
| ⌘+b $ | rename session |
| ⌘+b d | detach session |
| ⌘+b N | next session |
| ⌘+b P | previous session |
| ⌘+b Tab | jump to last active session (toggle) |

### Windows (tabs)

| Key | Action |
| --- | --- |
| ⌘+b c | new window |
| ⌘+b , | rename window |
| ⌘+b n | next window |
| ⌘+b p | previous window |
| ⌘+b w | list windows |
| ⌘+b & | kill window (asks confirmation) |
| ⌘+b 0-9 | jump to window by number |
| ⌘+b Space | toggle to last-used window |
| Ctrl+S-Left | move window left |
| Ctrl+S-Right | move window right |

### Panes (splits)

| Key | Action |
| --- | --- |
| ⌘+b % | split vertical (side by side) |
| ⌘+b " | split horizontal (top/bottom) |
| ⌘+b - | split horizontal (tmux-pain-control) |
| ⌘+b \| | split vertical (tmux-pain-control) |
| ⌘+b arrow | move between panes |
| ⌘+b h/j/k/l | move between panes vim-style (tmux-pain-control) |
| ⌘+b Ctrl+o | cycle through panes |
| ⌘+b q | show pane numbers, press to jump |
| ⌘+b P | rename current pane |
| ⌘+b ; | jump to last active pane (toggle) |
| ⌘+b z | zoom/unzoom pane (fullscreen toggle) |
| ⌘+b x | kill pane |
| ⌘+b -e | kill all other panes |
| ⌘+b Ctrl+arrow | resize pane |
| ⌘+b o | open current pane path in Finder (custom) |

### Scroll / Copy mode

| Key | Action |
| --- | --- |
| ⌘+b [ | enter copy/scroll mode |
| arrows / j k | scroll line by line |
| Ctrl+u | scroll up half page |
| Ctrl+d | scroll down half page |
| Ctrl+b / ⌘+b | scroll up full page (inside copy mode) |
| Ctrl+f | scroll down full page |
| g | jump to top |
| G | jump to bottom |
| / | search forward |
| n / N | next / previous match |
| q | exit copy mode |

### Copy to clipboard

| Key | Action |
| --- | --- |
| ⌘+b [ | enter copy mode |
| Space | start selection (in copy mode) |
| Enter or y | copy selection to macOS clipboard (pbcopy) + exit copy mode |
| ⌘+b ] | paste tmux's internal buffer |
| mouse click-drag | select with mouse, auto-copies to tmux buffer on release |

### Misc

| Key | Action |
| --- | --- |
| ⌘+b r | reload tmux config |
| ⌘+b ? | show all key bindings (/ to search) |
| ⌘+b o | open current pane path in Finder |

### Popups (display-popup)

| Key | Size | Action |
| --- | --- | --- |
| ⌘+b / | 90%x90% | show cheatsheet (nvim -R, read-only, q to close) |
| ⌘+b g | 80%x80% | lazygit (current pane's directory) |
| ⌘+b v | 95%x95% | neovim (current pane's directory) |
| ⌘+b s | 85%x85% | shell in current directory ($SHELL) |

> Exit any popup or git history/lazygit view: `q`

---

## NEOVIM / LAZYVIM

### File Explorer (Nvim-Tree)

| Key | Action |
| --- | --- |
| leader+e | toggle file explorer |
| leader+E | toggle file explorer + reveal current file |
| H | toggle hidden/dotfiles filter |
| I | toggle gitignored files filter |
| a | add new file/folder (name with trailing `/` = folder) |
| d | delete selected file/folder (uses system trash) |
| r | rename selected file/folder |
| x | cut |
| c | copy |
| p | paste |
| y | copy filename |
| Y | copy relative path |
| gy | copy absolute path |
| R | refresh tree |
| W | collapse all |
| E | expand all |
| Enter / o / l | open file or expand folder |
| h | collapse folder |
| Compact/grouped folders | single-child folders combined (`group_empty`) |

### Save file

| Key | Action |
| --- | --- |
| :w | save |
| :wq / ZZ | save and quit |
| :w newname.txt | save as |
| :wa | save all open buffers |

### Gitsigns — view original line before change

| Key | Action |
| --- | --- |
| leader+ghp | preview hunk (popup diff: old vs new line) |
| ]h / [h | next / previous changed hunk |
| leader+ghb | inline git blame for current line (press again to close) |
| leader+ghs | stage hunk |
| leader+ghr | reset hunk (revert to original) |
| leader+ghd | diff this (split vs index) |
| leader+ghD | diff this vs last commit (~) |
| :Gitsigns blame_line | inline git blame (direct command, bypasses keymap) |

### Scrolling

| Key | Action |
| --- | --- |
| j / k | move down/up (scrolls at screen edge) |
| Ctrl+e / Ctrl+y | scroll down/up one line (cursor stays) |
| Ctrl+d / Ctrl+u | scroll down/up half page |
| Ctrl+f / Ctrl+b | scroll forward/back full page |
| gg / G | jump to top / bottom of file |
| zz | center current line on screen |
| zt / zb | current line to top / bottom of screen |

### Navigation

| Key | Action |
| --- | --- |
| Ctrl+h/j/k/l | move between splits |
| Ctrl+o | jump back in jumplist |
| Ctrl+i | jump forward in jumplist |
| gd | go to definition |
| gD | go to declaration |
| gi | go to implementation (BROKEN: falls back to insert-mode `gi`) |
| gr | go to references |
| gy | go to type definition |
| K | hover docs |
| leader+/ | search in buffer |
| leader+f f | find files |
| leader+f g | live grep |
| leader+f r | recent files |
| leader+f b | find buffers |

### Motions (line / word / cursor)

| Key | Action |
| --- | --- |
| :42 or 42G | go to line 42 |
| $ | end of line |
| 0 | start of line (column 1) |
| ^ | first non-blank char of line |
| g_ | last non-blank char of line |
| w | start of next word |
| b | start of current/previous word (backward) |
| e | end of current/next word |
| E | end of current/next WORD (whitespace-delimited) |
| ge | end of previous word (backward) |
| gE | end of previous WORD (backward) |

### Buffers

| Key | Action |
| --- | --- |
| leader+b d | delete buffer |
| leader+b o | close all other buffers (keep only current) |
| leader+b p | pin buffer |
| H / L | previous / next buffer |
| ]b / [b | next / prev buffer |

### LSP

| Key | Action |
| --- | --- |
| leader+c a | code action |
| leader+c r | rename symbol |
| leader+c f | format |
| yyp | duplicate current line |
| D | delete from cursor to end of line |
| leader+x x | diagnostics |
| ]d / [d | next / prev diagnostic |
| gd | go to definition |
| gD | go to declaration |
| gI | go to implementation |
| gr | go to references/usages |
| gy | go to type definition |
| K | hover docs (signature, javadoc) |

### Editing

| Key | Action |
| --- | --- |
| gc | toggle comment (visual or motion) |
| gcc | comment line |
| gc + motion | comment multiple lines (e.g. gc3j) |
| cs"' | change surrounding " to ' |
| ds" | delete surrounding " |
| ys iw" | add " around word |

### Treesitter Parsers (install missing)

    :TSInstall css scss vue svelte

---

## FISH SHELL

### Aliases from your config

| Alias | Expands to |
| --- | --- |
| ll | eza -l |
| ls | ll |
| lla / lsa | ll -a |
| vi | nvim |
| tf | terraform |
| cm | chezmoi |
| tp | tmuxp |
| ys | hermes -p yinsen |
| co | copilot --autopilot ... (autopilot + full tool/path/url access) |
| lg | lazygit |
| t | tmux |
| ta | tmux a |
| tls | tmux ls |
| tc | tmux a -t copilot |
| routerm | hermes routing-tui (peter profile) |

## NEOVIM

### Telescope (added on top of LazyVim defaults)

| Keymap | Action |
| --- | --- |
| `<leader>tf` | Find files (includes hidden/dotfiles) |
| `<leader>tg` | Live grep (includes hidden/dotfiles) |

## FISH SHELL (continued)

### Fish shortcuts

| Key | Action |
| --- | --- |
| Ctrl+r | search command history |
| Ctrl+l | clear screen |
| Ctrl+a | jump to start of line |
| Ctrl+e | jump to end of line |
| Ctrl+w | delete word back |
| Ctrl+u | clear line |
| Alt+left/right | move word by word |
| Tab | autocomplete |
| Alt+s | prepend sudo to current command |

---

## ASDF VERSION MANAGER

| Command | Action |
| --- | --- |
| asdf list | list installed versions |
| asdf list all java | list all available java versions |
| asdf install java openjdk-21 | install specific version |
| asdf global java openjdk-21 | set global version |
| asdf local java openjdk-21 | set local version (.tool-versions) |
| asdf current | show current versions |
| asdf plugin update --all | update all plugins |

---

## GIT (daily use)

| Command | Action |
| --- | --- |
| git status --short | clean status view |
| git log --oneline -10 | compact log |
| git diff --staged | review what's staged |
| git add -p | interactive staging |
| git stash | stash changes |
| git stash pop | restore stash |
| git switch -c branch | new branch |
| git push -u origin HEAD | push new branch |
| lazygit | full TUI git client |

### Lazygit — squash commits

| Key | Action |
| --- | --- |
| j/k | navigate commits |
| s | squash commit into the one below |
| S | squash ALL commits above into this one |
| r | reword commit message |
| f | fixup (squash without keeping message) |

---

## TMUXP (session manager)

| Command | Action |
| --- | --- |
| tmuxp freeze main | save current session state to ~/.config/tmuxp/main.yaml |
| tmuxp load main | restore saved session |
| tmuxp ls | list saved sessions |

---

## NEOVIM — LuaJIT check

    nvim --version | grep LuaJIT
    # inside nvim:
    :lua print(jit.version, jit.arch, jit.os)

---

## BREW quick reference

| Command | Action |
| --- | --- |
| brew install pkg | install package |
| brew upgrade | upgrade all |
| brew list | list installed |
| brew info pkg | show package info |
| brew uninstall pkg | remove package |
| brew cleanup | remove old versions |

## Chezmoi (dotfiles manager)

Source lives at `~/Developer/<github-username>/dotfiles` (NOT chezmoi's
default `~/.local/share/chezmoi` — this machine's custom location is set via
`sourceDir` in `~/.config/chezmoi/chezmoi.toml`). Plain git repo, no symlinks
— files are copied, not linked. Edit the source, then apply to deploy.

| command | description |
|---|---|
| chezmoi edit <file> | open source copy in editor, auto-apply on save (preferred way to edit) |
| chezmoi apply | deploy source -> $HOME |
| chezmoi diff | preview pending changes before applying |
| chezmoi status | show drift between $HOME and source |
| chezmoi re-add | pull ALL current $HOME changes back into source (if you edited live files directly) |
| chezmoi re-add <file> | pull one specific $HOME file's changes back into source |
| chezmoi update | git pull latest from GitHub + apply in one step |
| chezmoi cd | jump into the source repo (for git add/commit/push) |
| chezmoi source-path | print the actual configured source directory on this machine |

Bootstrap on a new machine (custom source location):
mkdir -p ~/.config/chezmoi
echo 'sourceDir = "/home/<user>/Developer/<github-username>/dotfiles"' > ~/.config/chezmoi/chezmoi.toml
chezmoi init --apply <github-username>

Update flow (local edit -> GitHub):
chezmoi edit <file>  (or edit live + chezmoi re-add)
chezmoi cd && git add -A && git commit -m "..." && git push

Update flow (GitHub -> local machine):
chezmoi update
