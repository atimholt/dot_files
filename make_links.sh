#!/bin/bash

# ┌─────────────────────────────────────────────────────────────────────────┐
# │make_links.sh                                                            │
# │                                                                         │
# │For the symlinking of the dot_files in this repo into the home folder.   │
# │For use upon a fresh OS install or upon the addition of another dot file.│
# └─────────────────────────────────────────────────────────────────────────┘

#│-v-1 │ To-Do's
#└─────┴─────────
# TODO Write a Powershell script for the same purpose, in Windows.
# TODO command line option for non-preservation of destination dot files.

#│-v-1 │ Variables
#└─────┴───────────

# For getting this script’s directory, with caveats.
# From: http://stackoverflow.com/a/246128/837406
dot_files_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

declare -A dot_files

dot_files["bashrc"]=".bashrc"
dot_files["vimrc"]=".vimrc"
dot_files["hgrc"]=".hgrc"
dot_files["gitconfig"]=".gitconfig"
dot_files["inputrc"]=".inputrc"
dot_files["XCompose"]=".XCompose"
dot_files["ycm_extra_conf.py"]=".ycm_extra_conf.py"
dot_files["gitignore_global"]=".gitignore_global"

#│-v-1 │ Main Body of Script
#└─────┴─────────────────────

cd $dot_files_dir/

for dot_file in ${!dot_files[@]}; do
    ln -b -s $dot_files_dir/$dot_file ~/${dot_files["$dot_file"]}
done

exit 0

# vim: set ft=sh fmr=-v-,-^- fdm=marker cms=#%s et ts=4 sw=0 sts=-1 :
