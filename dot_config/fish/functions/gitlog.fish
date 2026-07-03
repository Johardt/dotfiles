function gitlog
    git rev-parse --is-inside-work-tree >/dev/null 2>&1
    or begin
        echo "Not a git repository"
        return 1
    end

    git --no-pager log --oneline --color=always | fzf --ansi --preview 'git --no-pager show --color=always {1}'
end
