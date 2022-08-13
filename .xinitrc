# All lines ending with `&` must be in `.xprofile` in SDDM
# /home/$USER/bin/batnot &
#trayer --edge bottom --align right --SetDockType true --SetPartialStrut true --expand true --width 20 --transparent true --alpha 0 --height 40 --tint 0x00000000 &
picom &
clipmenud &
# All lines above the `exec dwm` are not required if using SDDM
# added this to do what `startx` does since it no more runs since
rm -f /tmp/serverauth.* &
dunst &
setxkbmap -option "caps:escape" &
#unclutter --timeout 3 &
unclutter -idle 3 &
#flameshot &
slstatus &
wallsxiv r /home/$USER/Pictures/background/ &
xrdb -merge ~/.Xresources
#fcitx -d &
dwm
