source $HOME/.dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git 
antigen bundle django 
antigen bundle python 
antigen bundle fabric 
antigen bundle autojump 
antigen bundle zsh-navigation-tools

antigen theme agnoster

antigen apply

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/var/lib/gems/1.8/bin:/home/cirotteau/.rvm/bin

alias build='source ~/.rvm/scripts/rvm && rm -Rf tmp/* && rm -Rf src/sass-cache && rm -f app/css/app.css && rm -f src/img/ico-* && bundle exec rakep build'
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export JAVA_HOME="/usr/lib/jvm/java-1.7.0-openjdk-amd64"


alias 'xclip' xclip -selection clipboard

# ctrl-r starts searching history backward
# bindkey '^r' history-incremental-search-backward

autoload znt-history-widget
zle -N znt-history-widget
bindkey "^R" znt-history-widget
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
