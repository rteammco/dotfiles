# detect platform
OS=`uname`


# customize the terminal prompt message:
# [h, n] user@computer:directory $
# where h = command history number, and n = number of running processes
export PS1='\u@\[\e[1m\]\h\[\e[0m\]: \W $ '


# add ~/Scripts and ~/bin to PATH (list of executables for this account)
export PATH=$HOME/Scripts:$PATH
export PATH=$HOME/bin:$PATH


# add ~/lib to library path
export LD_LIBRARY_PATH=~/lib/:/lusr/opt/gcc-4.8.2/lib64/:$LD_LIBRARY_PATH


# make "ls" show results in color
# OS X:
if [[ $OS == 'Darwin' ]]; then
    export CLICOLOR=1;
    export LSCOLORS=GxFxCxDxBxegedabagaced;
# Linux:
else
    alias ls='ls --color=auto';
    export LPDEST="lw302"
fi

# lls clears screen and then does an 'ls'
alias lls='clear; pwd; ls'

# vm becomes mv because I keep mistyping it
alias vm='echo "mv NOT vm!!!"; mv'

# g++ aliased to always use C++ 11.
alias g++='g++ -std=c++11'

# cppline will alias to 'python cpplint.py' to call the script.
alias cpplint='python `scriptdir`/cpplint.py'


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
    cd `cat $SCRIPTDIR/bkdir`;
    pwd;
  fi
}
