source $HOME/.bashrc

# when loggin in with SSH, display a message with number of cores on this PC
# as well as the number of unique users
NUNIQUEUSERS=`unique-users`
s='s'
if [ $NUNIQUEUSERS -eq 1 ]; then s=''; fi
echo
echo "Hello! This system as `nproc` cores and $NUNIQUEUSERS unique user$s."