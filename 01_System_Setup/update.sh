#!/bin/bash 


# updating flatpak apps list
flatpak list --app --columns=application > flatpak_packages.list
echo "Flatpak apps list updated ...";

# updating pacman packages 
pacman -Qqe > pacman_explicit_packages.list
echo "Pacman apps list updated ...";

# updating aur packages (using yay)
yay -Qqm > aur_packages.list
echo "Aur apps list updated ...";
