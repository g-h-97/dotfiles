
# gtk applications scale
export GDK_SCALE=2
export GDK_DPI_SCALE=-1 # putting this to 0.5 screwed up virtmanager
export GTK2_RC_FILES=$HOME/.config/gtk-2.0/gtkrc-2.0
export GTK_THEME=Flat-Remix-GTK-Blue-Darkest-Solid-NoBorder

# zsh config
#ZDOTDIR=$HOME/.config/zsh

# qt applications scale
export QT_ENABLE_HIGHDPI_SCALING=1
export QT_AUTO_SCREEN_SCALE_FACTOR=2
export QT_SCALE_FACTOR=1.5 picard
#export The QT_QPA_PLATFORMTHEME=qt5ct
export The QT_QPA_PLATFORMTHEME=gtk2

# dmenu password helper
export SUDO_ASKPASS="/home/$USER/bin/dpass"

export PATH=$PATH:/home/$USER/bin
# general env variables
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export BROWSER="firefox-developer-edition"
export READER="zathura"
export VIDEO="mpv"
export IMAGE="sxiv"
export PAGER="less"
export WM="dwm"

