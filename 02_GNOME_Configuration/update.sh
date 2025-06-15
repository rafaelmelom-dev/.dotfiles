#!/bin/bash

# updating gnome dconf configuration
dconf dump / > dconf_settings.ini;
echo "DConf settings save updated ...";

# updating gnome extensions list
gnome-extensions list > gnome_extensions_list.txt
echo "GNOME extensions list updated ...";
