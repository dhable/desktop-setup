#!/usr/bin/env fish

# Check if git is available
if not command -sq git
    echo "Error: git is not installed or not in PATH"
    exit 1
end

git config --global user.name "Dan Hable"
git config --global user.email "dan@danhable.com"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RF"
git config --global interactive.diffFilter "diff-so-fancy --patch"
git config --bool --global diff-so-fancy.stripLeadingSymbols false
git config --bool --global diff-so-fancy.markEmptyLines false
git config --global diff-so-fancy.rulerWidth 120

git config --global alias.gone '!git fetch --prune && git branch -vv | awk \'$0 ~ /: gone]/ {print ($1=="*" ? $2 : $1)}\' | xargs git branch -D'
