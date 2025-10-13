#!/bin/bash  

# updating ghostty and nvim configuration 
cp -r ~/.config/{ghostty,nvim,lazyvim} .config/
rm -rf .config/lazyvim/.git

echo ".config updated ...";
