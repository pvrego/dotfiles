#!/bin/sh

HOSTNAME=`hostname`

# Disable beeps
xset -b

# Normal cursor
xsetroot -cursor_name left_ptr &

# Set background color
#xsetroot -solid '#222222' &
#hsetroot -cover ~/wallpapers/blue-gradient.jpg
#hsetroot -tile ~/wallpapers/solarized-pattern.png
#hsetroot -fill ~/wallpapers/fall.jpg # single screen
$HOME/bin/wallpaper.sh
#if [ "$HOSTNAME" = "iddqd" ]
#then
    #hsetroot -fill ~/wallpapers/octahedron-bg-gimp-double.png # dual screen
    #hsetroot -fill ~/wallpapers/octahedron-bg-gimp.png # single screen
    #hsetroot -fill ~/wallpapers/fall.jpg # single screen
#else
    #hsetroot -cover ~/wallpapers/octahedron-bg-gimp.png
#fi

# Hide mouse on inactivity. unclutter messes up i3lock
#unclutter -grab -noevents -root &

# Add shadows
#compton &

# Keyboard layout
#setxkbmap dk
setxkbmap us -option ctrl:nocaps
#setxkbmap us
#setxkbmap dvorak -option ctrl:nocaps

# Set display color profile
#[ -f ~/doc/colorprofile.icc ] && xcalib ~/doc/colorprofile.icc 

# Load environment variable definitions
[ -f ~/.xprofile ] && . ~/.xprofile

# X settings
xrdb ~/.Xresources

# screen powersave
xset +dpms # Energy Star features on
xset dpms 300 600 900 # standby -> suspend -> off (seconds)

# mouse acceleration (xset m <acceleration> <threshold>)
xset m 3/2 4
#xset m 2/1 4

# Set dim LCD brightness
#xbacklight -set 30 &

# Load local fonts
xset +fp ~/.fonts
xset +fp /usr/share/fonts/local
xset fp rehash
#fc-cache
#fc-cache -fv

# Notification deamon
dunst &

# Bluetooth applet
#blueman-applet &

#if [ "$HOSTNAME" == "iddqd" ]; then
    #gnome-settings-daemon &      # handles themes, starts gnome-screensaver. You may have to use gconf to disable it setting the background.
#fi
#nm-applet &                  # assuming you're using Network Manager
#pidgin &                     # if you're using pidgin. You can really put any programs here.
#gnome-power-manager &        # for laptops and stuff
#gnome-volume-manager &       # for mounting CDs, USB sticks, and such
#eval `gnome-keyring-daemon --start --components=secrets` # possible components: gpg,pkcs11,secrets,ssh
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GPG_AGENT_INFO SSH_AUTH_SOCK

# Enable tap-to-click on touchpad
synclient TapButton1=1 TapButton2=2 TapButton3=3

# Automatically suspend system after 20 mins of inactivity
#xautolock -time 20 -locker "sudo pm-suspend" &
# Automatically lock the screen after 10 mins of inactivity
#xautolock -time 10 -locker "i3lock -c 1d1f21 && sleep 30; sudo pm-suspend" &
xautolock -time 10 -locker $HOME/bin/xlock &

# Read .Xmodmap for modified keys
setxkbmap -option ctrl:nocaps
#xmodmap ~/.Xmodmap

# Read .xbindkeysrc for special key-bindings
xbindkeys

# cloud clients
owncloud &
#seafile-applet &

# Setup two monitors at iddqd
if [ "$HOSTNAME" = "iddqd" ]; then

    xrandr --output DVI-D-0 --primary
    xrandr --output DP-1 --auto --left-of DVI-D-0
fi

if [ "$HOSTNAME" != "phony" ]
then
    redshift -l 56.09:10.12 &
fi

# Start screensaver daemon
#/usr/bin/xscreensaver -no-splash &

# Typing breaks (optionally add +lock)
#xwrits breaktime=5:00 typetime=55:00 +clock +breakclock +mouse &
xset dpms 300 600 900

# Automatic display configuration script
nohup bash ~/code/dotfiles/bin/xrandr-auto.sh &

#if [ "$HOSTNAME" == "flaptop" ]; then
    #xrandr --dpi 135
#fi

exec i3
#exec herbstluftwm --locked
#exec gnome-session

#sxhkd &
#exec bspwm
