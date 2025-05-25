#!/usr/bin/env zsh

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"

# Options
shutdown='shutdown'
reboot='reboot'
lock='lock screen'
suspend='suspend'
logout='logout'
hibernate='hibernate'

# Rofi CMD
rofi_cmd() {
    rofi -dmenu \
        -theme-str "window {width: 16em;} listview {lines: 6;}" \
        -p "Power menu" \
        -mesg "Uptime: $uptime" \ 
}

# Pass variables to rofi dmenu
run_rofi() {
    echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
    case $1 in
        --shutdown)
            systemctl poweroff
            ;;
        --reboot)
            systemctl reboot
            ;;
        --suspend)
            mpc -q pause
            amixer set Master mute
            systemctl suspend
            ;;
        --logout)
            loginctl terminate-user $USER
            ;;
        --lock)
            swaylock
            ;;
    esac
}

# Actions
chosen="$(run_rofi)"
case "${chosen}" in
    "${shutdown}")
        run_cmd --shutdown
        ;;
    "${reboot}")
        run_cmd --reboot
        ;;
    "${lock}")
        run_cmd --lock
        ;;
    "${suspend}")
        run_cmd --suspend
        ;;
    "${logout}")
        run_cmd --logout
        ;;
esac
