
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git django python autojump)
# vi-mode

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/var/lib/gems/1.8/bin:/home/cirotteau/.rvm/bin

alias build='source ~/.rvm/scripts/rvm && rm -Rf tmp/* && rm -Rf src/sass-cache && rm -f app/css/app.css && rm -f src/img/ico-* && bundle exec rakep build'
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export JAVA_HOME="/usr/lib/jvm/java-1.7.0-openjdk-amd64"

# The next line updates PATH for the Google Cloud SDK.
source '/home/cirotteau/dev/google-cloud-sdk/path.zsh.inc'

# The next line enables bash completion for gcloud.
source '/home/cirotteau/dev/google-cloud-sdk/completion.zsh.inc'

alias 'xclip' xclip -selection clipboard

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward
