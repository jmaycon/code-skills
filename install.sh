#!/bin/bash
SRC="skills"
DEST="$HOME/.gemini/config/skills"

mkdir -p "$DEST"

for skill in "$SRC"/*; do
  if [ -d "$skill" ]; then
    name=$(basename "$skill")
    rm -rf "$DEST/$name"
    cp -r "$skill" "$DEST/"
  fi
done

echo "Updated -> $DEST"
