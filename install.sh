#!/bin/sh
echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Greetings. Preparing to power up and begin diagnostics.$(tput sgr 0)"

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Backup up current files.$(tput sgr 0)"

# Backup files that are provided by the Jarvis into a ~/$HOME-backup directory
BACKUP_DIR=$HOME/backup

# Exit immediately if a command exits with a non-zero status.
set -e

echo "$(tput setaf 2)JARVIS: Creating backup directory at $BACKUP_DIR.$(tput sgr 0)"

# Create backup folder if it doesn't exist
mkdir -p $BACKUP_DIR

files=("$HOME/.config/nvim" "$HOME/.zshrc" "$HOME/.tmux.conf" "$HOME/.wgetrc" "$HOME/.gitconfig" "$HOME/.global_ignore" "$HOME/.global_ignore")
for filename in "${files[@]}"; do
    if [ ! -L $filename ]; then
      echo "$(tput setaf 2)JARVIS: Backing up $filename.$(tput sgr 0)"
      mv $filename $BACKUP_DIR 2>/dev/null
    else
      echo -e "$(tput setaf 3)JARVIS: $filename does not exist at this location or is a symlink.$(tput sgr 0)"
    fi
done

echo "$(tput setaf 2)JARVIS: Backup completed.$(tput sgr 0)"

echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Checking for Homebrew installation.$(tput sgr 0)"

BREW_DIR="/usr/local/bin/brew"

if [ -f "$BREW_DIR" ]
then
  echo "$(tput setaf 2)FRIDAY: Homebrew is installed.$(tput sgr 0)"
else
  echo "$(tput setaf 3)FRIDAY: Installing Homebrew. Homebrew requires osx command lines tools, please download xcode first$(tput sgr 0)"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew analytics off
fi

echo "$(tput setaf 2)FRIDAY: Installing Homebrew system packages.$(tput sgr 0)"
brew_packages=(
  "git"
  "node"
#  "tmux"
  "neovim"
  "python3"
  "zsh"
  "ripgrep"
  "fzf"
  "z"
  "autoconf"
  "makedepend"
  "mas"
p)

for i in "${brew_packages[@]}"
do
  brew install $i
done


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Installing Homebrew Cask packages.$(tput sgr 0)"

tap_packages=(
  "homebrew/bundle"
  "homebrew/cask"
  "homebrew/cask-fonts"
  "homebrew/core"
p)

for i in "${tap_packages[@]}"
do
  brew tap $i
done

cask_packages=(
  "font-hack-nerd-font"
  "sublime-text"
  "sublime-merge"
  "google-chrome"
  "vlc"
  "transmission"
  "cyberduck"
  "youtube-dl"
  "iterm2"
p)

for i in "${cask_packages[@]}"
do
  brew cask install $i
done


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Installing PopClip extensions.$(tput sgr 0)"

pop_packages=(
  "https://pilotmoon.com/popclip/extensions/ext/RunCommand.popclipextz"
  "https://pilotmoon.com/popclip/extensions/ext/GoogleTranslate.popclipextz"
  "http://pilotmoon.com/popclip/extensions/ext/Uppercase.popclipextz"
  "http://pilotmoon.com/popclip/extensions/ext/Lowercase.popclipextz"
  "http://pilotmoon.com/popclip/extensions/ext/Capitalize.popclipextz"
  "https://pilotmoon.com/popclip/extensions/ext/Evernote.popclipextz"
  "https://pilotmoon.com/popclip/extensions/ext/Calculate.popclipextz"
  "https://pilotmoon.com/popclip/extensions/ext/OpenInChrome.popclipextz"
  "https://pilotmoon.com/popclip/extensions/ext/Todoist.popclipextz"
p)

for i in "${pop_packages[@]}"
do
  wget $i
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Installing Mas packages.$(tput sgr 0)"

