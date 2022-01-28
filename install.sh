#/bin/bash

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel 10k ZSH Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install ZSH Plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install iTerm2 Integration
sh -c "$(curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash)"

# Script Parameters
LOCATION="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
if [ "$SPIN" ]; then SCRIPT_MODE="spin"; else SCRIPT_MODE="local"; fi

# Link default files to home directory
ln -sf $LOCATION/aliases ~/.aliases
ln -sf $LOCATION/zshrc ~/.zshrc

# Link appropriate script mode files to home directory
for FILE in `ls ${LOCATION}/${SCRIPT_MODE}` ; do 
  ln -sf $LOCATION/${SCRIPT_MODE}/$FILE ~/.$FILE
done