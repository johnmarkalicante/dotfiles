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
        \e[36m- brew        : \e[0m\e[96m brew services and and cask\e[0m
        \e[36m- brew-package: \e[0m\e[96m homebew formulas\e[0m
        \e[36m- terminal    : \e[0m\e[96m setup terminal to use zshell and oh-my-zshell plugin\e[0m\e[0m
        \e[36m- osx         : \e[0m\e[96m default setup for osx (for OS X >= 10.8)\e[0m
        \e[36m- casks       : \e[0m\e[96m installs default native apps via brew-cask\e[0m
        \e[36m- fonts       : \e[0m\e[96m installs default fonts declared from scripts/fonts\e[0m
        \e[36m- git         : \e[0m\e[96m setup for glolbal git config and setup for Github & Bitbucket SSH Keys\e[0m
        \e[36m- npm         : \e[0m\e[96m installs npm packages for the default node version\e[0m
  "
}

help() {
  usage
}

if sudo -n true; then
  name
fi

case "$@" in
  # Install first the terminal because it will used for the cask
  # HOMEBREW_CASK_OPTS="--appdir=/Applications"
  ('--brew')
    exec "${HOME}/.dotfiles/bin/brew"; break;;
  ('--brew-package')
    dir="/opt/dotfiles"
    sudo mkdir -p ${dir}
    sudo chown ${USER} ${dir}
    exec "${HOME}/.dotfiles/bin/brew-package"; break;;
  ('--terminal')
    exec "${HOME}/.dotfiles/bin/terminal"; break;;
  ('--osx')
    exec "${HOME}/.dotfiles/bin/osx"; break;;
  ('--casks')
    exec "${HOME}/.dotfiles/bin/casks"; break;;
  ('--git')
    exec "${HOME}/.dotfiles/bin/git"; break;;
  ('--npm')
    exec "${HOME}/.dotfiles/bin/npm"; break;;
  ('--help')
    help; printf "\n";;
  *)
    printf "\e[101muse --help to see the available parameters\e[0m\n";
esac
