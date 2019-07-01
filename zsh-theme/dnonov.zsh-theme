# ----------------------------------------------------------------------------
# Prompt
# ----------------------------------------------------------------------------

PROMPT='
┌─$(current_dir)$(current_venv)$(javascript_env)$(git_time_since_commit)
└─$(current_caret) '

PROMPT2='. '

_return_status="%(?..%{$fg[red]%}%? ⚡%{$reset_color%})"

RPROMPT='%{$(echotc UP 1)%}${_return_status} $(current_time)%{$(echotc DO 1)%}'

# Get caret
function current_caret {
  if [[ "$USER" == "root" ]]; then
    CARET_COLOR="red"
    CARET_SIGN="$"
  else
    CARET_SIGN="$"
  fi

  echo "%{$fg[$CARET_COLOR]%}$CARET_SIGN%{$reset_color%}"
}


# Get PWD
function current_dir {
  local _max_pwd_length="65"
  local color

  if [[ $(echo -n $PWD | wc -c) -gt ${_max_pwd_length} ]]; then
    echo "[%{$fg[$color]%}%-2~ ... %3~%{$reset_color%}] "
  else
    echo "[%{$fg[$color]%}%~%{$reset_color%}] "
  fi
}

# Get current time.
function current_time() {
  echo "[`date | cut -d ' ' -f '5'`]"
}

# ----------------------------------------------------------------------------
# Environments
# ----------------------------------------------------------------------------

# Disable the standard prompt:
export VIRTUAL_ENV_DISABLE_PROMPT=1

function current_venv {
  if [[ ! -z "$VIRTUAL_ENV" ]]; then
    python_version=`python --version`
    local dir=$(basename "$VIRTUAL_ENV")
    local env="%{$fg[blue]%}ENV: %{$reset_color%}"
    python="%{$fg[green]%}$python_version%{$reset_color%}"
    echo "[$env$python]"
  fi
}



function javascript_env() {
  detect_package=`ls | grep -c 'package.json'`;

  if [[ $detect_package -gt 0 ]]; then
    node_version=`node --version`;
    node_symbol="%{$fg[green]%}⬡️%{$reset_color%}";
    _node_version="%{$fg[green]%}$node_version%{$reset_color%}";

    echo "[$node_symbol $_node_version]";
  fi
}

# ----------------------------------------------------------------------------
# Git
# ----------------------------------------------------------------------------

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[blue]%}"

function git_info {
  git_branch=`git branch | cut -d ' ' -f '2'`;
  is_git_dirty=`git status | grep -ic 'nothing to commit'`

  if [[ $is_git_dirty -gt 0 ]]; then
    echo "%{$fg[green]%}$git_branch%{$reset_color%}";
  else
    echo "%{$fg[red]%}$git_branch%{$reset_color%}";
  fi
}

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function git_time_since_commit() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    # Only proceed if there is actually a commit.
    if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
      # Get the last commit.
      last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
      now=`date +%s`
      seconds_since_last_commit=$((now-last_commit))

      # Totals
      MINUTES=$((seconds_since_last_commit / 60))
      HOURS=$((seconds_since_last_commit/3600))

      # Sub-hours and sub-minutes
      DAYS=$((seconds_since_last_commit / 86400))
      SUB_HOURS=$((HOURS % 24))
      SUB_MINUTES=$((MINUTES % 60))

      if [[ -n $(git status -s 2> /dev/null) ]]; then
        if [ "$MINUTES" -gt 30 ]; then
          COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG"
        elif [ "$MINUTES" -gt 10 ]; then
          COLOR="$ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM"
        else
          COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT"
        fi
      else
        COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
      fi

      if [ "$HOURS" -gt 24 ]; then
        echo "[$COLOR${DAYS}d ${SUB_HOURS}h ${SUB_MINUTES}m%{$reset_color%}|$(git_info)]"
      elif [ "$MINUTES" -gt 60 ]; then
        echo "[$COLOR${HOURS}h ${SUB_MINUTES}m%{$reset_color%}|$(git_info)]"
      else
        echo "[$COLOR${MINUTES}m%{$reset_color%}|$(git_info)]"
      fi
    fi
  fi
}
