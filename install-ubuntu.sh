#! /bin/sh

# TODO : define arch from CLI / env & adapt

# install dependencies
sudo apt install build-essential curl fd-find fzf git ripgrep tmux software-properties-common stow zsh -y

# set zsh as defautl shell
chsh -s $(which zsh)

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# bind fdfind to fd
mkdir -p $HOME/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd

# install lazygit (for lazyvim)
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin
rm lazygit*

# install nvm & node
curl curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

nvm install --lts
nvm use --lts

# install .NET
sudo add-apt-repository ppa:dotnet/backports
sudo apt-get update &&
  sudo apt install -y dotnet-sdk-9.0

# install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz
