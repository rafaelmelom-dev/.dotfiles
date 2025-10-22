autoload -Uz colors && colors

# Setup prompt 
autoload -Uz promptinit && promptinit
prompt redhat

# Basic zsh auto completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
# Auto completion with case-sensitivy
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Alias to add some colors (default bash config)
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# setting keybinding for vi, and fixing backspace to work as backward-delete-char
bindkey -v '^?' backward-delete-char

#      ____ _   _ ____ _____ ___  __  __ 
#     / ___| | | / ___|_   _/ _ \|  \/  |
#    | |   | | | \___ \ | || | | | |\/| |
#    | |___| |_| |___) || || |_| | |  | |
#     \____|\___/|____/ |_| \___/|_|  |_|
#                                    

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


