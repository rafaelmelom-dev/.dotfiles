# **.dotfiles** 


# GNOME Backup Restore Instructions

This document outlines the steps to restore your Arch Linux GNOME environment using the files in this backup set. It also details how the backup information was collected.

**Backup Date:** `2025-06-14`

## Restore Procedure:

Execute these steps as your regular user unless `sudo` is specified.

### 1. Restore System Packages

* **How this data was collected:**
    * Explicitly installed official repository packages: `pacman -Qqe > 01_System_Setup/pacman_explicit_packages.list`
    * AUR packages (example with `yay`): `yay -Qqm > 01_System_Setup/aur_packages.list`

* **Restore Steps:**
    1.  **Official Packages:**
        ```bash
        sudo pacman -S --needed - < 01_System_Setup/pacman_explicit_packages.list
        ```
        *(The `--needed` flag prevents reinstallation of packages that are already up-to-date or part of the base install).*
    2.  **AUR Packages (Example with `yay`):**
        If you have AUR packages and an AUR helper like `yay`:
        ```bash
        # Ensure your AUR helper is installed first
        yay -S --needed - < 01_System_Setup/aur_packages.list
        ```
        *(Consult your AUR helper's documentation for the correct command if you use a different one).*

### 2. Restore GNOME Configuration (dconf)

* **How this data was collected:**
    * GNOME settings (dconf): `dconf dump / > 02_GNOME_Configuration/dconf_settings.ini`

* **Restore Steps:**
    1.  **Log out of your GNOME session.** It's best to do this from a TTY (Ctrl+Alt+F3, log in as your user) to avoid conflicts with a running session.
    2.  Load the dconf settings:
        ```bash
        dconf load / < 02_GNOME_Configuration/dconf_settings.ini
        ```
    3.  You can now log back into your GNOME session (Ctrl+Alt+F1 or Ctrl+Alt+F7, depending on your setup) or reboot.

* **GNOME Extensions (`gnome_extensions_list.txt`):**
    * **How this data was collected:** Manually, by listing extensions from `~/.local/share/gnome-shell/extensions/`, and `/usr/share/gnome-shell/extensions/`.
    * **Restore Steps:** This list is for reference. You'll need to reinstall these extensions manually, typically from [extensions.gnome.org](https://extensions.gnome.org) or via `pacman` if they were installed as system packages. After reinstalling, their settings should be restored by the `dconf` import above.

### 3. Restore User Application Configurations

* **How this data was collected:** By selectively copying specific directories from `~/.config/` and. For example: `cp -a ~/.config/ghostty ...`

* **Restore Steps:**
    1.  **Ensure applications are closed** before restoring their configurations.
    2.  Copy the backed-up configuration folders back to your new home directory.
        ```bash
        # Create parent directories if they don't exist
        mkdir -p ~/.config

        # Example for .config files:
        cp -a 03_User_Application_Configs/.config/* ~/.config/
        ```

### 4. Restore Dotfiles

* **How this data was collected:** By copying specific dotfiles from your home directory (e.g., `cp ~/.bashrc ...`). 

* **Restore Steps:**
    1.  Copy the dotfiles back to your home directory:
        ```bash
        cp 04_Dotfiles/.bashrc ~/
        cp 04_Dotfiles/.zshrc ~/
        # ... and so on for other dotfiles
        ```

### 5. Final Steps & Verification

1.  **Reboot:** A reboot is often a good idea to ensure all services and settings are loaded correctly.
    ```bash
    sudo reboot
    ```
2.  **Verify:** Log in and check:
    * Application settings.
    * Keyboard shortcuts.
    * Network connections.
    * Autostart applications.
3.  **System Notes (`system_notes.md`):**
    * **How this data was collected:** Manually created notes.
    * **Usage:** Refer to this file for any specific manual configurations you noted down (e.g., kernel parameters to re-apply in GRUB, special driver setups).

This README should serve as a good guide for bringing your GNOME environment back to life on a new installation. Good luck!

