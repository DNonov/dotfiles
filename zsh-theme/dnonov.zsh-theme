#
# Dnonov Theme - Fork of Sobole ZSH Theme
#
# Author: Nikita Sobolev, github.com/sobolevn
# License: WTFPL
# https://github.com/sobolevn/sobole-zsh-theme

# ----------------------------------------------------------------------------
# PROMPT settings
# These settings changes how your terminal prompt looks like
# ----------------------------------------------------------------------------

if [[ "$USER" == "root" ]]; then
  CARETCOLOR="red"
elif [[ "$DNONOV_THEME_MODE" == "dark" ]]; then
  CARETCOLOR="white"
else
  CARETCOLOR="black"
fi

PROMPT='
$(current_venv)$(user_info)$(current_dir) $(git_time_since_commit)
$(current_caret) '

PROMPT2='. '

_return_status="%(?..%{$fg[red]%}%? ⚡%{$reset_color%})"

RPROMPT='%{$(echotc UP 1)%} $(vcs_status) ${_return_status}%{$(echotc DO 1)%}'

function current_caret {
  # This function sets caret color and sign
  # based on theme and privileges.
  if [[ "$USER" == "root" ]]; then
    CARET_COLOR="red"
    CARET_SIGN="$"
  else
    CARET_SIGN="$"

    if [[ "$DNONOV_THEME_MODE" == "dark" ]]; then
      CARET_COLOR="white"
    else
      CARET_COLOR="black"
    fi
  fi

  echo "%{$fg[$CARET_COLOR]%}$CARET_SIGN%{$reset_color%}"
}


function current_dir {
  # Settings up current directory and settings max width for it:
  local _max_pwd_length="65"
  local color

  if [[ "$DNONOV_THEME_MODE" == "dark" ]]; then
    color="white"
  else
    color="black"
  fi

  if [[ $(echo -n $PWD | wc -c) -gt ${_max_pwd_length} ]]; then
    echo "%{$fg[$color]%}%-2~ ... %3~%{$reset_color%} "
  else
    echo "%{$fg[$color]%}%~%{$reset_color%} "
  fi
}

function user_info {
  # Shows user in the PROMPT if needed.
  if [[ ! -z "$SOBOLE_DEFAULT_USER" ]] &&
     [[ "$USER" != "$SOBOLE_DEFAULT_USER" ]]; then
    # This only works if `$SOBOLE_DEFAULT_USER` is not empty.
    # So, when you log in as other user, using `su` for example,
    # your shell tells you who you are. Otherwise it stays silent.
    # You should set `$SOBOLE_DEFAULT_USER` somewhere in your `.zshrc`:
    echo "@$USER "
  fi
}

# ----------------------------------------------------------------------------
# virtualenv settings
# These settings changes how virtualenv is displayed.
# ----------------------------------------------------------------------------

# Disable the standard prompt:
export VIRTUAL_ENV_DISABLE_PROMPT=1

function current_venv {
  if [[ ! -z "$VIRTUAL_ENV" ]]; then
    # Show this info only if virtualenv is activated:
    local dir=$(basename "$VIRTUAL_ENV")
    echo "[$dir] "
  fi
}

# ----------------------------------------------------------------------------
# VCS specific colors and icons
# These settings defines how icons and text is displayed for
# vcs-related stuff. We support only `git`.
# ----------------------------------------------------------------------------

if [[ "$DNONOV_THEME_MODE" == "dark" ]]; then
  ZSH_THEME_GIT_PROMPT_PREFIX="$FG[076]"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY="$FG[196]✗%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚%{$reset_color%}"
else
  ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚%{$reset_color%}"
fi

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[cyan]%}"

function vcs_prompt_info {
  git_prompt_info
}

function vcs_status {
  git_prompt_status
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
                echo "[$COLOR${DAYS}d ${SUB_HOURS}h ${SUB_MINUTES}m%{$reset_color%}|$(vcs_prompt_info)]"
            elif [ "$MINUTES" -gt 60 ]; then
                echo "[$COLOR${HOURS}h ${SUB_MINUTES}m%{$reset_color%}|$(vcs_prompt_info)]"
            else
                echo "[$COLOR${MINUTES}m%{$reset_color%}|$(vcs_prompt_info)]"
            fi
        fi
    fi
}

# ----------------------------------------------------------------------------
# `ls` colors
# Made with: http://geoff.greer.fm/lscolors/
# ----------------------------------------------------------------------------

if [[ "$DNONOV_THEME_MODE" == "dark" ]]; then
  export LSCOLORS="gxfxcxdxbxegedabagacad"
  export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
else
  export LSCOLORS="exfxcxdxBxegedabagacab"
  export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;41"
fi

# Turns on colors with default unix `ls` command:
export CLICOLOR=1

# ----------------------------------------------------------------------------
# `grep` colors and options
# ----------------------------------------------------------------------------

export GREP_COLOR='1;31'

# ----------------------------------------------------------------------------
# `zstyle` colors
# Internal zsh styles: completions, suggestions, etc
# ----------------------------------------------------------------------------

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format "%B--- %d%b"

# ----------------------------------------------------------------------------
# zsh-syntax-highlighting tweaks
# This setting works only unless `$SOBOLE_DONOTTOUCH_HIGHLIGHTING`
# is set. Any value is fine. For exmaple, you can set it to `true`.
# Anyway, it will only take effect if `zsh-syntax-highlighting`
# is installed, otherwise it does nothing.
# ----------------------------------------------------------------------------

if [[ -z "$SOBOLE_DONOTTOUCH_HIGHLIGHTING" ]]; then
  typeset -A ZSH_HIGHLIGHT_STYLES

  # Disable strings highlighting:
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='none'
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='none'

  if [[ "$DNONOV_THEME_MODE" == "dark" ]]; then
    ZSH_HIGHLIGHT_STYLES[path]='fg=white,underline'
  fi
fi
