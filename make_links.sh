#!/bin/bash

# ┌─────────────────────────────────────────────────────────────────────────┐
# │make_links.sh                                                            │
# │                                                                         │
# │For the symlinking of the dot_files in this repo into the home folder.   │
# │For use upon a fresh OS install or upon the addition of another dot file.│
# └─────────────────────────────────────────────────────────────────────────┘

#│-v-1 │ Variables
#└─────┴───────────

dot_files_dir=~/dot_files
old_files_dir=~/dot_files_old
dot_files="bashrc vimrc hgrc gitconfig"

#│-v-1 │ Main Body of Script
#└─────┴─────────────────────

mkdir -p $old_files_dir/

cd $dot_files_dir/

for dot_file in $dot_files; do
    mv ~/.$dot_file $old_files_dir/
    ln -s $dot_files_dir/$dot_file ~/.$dot_file
done

# vim: set ft=sh fmr=-v-,-^- fdm=marker cms=#%s et ts=4 sw=4 sts=4 :
