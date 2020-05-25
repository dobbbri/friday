#!/bin/sh

# to make execurable
# chmod +x install.sh

echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Greetings. Preparing to power up and begin diagnostics.$(tput sgr 0)"

echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Checking for Homebrew installation.$(tput sgr 0)"

BREW_FOLDER="/usr/local/bin/brew"

if [ -f "$BREW_FOLDER" ]
then
  echo "$(tput setaf 2)FRIDAY: Homebrew is installed.$(tput sgr 0)"
else
  echo "$(tput setaf 3)FRIDAY: Installing Homebrew. Homebrew requires osx command lines tools, please download xcode first$(tput sgr 0)"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew analytics off
  echo "$(tput setaf 2)FRIDAY: Homebrew installed.$(tput sgr 0)"
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Installing Homebrew Cask packages.$(tput sgr 0)"

tap_packages=(
  # "homebrew/bundle"
  "homebrew/cask"
  "homebrew/cask-fonts"
  "homebrew/core"
)

for package in "${tap_packages[@]}"
do
  echo "$(tput setaf 2)FRIDAY: Brew Tapping $package.$(tput sgr 0)"
  brew tap $package
done
echo "$(tput setaf 2)FRIDAY: Homebrew Tap installed.$(tput sgr 0)"

echo "$(tput setaf 2)FRIDAY: Installing Homebrew System Packages.$(tput sgr 0)"

brew_packages=(
  "autoconf"
  "fzf"
  "git"
  "makedepend"
  "mas"
  "neovim"
  "node"
  "python3"
  "ripgrep"
  "wget"
  "youtube-dl"
#  "tmux"
  "z"
  "zsh"
)

for package in "${brew_packages[@]}"
do
  echo "$(tput setaf 2)FRIDAY: Installing $package.$(tput sgr 0)"
  brew install $package
done
echo "$(tput setaf 2)FRIDAY: Homebrew System Package installed.$(tput sgr 0)"

echo "$(tput setaf 2)FRIDAY: Installing Homebrew Cash Apps.$(tput sgr 0)"
cask_packages=(
  "cyberduck"
  "font-hack-nerd-font"
  "google-chrome"
  "iterm2"
  "sublime-text"
  "sublime-merge"
  "transmission"
  "vlc"
)

for package in "${cask_packages[@]}"
do
  echo "$(tput setaf 2)FRIDAY: Installing $package.$(tput sgr 0)"
  brew cask install $package
done
echo "$(tput setaf 2)FRIDAY: Homebrew Cask Apps installed.$(tput sgr 0)"


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
)

for package in "${pop_packages[@]}"
do
  echo "$(tput setaf 2)FRIDAY: download $package.$(tput sgr 0)"
  wget $package
done
echo "$(tput setaf 2)FRIDAY: PopClip extensions installed.$(tput sgr 0)"



echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: install old versions.$(tput sgr 0)"

old_packages=(
  "wget http://usa.maintain.se/Cocktail11HSE.dmg"
  "wget https://dl.devmate.com/com.macpaw.CleanMyMac3/CleanMyMac3.dmg"
  "wget https://sipapp.io/updates/v1/sip-1.2.dmg"
)

for package in "${old_packages[@]}"
do
  echo "$(tput setaf 2)FRIDAY: download old version of $package.$(tput sgr 0)"
  wget $package
done
echo "$(tput setaf 2)FRIDAY: Old versions installed.$(tput sgr 0)"


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
)

for package in "${mas_packages[@]}"
do
  echo "$(tput setaf 2)FRIDAY: Installing $package.$(tput sgr 0)"
  mas install $package
done
echo "$(tput setaf 2)FRIDAY: Mas Packages installed.$(tput sgr 0)"


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Installing Python packages.$(tput sgr 0)"

pip3_packages=(
  "neovim"
  "vim-vint"
)

for package in "${pip3_packages[@]}"
do
  echo "$(tput setaf 2)FRIDAY: Installing $package.$(tput sgr 0)"
  pip3 install $package
done
echo "$(tput setaf 2)FRIDAY: Python Packages installed.$(tput sgr 0)"


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Installing Node Global package$(tput sgr 0)"

