emulate sh -c 'source /etc/profile'

# Added this only for starting with `startx`
# if you're switching to a DM this block must
# be commented

if [[ "$(tty)" = "/dev/tty1" ]];then
    pgrep dwm || startx
fi

