source $HOME/.dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle common-aliases
antigen bundle https://github.com/zsh-users/zsh-autosuggestions
antigen bundle git 
antigen bundle django 
antigen bundle python 
antigen bundle fabric 
antigen bundle autojump 
antigen bundle command-not-found
antigen bundle z

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme agnoster

antigen apply

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

alias 'xclip' xclip -selection clipboard

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
