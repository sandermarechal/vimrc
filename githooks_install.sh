#!/bin/sh
git config --global init.templatedir '~/.git_template'
mkdir -p ~/.git_template/hooks
cp ~/.vim/git/* ~/.git_template/hooks/
git config --global alias.ctags '!.git/hooks/ctags'
