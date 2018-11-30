export EDITOR=nvim
export SSH_KEY_PATH="~/.ssh/dsa_id"
export TERMINAL=urxvt
export SHELL=$(which zsh)

#Android Studio Path
export ANDROID_HOME="/home/freddie/Android/"
export JAVA_HOME="~/Binaries/android-studio/jre"

if ! type "$bat" > /dev/null; then
	export CATTER=bat
else 
	export CATTER=cat
fi
