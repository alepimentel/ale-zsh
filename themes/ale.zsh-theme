# fino.zsh-theme

# Use with a dark background and 256-color terminal!
# Meant for people with rbenv and git. Tested only on OS X 10.7.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo "±" && return
  echo '○'
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'
local prompt_char='$(prompt_char)'

PROMPT="╭─%{$fg[green]%}%n%{$reset_color%} %{$fg[white]%}at%{$reset_color%} %{$fg[blue]%}$(box_name)%{$reset_color%} %{$fg[white]%}in%{$reset_color%} %{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}${git_info}
%{$reset_color%}╰─${prompt_char} "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔"
