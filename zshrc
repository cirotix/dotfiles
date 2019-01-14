POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_MODE='awesome-fontconfig'

source $HOME/.dotfiles/antigen/antigen.zsh
source ~/.fonts/*.sh

antigen use oh-my-zsh

antigen bundle common-aliases
antigen bundle git 
antigen bundle django 
antigen bundle python 
antigen bundle fabric 
antigen bundle autojump 
antigen bundle command-not-found
antigen bundle z

antigen bundle andrewferrier/fzf-z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme agnoster
#antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

alias 'xclip' xclip -selection clipboard
alias 'bc' bc -l
alias 'hosts' sudo vim /etc/hosts

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# BEGIN SNIPPET: Platform.sh CLI configuration
HOME=${HOME:-'/home/cirotteau'}
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
