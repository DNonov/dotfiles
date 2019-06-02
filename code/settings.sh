#! /bin/bash

# Add util functions
. ./utils/clear_file.sh
. ./utils/add_json_brackets.sh
. ./utils/colors.sh

# Get all files
SETTINGS_FILE="./code/settings.json"
EDITOR_SETTINGS="./code/general/editor.jsonc"
WORKBENCH_SETTINGS="./code/general/workbench.jsonc"
PYTHON_SETTINGS="./code/languages/python.jsonc"
CSHARP_SETTINGS="./code/languages/csharp.jsonc"
GIT_SETTINGS="./code/languages/git.jsonc"
EMMET_SETTINGS="./code/extensions/emmet.jsonc"
GITLENS_SETTINGS="./code/extensions/gitlens.jsonc"
CSPELL_SETTINGS="./code/extensions/cspell.jsonc"
VIM_SETTINGS="./code/extensions/vim.jsonc"
ESLINT_SETTINGS="./code/extensions/eslint.jsonc"
ASSOCIATIONS="./code/general/associations.jsonc"


# Create an array
SETTINGS=(
  $EDITOR_SETTINGS
  $WORKBENCH_SETTINGS
  $PYTHON_SETTINGS
  $CSHARP_SETTINGS
  $GIT_SETTINGS
  $EMMET_SETTINGS
  $GITLENS_SETTINGS
  $CSPELL_SETTINGS
  $VIM_SETTINGS
  $ESLINT_SETTINGS
  $ASSOCIATIONS
)

# Link everything together
function link_code_settings() {
  echo -e "${Black}Linking of" "${Blue}$SETTINGS_FILE" "${Black}has been started!"
  clear_file $SETTINGS_FILE

  for aSetting in "${SETTINGS[@]}"; do
    cat $aSetting | sed '1d;$d' >> $SETTINGS_FILE
    echo -e "${Black}--> Link" "${Blue}$aSetting" "${Black}successfully!"
  done

  add_json_brackets $SETTINGS_FILE
  echo -e "${Black}Linking of" "${Blue}$SETTINGS_FILE" "${Black}has been finished!"
}