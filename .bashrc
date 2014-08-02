# go to home (~) path (to remove weird full path clutter)
#cd

# customize the terminal prompt message:
# [h, n] user@computer:directory $
# where h = command history number, and n = number of running processes
#export PS1='[\!, \j] \u@\h:\w $ '
export PS1='\u@\[\e[1m\]\h\[\e[0m\]: \W $ '

# add ~/Scripts and ~/bin to PATH (list of executables for this account)
export PATH=$HOME/Scripts:$PATH
export PATH=$HOME/bin:$PATH

# add ~/lib to library path
export LD_LIBRARY_PATH=~/lib/:$LD_LIBRARY_PATH

# make "ls" show results in color
alias ls='ls --color=auto'

# when loggin in with SSH, display a message with number of cores on this PC
if [[ -n $SSH_CONNECTION ]]; then
    echo Welcome! This system as `nproc` cores.
fi

# Calling cd will first set the "bk" path, and then cd normally.
function cd()
{
    if [ $# -eq 0 ];
    then
        path=~;
    else
        path=$*;
    fi
    bk-set && builtin cd "$path"
}

# bk will "cd" into the previous directory the user was in. If the bkdir file
# doesn't exist, nothing will happen.
function bk()
{
    SCRIPTDIR=`scriptdir`
    if [ -e "$SCRIPTDIR/bkdir" ];
    then
        cd `cat $SCRIPTDIR/bkdir`
    fi
}
