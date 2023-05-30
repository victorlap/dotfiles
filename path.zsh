# Load Composer tools
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Load jetbrains helpers
export PATH="$HOME/Library/Application Support/JetBrains/bin:$PATH"

# Load pip global installed binaries
#export PATH="$HOME/Library/Python/2.7/bin:$PATH"
#export PATH="$HOME/Library/Python/3.11/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Make sure coreutils are loaded before system commands
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Use brew ruby before system ruby
export PATH="/usr/local/opt/ruby/bin:$HOME/gems/bin:$PATH"
export GEM_HOME=$HOME/gems

# Add kubens to prompt
export PROMPT="$PROMPT>$(kubens -c)@$(kubectx -c)"

# Setup fzf
#export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
#[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
#source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# Blackfire
#export BLACKFIRE_CLIENT_ID="46e8483a-3a71-4bab-8583-2e48dc0823f2"
#export BLACKFIRE_CLIENT_TOKEN="7fdb79755db78211eea6e98568135080286a45a2c5cb80874be894d6c33fbb52"

#export BLACKFIRE_SERVER_ID="e4fb9a29-dfe0-4b49-a109-7d07afee7338"
#export BLACKFIRE_SERVER_TOKEN="260b1438f0c5d2bdf70b5178b67b4daf8b8871fbf9d6e6d0e9306ac3bbb18c5e"

# Symfony console autocomplete

# Flutter
#export PATH="$PATH:/Users/victorlap/Developer/flutter/bin"
