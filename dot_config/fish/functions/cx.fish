function cx --description 'Change to a directory and list its contents' --argument-names dir
    if test (count $argv) -eq 0
        cd ~
    else if test (count $argv) -eq 1
        z $argv[1]
    else
        echo "Usage: cx [dir]"
        return 1
    end

    if test $status -eq 0
        eza --color=always --group-directories-first --icons
    end
end
