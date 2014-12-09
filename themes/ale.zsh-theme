# ale.zsh-theme

# Use with a dark background and 256-color terminal!
# Meant for people with rbenv and git. Tested only on OS X 10.7.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#   fino
#   agnoster
#   sorin
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo "±" && return
  echo '○'
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function prompt_ale_pwd {
  local pwd="${PWD/#$HOME/~}"

  if [[ "$pwd" == (#m)[/~] ]]; then
    _prompt_ale_pwd="$MATCH"
    unset MATCH
  else
    _prompt_ale_pwd="${${${${(@j:/:M)${(@s:/:)pwd}##.#?}:h}%/}//\%/%%}/${${pwd:t}//\%/%%}"
  fi
}

function prompt_git() {
  local ref
  is_dirty() {
    test -n "$(git status --porcelain --ignore-submodules)"
  }
  ref="$vcs_info_msg_0_"
  if [[ -n "$ref" ]]; then
    ref="%F{white}on%f ${ref}"
    if $(is_dirty); then
      ref="${ref}%F{red}✘"
    else
      ref="${ref}%F{green}✔"
    fi
    echo "$ref"
  fi
}

prompt_ale_precmd() {
  vcs_info
  prompt_ale_pwd

  PROMPT="%f╭─%F{green}%n%f$prompt_ale_host %F{white}in%f %B%F{yellow}${_prompt_ale_pwd}%b $(prompt_git)
%f╰─$(prompt_char) "
  RPROMPT="%(?..%F{red}%? ↵%f)"
}

prompt_ale_setup() {
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  add-zsh-hook precmd prompt_ale_precmd

  [[ "$SSH_CONNECTION" != '' ]] && prompt_ale_host=' %F{white}at%f %F{blue}%m%f'

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' check-for-changes false
  zstyle ':vcs_info:git*' formats '%b'
  zstyle ':vcs_info:git*' actionformats '%b (%a)'
}

prompt_ale_setup "$@"