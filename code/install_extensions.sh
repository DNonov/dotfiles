#! /bin/bash

set -e;

while read extension; do
  code --install-extension "$extension";
done < extensions_list.txt;
