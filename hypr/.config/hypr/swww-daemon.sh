#!/bin/bash
WP=~/.config/hypr/wp/
PREV=""
while true; do
  IMG=""
  while [[ "$PREV" == "$IMG" || -z "$IMG" ]] do
    IMG=$(find "$WP" -type f | shuf -n 1)
  done
  swww img "$IMG" --transition-type any --transition-duration 3
  PREV="$IMG"
  sleep 30
done
