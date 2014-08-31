# customize the terminal prompt message:
# [h, n] user@computer:directory $
# where h = command history number, and n = number of running processes
#export PS1='[\!, \j] \u@\h:\w $ '
export PS1='\u@\[\e[1m\]\h\[\e[0m\]: \W $ '


# add ~/Scripts and ~/bin to PATH (list of executables for this account)
export PATH=$HOME/Scripts:$PATH
export PATH=$HOME/bin:$PATH


# add ~/lib to library path
export LD_LIBRARY_PATH=~/lib/:/lusr/opt/gcc-4.8.2/lib64/:$LD_LIBRARY_PATH


# make "ls" show results in color
alias ls='ls --color=auto'


# Calling cd will cd normally and then set the "bk" path
function cd()
{
    if [ $# -eq 0 ];
    then
        path=~;
    else
        path=$*;
    fi
    builtin cd "$path" && bk-set
}


# bk will "cd" into the previous last the user was in. If the bkdir file
# doesn't exist, nothing will happen.
# Useful for quickly getting back to the same directory after logout or
# when doing ssh and wanting to get back to where you were...
# TODO:
#   ability to go back (e.g. bk 0 is latest, bk 1 the last, bk 2 before, etc.)
#   setting favorites and using bk to instantly get to them
function bk()
{
    SCRIPTDIR=`scriptdir`
    if [ -e "$SCRIPTDIR/bkdir" ];
    then
        cd `cat $SCRIPTDIR/bkdir`
    fi
}
