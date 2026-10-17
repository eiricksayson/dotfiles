if status is-interactive
# Commands to run in interactive sessions can go here

# Make reserved words (if/end/for/while/function/etc.) render in the same
# blue as valid commands, instead of falling back to fish's own default.
set --global fish_color_keyword $fish_color_command
end

# history expansion (sudo !!)
abbr -a !! --position anywhere --function __last_history_item

set -gx EDITOR nvim
set -gx VISUAL nvim

if type -q eza
  alias ll "eza -l"
  alias ls "ll"
  alias lla "ll -a"
  alias lsa "ll -a"
end

alias tf "terraform"
alias cm "chezmoi"
alias tp "tmuxp"
alias ys "hermes -p yinsen"

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    # Do nothing
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set -l local_config (dirname (status --current-filename))/config-local.fish
if test -f $local_config
  source $local_config
end

# Homebrew — locate brew across macOS (Apple Silicon / Intel) and Linuxbrew
for brew_bin in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew
  if test -x $brew_bin
    eval "$($brew_bin shellenv fish)"
    break
  end
end
fish_add_path --move --prepend $HOME/.asdf/shims
zoxide init fish | source

alias co "copilot --autopilot --allow-all-tools --allow-all-paths --allow-url '*.corelogic.com' --allow-url '*.cotality.com'"

alias vi "nvim"

alias lg "lazygit"

alias t "tmux"
alias ta "tmux a"
alias tls "tmux ls"
alias tc "tmux a -t copilot"
# Hermes Agent — ensure ~/.local/bin is on PATH

alias routerm "/home/eirick/.hermes/profiles/peter/bin/routing-tui"










set -gx KANBAN_BOARD_ROOT "$EK_HOME/.kanban"

























# EK Platform — ensure ~/.local/bin is on PATH
fish_add_path "$HOME/.local/bin"

# Go-installed binaries (e.g. peco, ghq via `go install`) — added by Copilot CLI
fish_add_path "$HOME/go/bin"

# Testcontainers (Colima): disable Ryuk reaper, its Colima/VZ networking prevents startup
set -gx TESTCONTAINERS_RYUK_DISABLED true
