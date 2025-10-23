# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh
# ZSH plugins
plugins=(
    git
    history
    Z
    kubectl
    vi-mode
)

source $ZSH/oh-my-zsh.sh
bindkey -M viins jj vi-cmd-mode
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/usr/local/opt/ruby/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/ajesh/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

alias git /usr/bin/local/git

### [[ -s "/Users/ajesh/.gvm/scripts/gvm" ]] && source "/Users/ajesh/.gvm/scripts/gvm"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ajesh/Apps/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ajesh/Apps/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ajesh/Apps/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ajesh/Apps/google-cloud-sdk/completion.zsh.inc'; fi

# Check if rancher desktop is installed and set TESTCONTAINERS_HOST_OVERRIDE
if [ -x "$(command -v rdctl)" ]; then
  export TESTCONTAINERS_HOST_OVERRIDE=$(rdctl shell ip a show rd1 | awk '/inet / {sub("/.*",""); print $2}')
fi

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
PATH=$PATH:$(ruby -e 'puts Gem.bindir')
alias ls=colorls
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

## tmux alias
alias tm="$HOME/.config/tmux/startup-script.sh"
alias tx="$HOME/.config/tmux/startup-script.sh quick"
