#!/bin/bash

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap railwaycat/emacsmacport

# from `brew list`
brews=( "asciinema"\
    "autoconf"\
    "automake"\
    "caskroom/cask/brew-cask"\
    "cmake"\
    "emacs-mac"\
    "gdbm"\
    "gettext"\
    "git"\
    "gnu-getopt"\
    "gnupg"\
    "htop-osx"\
    "libav"\
    "libevent"\
    "lua"\
    "nmap"\
    "homebrew/science/octave"\
    "openssl"\
    "pass"\
    "pcre"\
    "pkg-config"\
    "pwgen"\
    "reattach-to-user-namespace"\
    "tmux"\
    "the_silver_searcher"\
    "tig"\
    "tree"\
    "vim"\
    "watch"\
    "wget"\
    "youtube-dl"\
    "zsh" )

for brew in "${brews[@]}"; do
    brew install $brew
done

# from `brew cask list`
casks=( "adobe-creative-cloud" \
    "adobe-reader"\
    "alfred"\
    "amethyst"\
    "android-studio"\
    "battle-net"\
    "caffeine"\
    "disk-inventory-x"\
    "duet"\
    "firefox"\
    "flux"\
    "google-chrome"\
    "google-drive"\
    "google-hangouts"\
    "inkscape"\
    "iterm2"\
    "karabiner"\
    "libreoffice"\
    "mactex"\
    "menumeters"\
    "minecraft"\
    "osxfuse"\
    "paraview"\
    "smoothmouse"\
    "skim"\
    "skype"\
    "steam"\
    "sshfs"\
    "torbrowser"\
    "transmission"\
    "virtualbox"\
    "vlc"\
    "xquartz" )

for cask in "${casks[@]}"; do
    echo $cask
    brew cask install $cask
done
