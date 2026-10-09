#!/bin/sh

SCRIPT_DIR=~/dotfiles/skills
CLAUDE_SKILL_DIR=~/.claude/skills

mkdir -p "$CLAUDE_SKILL_DIR"

for skill in "$SCRIPT_DIR"/*/
do
  name=$(basename "$skill")
  rm -rf "$CLAUDE_SKILL_DIR/$name"
  ln -s "${SCRIPT_DIR}/${name}" "$CLAUDE_SKILL_DIR/$name"
  echo "linked: $name"
done
