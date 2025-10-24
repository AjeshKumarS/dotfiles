#!/bin/bash

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing Brewfile packages..."
brew bundle --file=./brew/Brewfile

# Check if oh-my-zsh is installed, install if we don't have it without exiting the script
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Check if Powerlevel10k theme is installed, install if we don't have it
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then 
  echo "Cloning Powerlevel10k repository..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Check if tmux plugin manager is installed, install if we don't have it
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing Tmux Plugin Manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Check if colorls is installed, install if we don't have it
if ! gem list -i colorls > /dev/null 2>&1; then
  echo "Installing colorls gem..."
  gem install colorls
fi

echo "Stowing dotfiles..."
stow nvim
stow ghostty
stow brew
stow zsh
stow tmux
stow yazi
stow vim
stow ssh
stow vscode --adopt