node_packages=(
  "neovim"
  "spaceship-prompt"
  "bash-language-server"
  "eslint"
  "prettier"
  "vtop"
  "@vue/cli"
  "serve"
  "typescript"
)

for package in "${node_packages[@]}"
do
  echo "$(tput setaf 2)FRIDAY: Installing $package.$(tput sgr 0)"
  npm i -g $package
done
echo "$(tput setaf 2)FRIDAY: Node Packages installed.$(tput sgr 0)"


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Installing oh-my-zsh.$(tput sgr 0)"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  echo "$(tput setaf 2)FRIDAY: oh-my-zsh installed.$(tput sgr 0)"
else
  echo "$(tput setaf 2)FRIDAY: oh-my-zsh already installed.$(tput sgr 0)"
fi


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Checking for Git installation.$(tput sgr 0)"

GIT_FOLDER="/usr/local/bin/git"
if ! [[ -f "$GIT_FOLDER" ]]; then
  echo "$(tput setaf 1)FRIDAY: Invalid git installation. Aborting. Please install git.$(tput sgr 0)"
  exit 1
fi

echo "$(tput setaf 2)FRIDAY: Installing Git Packages.$(tput sgr 0)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo "$(tput setaf 2)FRIDAY: Git Packages installed.$(tput sgr 0)"


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Backup up current dotfiles.$(tput sgr 0)"

# Backup files that are provided by the Jarvis into a ~/$HOME/backup directory
BACKUP_FOLDER=$HOME/backup

# Exit immediately if a command exits with a non-zero status.
set -e

# Create backup folder if it doesn't exist
if [ ! -d $BACKUP_FOLDER ]; then
  echo "$(tput setaf 2)FRIDAY: Creating backup directory at $BACKUP_FOLDER.$(tput sgr 0)"
  mkdir -p $BACKUP_FOLDER
fi

files=(
  ".gitconfig"
  ".gitignore_global"
  ".global_ignore"
  # ".tmux.conf"
  ".wgetrc"
  ".zshrc"
)

for filename in "${files[@]}"; do
    if [ -L $HOME/$filename ]; then
      echo "$(tput setaf 2)FRIDAY: Backing up $filename.$(tput sgr 0)"
      mv $HOME/$filename $BACKUP_FOLDER/$filename
    else
      echo "$(tput setaf 3)FRIDAY: $filename does not exist at $HOME.$(tput sgr 0)"
      rm -rf $HOME/$filename
    fi
done

echo "$(tput setaf 2)FRIDAY: Backup completed.$(tput sgr 0)"


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Installing Neovim plugins and linking dotfiles.$(tput sgr 0)"

DOTFILES_FOLDER=$HOME/Dropbox/Mac/Dotfiles
ln -s $DOTFILES_FOLDER/zsh/zshrc $HOME/.zshrc
ln -s $DOTFILES_FOLDER/git/gitconfig $HOME/.gitconfig
ln -s $DOTFILES_FOLDER/git/gitignore_global $HOME/.gitignore_global
ln -s $DOTFILES_FOLDER/git/global_ignore $HOME/.global_ignore
ln -s $DOTFILES_FOLDER/wget/wgetrc $HOME/.wgetrc
# ln -s $DOTFILES_FOLDER/tmux/tmux.conf $HOME/.tmux.conf
echo "$(tput setaf 2)FRIDAY: Linked dotfiles.$(tput sgr 0)"


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Creating Neovim Backup dir.$(tput sgr 0)"

# Create nvim backup folder if it doesn't exist
VIM_BACKUP_FOLDER=$HOME/.local/share/nvim/backup
if [ ! -d $VIM_BACKUP_FOLDER ]; then
    echo "Creating $VIM_BACKUP_FOLDER"
    mkdir -p $VIM_BACKUP_FOLDER
fi

# Create config folder if it doesn't exist
CONFIG_FOLDER=$HOME/.config/nvim
if [ ! -d $CONFIG_FOLDER ]; then
    echo "Creating $CONFIG_FOLDER"
    mkdir -p $CONFIG_FOLDER
