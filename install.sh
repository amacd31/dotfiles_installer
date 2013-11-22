#!/bin/bash

#############################################################################
#    Deploy dotfiles into $HOME
#    Copyright (C) 2013 Andrew MacDonald
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#############################################################################

##############################################################################################
# Inspired by:
#    http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
# Based on:
#    https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
#############################################################################################

dotfiles_dir=$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && cd `pwd`/../ && pwd )
installer_dir=$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
olddir=$HOME/dotfiles_old
files=$(find $dotfiles_dir -maxdepth 1 ! -path $dotfiles_dir ! -path $installer_dir ! -name deploy.sh ! -name ".git*" -exec basename {} \;)

echo "Creating $olddir for backup of any existing dotfiles in $HOME"
mkdir -p $olddir
echo "...done"

echo "Changing to the $dotfiles_dir directory"
cd $dotfiles_dir
echo "...done"

# Move any existing dotfiles in $HOME to $olddir;
# Then create symlinks to the dotfiles/* files replacing existing symlinks as neccessary.
for file in $files; do
    if [ ! -L "$HOME/.$file" ]
    then
        echo "Moving $file from $HOME to $olddir"
        mv $HOME/.$file $olddir
    fi
    echo "Creating symlink to $file in home directory."
    ln -fsT $dotfiles_dir/$file $HOME/.$file
done

