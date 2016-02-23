# set dotfiles directory (where setup was run)
dotfiles_dir=$HOME/Dotfiles  # TODO: automate w/ setup script?


# detect platform
OS=`uname`


# customize the terminal prompt message:
# [h, n] user@computer:directory $
# where h = command history number, and n = number of running processes
export PS1='\u@\[\e[1m\]\h\[\e[0m\]: \W $ '


# add ~/Scripts and ~/bin to PATH (list of executables for this account)
export PATH=$HOME/Scripts:$PATH
export PATH=$HOME/bin:$PATH

# if a local bashrc is also defined (for this machine only), source
# that to add the required local setups.
local_bashrc_file=$dotfiles_dir/.bashrc_local
if [ -a $local_bashrc_file ]; then
  source $local_bashrc_file
fi

# add ~/lib to library path
# TODO: this is a local export and shouldn't be in the repo
export LD_LIBRARY_PATH=~/lib/:/lusr/opt/gcc-4.8.2/lib64/:$LD_LIBRARY_PATH


# make "ls" show results in color
# TODO: have different setup scripts for each OS and source them as needed
# OS X:
if [[ $OS == 'Darwin' ]]; then
    export CLICOLOR=1;
    export LSCOLORS=GxFxCxDxBxegedabagaced;
# Linux:
else
    alias ls='ls --color=auto';
    export LPDEST="lw302"
fi


# source all other bashrc files

# aliased commands
source $dotfiles_dir/.bashrc_alias_commands

# custom function definitions
source $dotfiles_dir/.bashrc_functions
