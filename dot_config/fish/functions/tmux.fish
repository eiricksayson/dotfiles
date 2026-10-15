# Wrap tmux so bare `tmux` always starts a named session instead of session 0
# This prevents tmux-resurrect from crashing on restore (session "0" bug)
function tmux
    if test (count $argv) -eq 0
        command tmux new-session -A -s main
    else
        command tmux $argv
    end
end
