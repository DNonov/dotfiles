#! /bin/bash

set -e;

# Get all installed extensions
function get_extensions() {
  touch ./code/extensions_list.txt;
  code --list-extensions >> extensions_list.txt;
}

# Does extensions_list.txt exist
if [ -e "./code/extensions_list.txt" ]; then
  rm ./code/extensions_list.txt;
  get_extensions
else
  get_extensions
fi
