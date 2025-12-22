#!/usr/bin/env bash

paths=("$HOME/downloads")
dm="dmenu -fn 'Terminess Nerd Font:size=9' -nb '#000000'"
selected=$(find "${paths[@]}" -type f -name "*.pdf" -printf "%f\n" | sort -u | eval $dm)

[ -n "$selected" ] && zathura "$(find "${paths[@]}" -type f -name "$selected" -print -quit)"
