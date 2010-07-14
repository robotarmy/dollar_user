
# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
export VIM_APP_DIR=/Applications/Writing/
# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="clean"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

function clean_vim() {
find . -name '*.swp' -delete                            
find . -name '*.swo' -delete
}

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/opt/brew/bin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:~/Script/
if [[ -s /Users/o_o/.rvm/scripts/rvm ]] ; then source /Users/o_o/.rvm/scripts/rvm ; fi


