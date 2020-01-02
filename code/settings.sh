#!/bin/bash

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
HTML_SETTINGS="./code/languages/html.jsonc"
JAVASCRIPT_SETTINGS="./code/languages/javascript.jsonc"
EMMET_SETTINGS="./code/extensions/emmet.jsonc"
GITLENS_SETTINGS="./code/extensions/gitlens.jsonc"
CSPELL_SETTINGS="./code/extensions/cspell.jsonc"
VIM_SETTINGS="./code/extensions/vim.jsonc"
ESLINT_SETTINGS="./code/extensions/eslint.jsonc"
CUSTOM_CSS_SETTINGS="./code/extensions/customCss.jsonc"
ASSOCIATIONS="./code/general/associations.jsonc"


# Create an array
SETTINGS=(
  $EDITOR_SETTINGS
  $WORKBENCH_SETTINGS
  $PYTHON_SETTINGS
  $CSHARP_SETTINGS
  $GIT_SETTINGS
  $HTML_SETTINGS
  $JAVASCRIPT_SETTINGS
  $EMMET_SETTINGS
  $GITLENS_SETTINGS
  $CSPELL_SETTINGS
  $VIM_SETTINGS
  $ESLINT_SETTINGS
  $CUSTOM_CSS_SETTINGS
  $ASSOCIATIONS
)

# Link everything together
function link_code_settings() {
  clear_file $SETTINGS_FILE

  for aSetting in "${SETTINGS[@]}"; do
    cat $aSetting | sed '1d;$d' >> $SETTINGS_FILE
  done

  add_json_brackets $SETTINGS_FILE
  echo -e "${Black}Linking of" "${Blue}$SETTINGS_FILE" "${Black}has been finished!"
}

if [ -e $SETTINGS_FILE ]; then
  link_code_settings;
else
  touch ${SETTINGS_FILE} && link_code_settings;
fi
