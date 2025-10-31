#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

#                  _                                      _
#   ___ _ ____   _(_)_ __ ___  _ __  _ __ ___   ___ _ __ | |_
#  / _ \ '_ \ \ / / | '__/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
# |  __/ | | \ V /| | | | (_) | | | | | | | | |  __/ | | | |_
#  \___|_| |_|\_/ |_|_|  \___/|_| |_|_| |_| |_|\___|_| |_|\__|

# Setting up java environment
export JAVA_HOME="/usr/lib/jvm/java-25-openjdk/"
export PATH="$JAVA_HOME/bin:$PATH"

# Setting up android environment
export ANDROID_HOME="/opt/android-sdk"
export ANDROID_SDK_ROOT="/opt/android-sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"

# Setting up miniconda to path 
export PATH="$PATH:/opt/miniconda3/bin"
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

source ~/.credentials
alias lazyvim='NVIM_APPNAME=lazyvim nvim'
alias faculdade="cd ~/Desktop/Projects/Faculdade/"

ydl_playlist_mp3() {
  if [ -z "$1" ]; then
    echo "Usage: ydl_playlist_mp3 <YouTube Playlist URL>"
    return 1
  fi
  yt-dlp -x --audio-format mp3 --audio-quality 160K --yes-playlist --output "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" "$1"
}
