#! /bin/bash

function clear_file() {
  sed -i '1,$d' $1
};