mas_packages=(
  "443987910"  #1Password
  "634108295"  #Acorn
  "824171161"  #Affinity Designer
  "937984704"  #Amphetamine
  "406056744"  #Evernote
  "671736912"  #FruitJuice
  "1289197285" #MindNode
  "910837444"  #Photo Editor Movavi
  "445189367"  #PopClip
  "1475782381" #RightFont
  "442168834"  #SiteSucker
  "1176895641" #Spark
  "425424353"  #The Unarchiver
  "585829637"  #Todoist
  "1384080005" #Tweetbot
  "1147396723" #WhatsAppas_packages=(
p)

for i in "${mas_packages[@]}"
do
  mas install $i
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Installing Python packages.$(tput sgr 0)"

pip3_packages=(
  "neovim"
  "vim-vint"
p)

for i in "${pip3_packages[@]}"
do
  pip3 install $i
done


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Installing Node Global package$(tput sgr 0)"

node_packages=(
  "neovim"
  "spaceship-prompt"
  "bash-language-serve"
  "eslint"
  "prettier"
  "vtop"
  "@vue/cli"
  "serve"
  "typescript"
p)

for i in "${node_packages[@]}"
do
  npm install $i
done


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Installing oh-my-zsh.$(tput sgr 0)"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "$(tput setaf 2)FRIDAY: oh-my-zsh already installed.$(tput sgr 0)"
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Checking for Git installation.$(tput sgr 0)"

GIT_DIR="/usr/local/bin/git"
if ! [[ -f "$GIT_DIR" ]]; then
  echo "$(tput setaf 1)FRIDAY: Invalid git installation. Aborting. Please install git.$(tput sgr 0)"
  exit 1
fi

echo "$(tput setaf 2)FRIDAY: Installing zsh-autosuggestions.$(tput sgr 0)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Installing Neovim plugins and linking dotfiles.$(tput sgr 0)"
DOTFILES_DIR=$HOME/Dropbox/Mac/Settings/Dotfiles
ln -s $DOTFILES_DIR/zsh/zshrc $HOME/.zshrc
ln -s $DOTFILES_DIR/git/gitconfig $HOME/.gitconfig
ln -s $DOTFILES_DIR/git/gitignore_global $HOME/.gitignore_global
ln -s $DOTFILES_DIR/git/global_ignore $HOME/.global_ignore
ln -s $DOTFILES_DIR/zsh/wgetrc $HOME/.wgetrc
ln -s $DOTFILES_DIR/tmux/tmux.conf $HOME/.tmux.conf


echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Installing nvim config files.$(tput sgr 0)"
# Create config folder if it doesn't exist
CONFIG_DIR=$HOME/.config
if [ ! -d $CONFIG_DIR ]; then
    echo "Creating ~/.config"
    mkdir -p $CONFIG_DIR
fi

config=$DOTFILES_DIR/nvim
target=$CONFIG_DIR/nvim
if [ -e $target ]; then
  echo "$(tput setaf 3)JARVIS: ~${target#$HOME} already exists... Skipping.$(tput sgr 0)"
else
  echo "$(tput setaf 2)JARVIS: Creating symlink for ${config}.$(tput sgr 0)"
  ln -s $config $target
fi

nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Installing Space vim-airline theme.$(tput sgr 0)"

cp ~/.config/nvim/space.vim ~/.config/nvim/plugged/vim-airline-themes/autoload/airline/themes/space.vim

#echo "---------------------------------------------------------"
#echo "$(tput setaf 2)FRIDAY: Installing tmux plugin manager.$(tput sgr 0)"

#if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
#  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#  ~/.tmux/plugins/tpm/scripts/install_plugins.sh
#fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Disable touristd.$(tput sgr 0)"
defaults write com.apple.touristd seed-https://help.apple.com/osx/mac/10.13.6/whats-new -date "$(date)"


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Remove all icons from Dock.$(tput sgr 0)"
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
killall Dock


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Switching shell to zsh. You may need to logout.$(tput sgr 0)"

sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: System update complete. Currently running at 100% power. Enjoy.$(tput sgr 0)"
echo "---------------------------------------------------------"

exit 0
