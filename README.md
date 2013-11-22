dotfiles_installer
==================
Inspired by Michael J Smalley's dotfiles project
(https://github.com/michaeljsmalley/dotfiles)
this installer was created to separate the personal
configuration from the deployment.

Deployment is achieved by having symlinks to a git
repository of configuration files.


Installation
============

Within a personal dotfiles git project add this repository by running:

    git submodule add https://github.com/amacd31/dotfiles_installer.git
    
The dotfiles project should store configuration files/directories without the leading dot.


Usage
=====

Running install.sh will for each $file (barring some exclusions) in the directory above (parent dotfiles repository):

1. Backup (i.e. move) existing matching .$file in $HOME to $HOME/dotfiles_old
1. Create/replace symlink to .$file with a symlink to $file in your dotfiles git repository.

When the parent dotfiles repository has been updated (with git pull or similar) to include more configuration files install.sh can be run again.
Any existing symlinks will be replaced and original dotfiles will be moved to $HOME/dotfiles_old.


Example
=======

See https://github.com/amacd31/dotfiles for an example use of the dotfiles_installer.
