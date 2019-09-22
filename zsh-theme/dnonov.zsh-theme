# ----------------------------------------------------------------------------
# Prompt
# ----------------------------------------------------------------------------

PROMPT='
$(virtualenv_prompt_info)$(current_dir)$(git_info)
$(current_caret) '

PROMPT2='. '

_return_status="%(?..%{$fg[red]%}%? ⚡%{$reset_color%})"

RPROMPT='%{$(echotc UP 1)%}${_return_status} $(current_time)%{$(echotc DO 1)%}'

# Get caret
function current_caret {
  if [[ "$USER" == "root" ]]; then
    caret_color="red"
    CARET_SIGN="$"
  else
    CARET_SIGN="$"
  fi

  echo "%{$fg[$caret_color]%}$CARET_SIGN%{$reset_color%}"
}


# Get PWD
function current_dir {
  local _max_pwd_length="65"
  local color='blue'

  if [[ $(echo -n $PWD | wc -c) -gt ${_max_pwd_length} ]]; then
    echo "%{$fg[$color]%}%-2~ ... %3~%{$reset_color%} "
  else
    echo "%{$fg[$color]%}%~%{$reset_color%} "
  fi
}

# Get current time.
function current_time() {
  echo "[`date | rev | cut -d ' ' -f '3' | rev`]"
}

# ----------------------------------------------------------------------------
# Environments
# ----------------------------------------------------------------------------

# Disable the standard prompt:
export VIRTUAL_ENV_DISABLE_PROMPT=1

# ----------------------------------------------------------------------------
# Git
# ----------------------------------------------------------------------------
function git_info {
  inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

  if [ "$inside_git_repo" ]; then
    git_branch=`git branch | cut -d ' ' -f '2'`;
    is_git_dirty=`git status | grep -ic 'nothing to commit'`

    if [[ $is_git_dirty -gt 0 ]]; then
      echo "%{$fg[green]%}$git_branch%{$reset_color%}";
    else
      echo "%{$fg[red]%}$git_branch%{$reset_color%}";
    fi
  fi
}