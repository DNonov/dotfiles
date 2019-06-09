#! /bin/bash

# Add util functions
. ../utils/clear_file.sh
. ../utils/add_json_brackets.sh
. ../utils/colors.sh

# Get all files
SETTINGS_FILE="./settings.json"
EDITOR_SETTINGS="./general/editor.jsonc"
WORKBENCH_SETTINGS="./general/workbench.jsonc"
PYTHON_SETTINGS="./languages/python.jsonc"
CSHARP_SETTINGS="./languages/csharp.jsonc"
GIT_SETTINGS="./languages/git.jsonc"
EMMET_SETTINGS="./extensions/emmet.jsonc"
GITLENS_SETTINGS="./extensions/gitlens.jsonc"
CSPELL_SETTINGS="./extensions/cspell.jsonc"
VIM_SETTINGS="./extensions/vim.jsonc"
ESLINT_SETTINGS="./extensions/eslint.jsonc"
ASSOCIATIONS="./general/associations.jsonc"


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

link_code_settings