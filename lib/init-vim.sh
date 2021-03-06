#!/bin/sh


setup_vim () {
    echo "===================== configuring vim =====================$(whoami)"
    . "$HOME/.init.sh"
    brew install neovim
    pip install neovim
    curl https://raw.githubusercontent.com/Alexoner/vimde/master/bootstrap.sh -L |sh -s
    #exit
    cat <<- \EOF >> ~/.init.sh


    ################################### vim ###################################################
    export EDITOR=nvim
    alias vi="vim"
    alias vim="nvim"
    alias vimdiff="nvim -d"
EOF
}

setup_vim
