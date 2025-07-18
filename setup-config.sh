#! /bin/bash

stow git -t $HOME
stow tmux -t $HOME
stow alacritty -t $HOME

mkdir -p $HOME/.config/nvim
stow nvim -t $HOME/.config/nvim
