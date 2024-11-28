#!/bin/sh

# Define image path 
IMAGE_PATH="$HOME/Downloads/wall-arch.png"

# Define colors
BACKGROUND="#000000"
FOREGROUND="#ffffff"
WRONG="#cc0000"

i3lock \
  --insidever-color=$BACKGROUND     \
  --ringver-color=$FOREGROUND   \
  \
  --insidewrong-color=$BACKGROUND \
  --ringwrong-color=$WRONG     \
  \
  --inside-color=$BACKGROUND        \
  --ring-color=$BACKGROUND        \
  --line-color=$FOREGROUND          \
  --separator-color=$FOREGROUND   \
  \
  --verif-color=$FOREGROUND          \
  --wrong-color=$WRONG          \
  --time-color=$FOREGROUND           \
  --date-color=$FOREGROUND           \
  --layout-color=$FOREGROUND         \
  --keyhl-color=$BACKGROUND         \
  --bshl-color=$BACKGROUND          \
  \
  --time-size=24               \
  --date-size=16               \
  --layout-size=20             \
  \
  --image $IMAGE_PATH                   \
  --blur 9                     \
  --clock                      \
  --indicator                  \
  --time-str="%I:%M %p"     \
  --date-str="%a, %b %e"    \
  --keylayout 1
