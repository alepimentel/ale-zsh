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

local git_info='git'

PROMPT="%f╭─%F{green}%n%f %F{white}in%f %B%F{yellow}%~%b
%f╰─$(prompt_char) "
	
ZSH_THEME_GIT_PROMPT_PREFIX=" %F{white}on %F{255}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}✔"
