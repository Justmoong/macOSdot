# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="jonathan"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
#source ~/CraftRoot/craft/craftenv.sh

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

alias python=python3
alias pip=pip3
alias brew-up='brew update && brew upgrade && brew cleanup'

b() {
    brew cleanup
    brew update
    brew upgrade
    brew cleanup
    echo "Check Complete at $(date)." >> ~/checkbrew.log
}

dot() {
    cd .dotfiles/
    wait 2
    echo "start sync .dotfiles on git"
    sudo git add .
    sudo git commit -m "Fixed at: $(date '+%Y-%m-%d %H:%M:%S')"
    sudo git push
    echo "Fixed at: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Done"
    cd
}

eval "$(rbenv init - zsh)"

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CMAKE_PREFIX_PATH="$HOME/CraftRoot:$CMAKE_PREFIX_PATH"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/ymy/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Qt & KDE & Craft environment

export CMAKE_PREFIX_PATH="$HOME/CraftRoot:$HOME/kde/usr:$CMAKE_PREFIX_PATH"
export CMAKE_PREFIX_PATH=$HOME/Qt/6.8.3/macos:$CMAKE_PREFIX_PATH
export PATH="$HOME/CraftRoot/bin:$HOME/CraftRoot/dev-utils/bin:$HOME/kde/usr/bin:$HOME/kde/src/kdesrc-build:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
#export PKG_CONFIG_PATH="$HOME/kde/usr/lib/pkgconfig:$PKG_CONFIG_PATH"
#export QML2_IMPORT_PATH="$HOME/kde/usr/lib/qml:$QML2_IMPORT_PATH"
#export QT_PLUGIN_PATH="$HOME/kde/usr/lib/plugins:$QT_PLUGIN_PATH"
#export DYLD_LIBRARY_PATH="$HOME/kde/usr/lib:$DYLD_LIBRARY_PATH"
#export CMAKE_PREFIX_PATH=$HOME/kde/usr:$CMAKE_PREFIX_PATH
#export QML2_IMPORT_PATH=$HOME/kde/usr/lib/qml:$QML2_IMPORT_PATH
#export QT_PLUGIN_PATH=$HOME/kde/usr/lib/plugins:$QT_PLUGIN_PATH
#export DYLD_LIBRARY_PATH=$HOME/kde/usr/lib:$DYLD_LIBRARY_PATH
export CRAFTROOT="$HOME/CraftRoot"
export PATH="$CRAFTROOT:$PATH"
export PATH="$CRAFTROOT/bin:$PATH"
export PATH="$CRAFTROOT/build:$PATH"
