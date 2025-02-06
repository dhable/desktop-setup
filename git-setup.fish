#!/usr/bin/env fish

git config --global user.name "Dan Hable"
git config --global user.email "dan@danhable.com"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RF"
git config --global interactive.diffFilter "diff-so-fancy --patch"
git config --bool --global diff-so-fancy.stripLeadingSymbols false
git config --bool --global diff-so-fancy.markEmptyLines false
git config --global diff-so-fancy.rulerWidth 120
