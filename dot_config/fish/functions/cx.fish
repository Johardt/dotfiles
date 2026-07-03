function cx
    if test (count $argv) -eq 0
        cd ~
    else if test (count $argv) -eq 1
        cd "$argv[1]"
    else
        echo "Usage: cx [dir]"
        return 1
    end

    # Only list if the directory change was successful
    if test $status -eq 0
        eza --color=always --group-directories-first --icons
    end
end
