# Modern replacements for ls
function ls --wraps=eza --description 'alias ls=eza --color=always --group-directories-first --icons'
    eza --color=always --group-directories-first --icons $argv
end

function ll --wraps=eza --description 'alias ll=eza -la --color=always --group-directories-first --icons'
    eza -la --color=always --group-directories-first --icons $argv
end

function la --wraps=eza --description 'alias la=eza -a --color=always --group-directories-first --icons'
    eza -a --color=always --group-directories-first --icons $argv
end

function lt --wraps=eza --description 'alias lt=eza -T --color=always --group-directories-first --icons'
    eza -T --color=always --group-directories-first --icons $argv
end

# Show hidden files
function lh --wraps=eza --description 'alias lh=eza -la … -a'
    eza -la --color=always --group-directories-first --icons -a $argv
end


# Better cat / less
function cat --wraps=bat --description 'alias cat=bat --paging=never'
    bat --paging=never $argv
end

function less --wraps=bat --description 'alias less=bat'
    bat $argv
end

# zoxide replacements
function cd --wraps=z --description 'alias cd=z'
    z $argv
end

function cdi --wraps=zi --description 'alias cdi=zi'
    zi $argv
end

function cdb --wraps=z --description 'alias cdb=z -'
    z - $argv
end

# Better find
function find --wraps=fd --description 'alias find=fd'
    fd $argv
end

# Directory navigation
function .. --description 'cd ..'
    cd ..
end

function ... --description 'cd ../..'
    cd ../..
end

function .... --description 'cd ../../..'
    cd ../../..
end