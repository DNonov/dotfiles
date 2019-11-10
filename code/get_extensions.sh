#!/bin/bash

set -e;

extension_list_path='./code/extensions_list.txt';

# Get all installed extensions
function get_extensions() {
  touch $extension_list_path;
  code --list-extensions >> $extension_list_path;
}

# Does extensions_list.txt exist
if [ -e $extension_list_path ]; then
  rm $extension_list_path;
  get_extensions;
else
  get_extensions;
fi
