# Load Composer tools
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Load Go
export PATH="$HOME/go/bin:$PATH"

# Load jetbrains helpers
export PATH="$HOME/Library/Application Support/JetBrains/bin:$PATH"

# JAVA
# export JAVA_HOME=/opt/homebrew/opt/openjdk@11/

# Claude et al.
export PATH="$HOME/.local/bin:$PATH"

#Load pip global installed binaries
#export PATH="$HOME/Library/Python/2.7/bin:$PATH"
#export PATH="$HOME/Library/Python/3.11/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Make sure coreutils are loaded before system commands
# export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Use brew ruby before system ruby
export PATH="/usr/local/opt/ruby/bin:$HOME/gems/bin:$PATH"
export GEM_HOME=$HOME/gems

# Add kubens to prompt
export PROMPT="$PROMPT>$(kubens -c)@$(kubectx -c)"

# Add krew
PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Setup fzf
#export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
#[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
#source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# Flutter
#export PATH="$PATH:/Users/victorlap/Developer/flutter/bin"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