fi

echo "$(tput setaf 2)FRIDAY: Linking Neovim config files.$(tput sgr 0)"

VIM_LINK_FOLDER=$DOTFILES_FOLDER/nvim
if [ -e $CONFIG_FOLDER/snippets ]; then
  echo "$(tput setaf 3)FRIDAY: ~${target#$HOME} already exists... Skipping.$(tput sgr 0)"
else
  echo "$(tput setaf 2)FRIDAY: Creating symlink for ${VIM_LINK_FOLDER}.$(tput sgr 0)"
  ln -s $VIM_LINK_FOLDER/coc-settings.json $CONFIG_FOLDER/coc-settings.json
  ln -s $VIM_LINK_FOLDER/plugins.vim $CONFIG_FOLDER/plugins.vim
  ln -s $VIM_LINK_FOLDER/init.vim $CONFIG_FOLDER/init.vim
  ln -s $VIM_LINK_FOLDER/snippets $CONFIG_FOLDER/snippets
fi

echo "$(tput setaf 2)FRIDAY: Installing Neovim packages.$(tput sgr 0)"

curl -fLo $CONFIG_FOLDER/nvim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Installing Space vim-airline theme.$(tput sgr 0)"

cp $VIM_LINK_FOLDER/space.vim $CONFIG_FOLDER/plugged/vim-airline-themes/autoload/airline/themes/space.vim

echo "$(tput setaf 2)FRIDAY: Neovim configured.$(tput sgr 0)"


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Setting Mac defaults.$(tput sgr 0)"

echo "$(tput setaf 2)FRIDAY: Disable touristd.$(tput sgr 0)"
defaults write com.apple.touristd seed-https://help.apple.com/osx/mac/10.13.6/whats-new -date "$(date)"

echo "$(tput setaf 2)FRIDAY: Remove all icons from Dock.$(tput sgr 0)"
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
killall Dock

echo "$(tput setaf 2)FRIDAY: Restore safari bookmarks.$(tput sgr 0)"
cp $HOME/Dropbox/Mac/Settings/Safari/Bookmarks.plist ~/Library/Safari/Bookmarks.plist

echo "$(tput setaf 2)FRIDAY: Restore preferences.$(tput sgr 0)"
cp $HOME/Dropbox/Mac/Settings/Preferences/com.apple.Safari.plist ~/Library/Preferences/com.apple.Safari.plist
cp $HOME/Dropbox/Mac/Settings/Preferences/com.apple.Terminal.plist ~/Library/Preferences/com.apple.Terminal.plist
cp $HOME/Dropbox/Mac/Settings/Preferences/com.apple.dock.plist ~/Library/Preferences/com.apple.dock.plist
cp $HOME/Dropbox/Mac/Settings/Preferences/com.apple.finder.plist ~/Library/Preferences/com.apple.finder.plist
cp $HOME/Dropbox/Mac/Settings/Preferences/com.apple.spaces.plist ~/Library/Preferences/com.apple.spaces.plist
cp $HOME/Dropbox/Mac/Settings/Preferences/com.apple.systempreferences.plist ~/Library/Preferences/com.apple.systempreferences.plist
cp $HOME/Dropbox/Mac/Settings/Preferences/com.apple.systemuiserver.plist ~/Library/Preferences/com.apple.systemuiserver.plist

echo "$(tput setaf 2)FRIDAY: Restore Sublime Text Settings.$(tput sgr 0)"
cp -r $HOME/Dropbox/Mac/Settings/SublimeText/User $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages



#echo "---------------------------------------------------------"
#echo "$(tput setaf 2)FRIDAY: Installing tmux plugin manager.$(tput sgr 0)"

#if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
#  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#  ~/.tmux/plugins/tpm/scripts/install_plugins.sh
#fi


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: Switching shell to zsh. You may need to logout.$(tput sgr 0)"

sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)


echo "---------------------------------------------------------"
echo "$(tput setaf 2)FRIDAY: System update complete. Currently running at 100% power. Enjoy.$(tput sgr 0)"
echo "---------------------------------------------------------"

exit 0
