# All lines ending with `&` must be in `.xprofile` in SDDM
# /home/hicham/bin/batnot &
picom &
clipmenud &
# All lines above the `exec dwm` are not required if using SDDM
# added this to do what `startx` does since it no more runs since
rm -f /tmp/serverauth.* &
dunst &
setxkbmap -option "caps:escape" &
unclutter --timeout 3 &
#flameshot &
slstatus &
/home/hicham/bin/wallsxiv r /home/hicham/Pictures/background/ &
exec dwm
