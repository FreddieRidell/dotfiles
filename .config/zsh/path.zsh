#good defaults
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"

#android stuff
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"

#Various Yarn global install paths
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="./node_modules/.bin:$PATH" 
export PATH="../node_modules/.bin:$PATH" 
export PATH="../../node_modules/.bin:$PATH" 
export PATH="../../../node_modules/.bin:$PATH" 
export PATH="../../../../node_modules/.bin:$PATH" 

#rustup
export PATH="$HOME/.cargo/bin:$PATH"

#App images etc
export PATH="$HOME/Binaries:$PATH"
export PATH="$HOME/bin:$PATH"

#snap
export PATH="$PATH:/snap/bin"

export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

export PATH="$PATH:/Users/freddie/.nvm/versions/node/v18.16.0/bin"
export PATH="$PATH:/Users/freddie/.nvm/versions/node/v18.16.0/bin/npm"
export PATH="$PATH:$(brew --prefix python)/libexec/bin"
