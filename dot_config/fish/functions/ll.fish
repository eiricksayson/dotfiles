function ll --wraps ls --description "List contents of directory using long format"
    eza -l -g --icons --git --time-style=long-iso $argv
end
