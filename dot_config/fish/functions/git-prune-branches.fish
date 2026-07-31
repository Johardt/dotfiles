function git-prune-branches --description 'Delete local branches whose upstream no longer exists'
    git rev-parse --is-inside-work-tree >/dev/null 2>&1
    or begin
        echo "Not a git repository"
        return 1
    end

    git fetch --prune
    or return

    set -l branches
    for branch in (git for-each-ref --format='%(refname:short)|%(upstream:track)' refs/heads)
        set -l fields (string split -m 1 '|' -- $branch)
        if test "$fields[2]" = '[gone]'
            set -a branches $fields[1]
        end
    end

    if test (count $branches) -eq 0
        echo "No local branches have a deleted upstream"
        return
    end

    echo "The following local branches will be deleted:"
    printf '  %s\n' $branches
    read --prompt-str="Delete these branches? [y/N] " --nchars=1 confirmation

    if not string match -qir '^y$' -- $confirmation
        echo "Cancelled"
        return
    end

    git branch -D -- $branches
end
