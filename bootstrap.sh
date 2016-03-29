#!/bin/bash

# Ask for the administrator password upfront
sudo -v

while true;
  do
    sudo -v;
    sleep 290;
    kill -0 "$$" || exit;
done 2>/dev/null &

name() {
  printf "\e[96m
         ██╗ ██████╗           ██████╗ ██╗███████╗███████╗
         ██║██╔═══██╗          ██╔══██╗██║██╔════╝██╔════╝
         ██║██║   ██║  █████╗  ██████╔╝██║█████╗  ███████╗
    ██   ██║██║   ██║  ╚════╝  ██╔══██╗██║██╔══╝  ╚════██║
    ╚█████╔╝╚██████╔╝          ██║  ██║██║███████╗███████║
     ╚════╝  ╚═════╝           ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝\n\e[0m
  "
}

usage() {
  printf "
    \e[36m\e[1mUsage:\e[0m

    \e[36m\e[1mdotfiles\e[0m \e[96m--[parameters]\e[0m

    \e[36m\e[1mParameters:\e[0m\e[36m
        \e[36m- casks      : \e[0m\e[96m installs default native apps via brew-cask\e[0m
        \e[36m- fonts      : \e[0m\e[96m installs default fonts declared from scripts/fonts\e[0m
        \e[36m- gitsetup   : \e[0m\e[96m setup for glolbal git config and setup for Github & Bitbucket SSH Keys\e[0m
        \e[36m- nodepkgs   : \e[0m\e[96m installs npm packages for the default node version\e[0m
        \e[36m- osxdefault : \e[0m\e[96m default setup for osx (for OS X >= 10.8)\e[0m
        \e[36m- rubygems   : \e[0m\e[96m installs gems for web development\e[0m
        \e[36m- terminal   : \e[0m\e[96m setup terminal to use zshell and oh-my-zshell plugin\e[0m\e[0m
  "
}

help() {
  name
  usage
}

if sudo -n true; then
  name
fi

case "$@" in
  # Install first the terminal because it will used for the cask
  # HOMEBREW_CASK_OPTS="--appdir=/Applications"
  ('--terminal')
    exec "${HOME}/Desktop/dotfiles/bin/terminal"; break;;
  ('--osx')
    exec "${HOME}/Desktop/dotfiles/bin/osx"; break;;
  ('--brew')
    exec "${HOME}/Desktop/dotfiles/bin/brew"; break;;
  ('--brew-package')
    dir="/opt/joriescanino"
    sudo mkdir -p ${dir}
    sudo chown ${USER} ${dir}
    exec "${HOME}/Desktop/dotfiles/bin/brew-package"; break;;
  ('--casks')
    exec "${HOME}/Desktop/dotfiles/bin/casks"; break;;
  ('--git')
    exec "${HOME}/Desktop/dotfiles/bin/git"; break;;
  ('--npm')
    exec "${HOME}/Desktop/dotfiles/bin/npm"; break;;
  ('--help')
    help; printf "\n";;
  *)
    printf "\e[101muse --help to see the available parameters\e[0m\n";
esac
