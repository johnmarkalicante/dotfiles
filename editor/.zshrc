#!/usr/bin/sh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# MacVim as Default editor
export EDITOR=vim

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jories"

# Aliases
alias zshconfig="vi $HOME/.zshrc"
alias ohmyzsh="cd $HOME/.oh-my-zsh"
alias dotfiles="$HOME/.dotfiles/bootstrap.sh"
#use to reload Finder for hiding and showing .dot files
alias kill-finder="killall Finder"

# Home Folders
# ---------------------------------------------------------------------------

alias home="$HOME && clear"
alias apps="/Applications"
alias music="$HOME/Music/"
alias movies="$HOME/Movies/"
alias pictures="$HOME/Pictures/"
alias documents="$HOME/Documents"

# Projects Directory
# ---------------------------------------------------------------------------

PROJECTS="$HOME/Projects"

alias github="$PROJECTS/github"
alias sandbox="$PROJECTS/sandbox"
alias projects="$PROJECTS"

# Dev Stuff
# ---------------------------------------------------------------------------

# MongoDB
alias mongostart="mongod --dbpath /opt/dotfiles/settings/mongodb/databases"
alias show-dot-files="defaults write com.apple.finder AppleShowAllFiles YES"
alias hide-dot-files="defaults write com.apple.finder AppleShowAllFiles NO"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="false"s

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=10

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby terminalapp)

source $ZSH/oh-my-zsh.sh


# Configs
# -----------------------------------------------------------------------------
# Homebrew
export PATH=/usr/local/bin:$PATH
export PATH="$PATH:/usr/sbin"

# Make /Applications the default location of apps
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# To use Homebrew's directories rather than ~/.rbenv
export RBENV_ROOT="/usr/local/var/rbenv"

# Enable Rbenv shims and autocompletion
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Enable Nodenv shims and autocompletion
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

# Boxen Compatibility
# if [[ -d /opt/boxen ]] ; then
#   [ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
# fi
