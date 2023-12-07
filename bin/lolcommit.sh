#!/bin/bash

# Function to print help message
print_help() {
  echo "Usage: lolcommit.sh [OPTIONS]"
  echo "Generate a random commit message."
  echo "Options:"
  echo "  -h, --help    Show this help message and exit"
  echo "  -l, --list    List available themes"
  echo "  -t THEME      Use the specified theme (default: all)"
}

# Function to list themes
list_themes() {
  echo "Available themes:"
  for file in ./themes/*.txt; do
    # basename "$file" .txt
    echo "$file"
  done
}

# Function to concatenate all themes
concat_themes() {
  for file in ./themes/*.txt; do
    cat "$file"
  done
}

# Check if no arguments were provided
if [ $# -eq 0 ]; then
  concat_themes | awk 'BEGIN{srand();} {a[NR]=$0} END{print a[int(rand()*NR)+1]}'
  exit 0
fi

# Parse options
while getopts ":hlt:" opt; do
  case ${opt} in
    h)
      print_help
      exit 0
      ;;
    l)
      list_themes
      exit 0
      ;;
    t)
      THEME=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" 1>&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." 1>&2
      exit 1
      ;;
  esac
done

# Manually parse long options
for arg in "$@"; do
  shift
  case "$arg" in
    "--help")
      set -- "$@" "-h"
      ;;
    "--list")
      set -- "$@" "-l"
      ;;
    "--")
      set -- "$@" "-t"
      ;;
  esac
done

if [ -n "$THEME" ]; then
  awk 'BEGIN{srand();} {a[NR]=$0} END{print a[int(rand()*NR)+1]}' "./themes/$THEME.txt"
  exit 0
fi
