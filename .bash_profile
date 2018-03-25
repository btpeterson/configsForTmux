source ~/.bashrc
source ~/.profile

# provide path for NuSMV to function correctly
export NUSMV_LIBRARY_PATH=/Users/brianpeterson/nusmv/NuSMV-2.6.0/NuSMV/share/nusmv/

# enable colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

function srcbash {
	source ~/.bash_profile
}

function exportconfigs {
    cp ~/.bash_profile ~/.bashrc ~/.tmux.conf ~/.vimrc ~/.tmuxinator/default.yml ~/github/configsForTmux
    git -C ~/github/configsForTmux pull
    git -C ~/github/configsForTmux add .
    git -C ~/github/configsForTmux commit -m "laksjd"
    git -C ~/github/configsForTmux push
    printf '\nconfigs exported successfully...\n\n'
}
function importconfigs {
    git -C ~/github/configsForTmux pull
    cp ~/github/configsForTmux/.bashrc ~/.bashrc
    cp ~/github/configsForTmux/.bash_profile ~/.bash_profile
    cp ~/github/configsForTmux/.vimrc ~/.vimrc
    cp ~/github/configsForTmux/.tmux.conf ~/.tmux.conf
    cp ~/github/configsForTmux/default.yml ~/.tmuxinator/default.yml
    printf '\nconfigs imported successfully\n\n'
}

source ~/.bash_git

parse_git_branch() {
         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
     }
export PS1="\[\033[0;35m\]\w\[\033[0;36m\]\$(parse_git_branch)\[\033[00m\]\[\033[0;35m\] $ \[\033[00m\]"
###  another way to color prompt string one...  ###
#PS1="\[\033[35m\]\w\[\033[0m\]\$(__git_ps1)\[\033[35m\] $ \[\033[0m\]"
