#!/bin/bash

function add_json_brackets() {
  sed -i '1i {' $1;
  echo -e '\n}' >> $1;
};
