function reset_spotlight --description "Restart and reindex Spotlight"
    sudo mdutil -a -i off
    sudo mdutil -a -i on
    sudo mdutil -E
end
