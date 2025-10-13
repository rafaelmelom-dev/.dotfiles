#!/bin/bash 

# updating dotfiles
cp -r ~/{.bashrc,.oh-my-zsh,.p10k.zsh,.pki,.zshrc} .
rm -rf .oh-my-zsh/.git

echo "Dotfiles updated ...";
