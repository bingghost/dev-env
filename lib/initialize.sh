#!/bin/bash


# init_dev() is more portable than function init_dev() {}
init_env() {
    # Ask for the administrator password upfront
    #sudo -v

    # Keep-alive: update existing `sudo` time stamp until the script has finished
    #while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # Run sections based on command line arguments
    for ARG in "$@"
    do
        if [ $ARG == "bootstrap" ] || [ $ARG == "all" ]; then
            echo ""
            echo "------------------------------"
            echo "Syncing the dev-setup repo to your local machine."
            echo "------------------------------"
            echo ""
            #cd ~ && curl -#L https://github.com/donnemartin/dev-setup/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE}
        fi
		if [ $ARG == 'shell' ] || [ $ARG == 'all' ]; then
            echo ""
            echo "------------------------------"
            echo "Configuring Shell environment."
            echo "------------------------------"
            echo ""
			lib/init-shell.sh
		fi
		if [ $ARG == 'python' ] || [ $ARG == 'all' ]; then
            echo ""
            echo "------------------------------"
            echo "Installing Python environment."
            echo "------------------------------"
            echo ""
			lib/init-python.sh
		fi
		if [ $ARG == 'vim' ] || [ $ARG == 'all' ]; then
            echo ""
            echo "------------------------------"
            echo "Installing Python environment."
            echo "------------------------------"
            echo ""
			lib/init-vim.sh
		fi
		if [ $ARG == 'ml' ] || [ $ARG == 'all' ]; then
            echo ""
            echo "------------------------------"
            echo "Installing machine learning environment."
            echo "------------------------------"
            echo ""
			lib/init-ml.sh
		fi
		if [ $ARG == "osx" ] || [ $ARG == "all" ]; then
			# Run the osxprep.sh Script
			echo ""
			echo "------------------------------"
			echo "Updating OSX and installing Xcode command line tools"
			echo "------------------------------"
			echo ""
			lib/init-osx.sh
		fi
		if [ $ARG == "brew" ] || [ $ARG == "all" ]; then
			# Run the brew.sh Script
			# For a full listing of installed formulae and apps, refer to
			# the commented brew.sh source file directly and tweak it to
			# suit your needs.
			echo ""
			echo "------------------------------"
			echo "Installing Homebrew along with some common formulae and apps."
			echo "This might awhile to complete, as some formulae need to be installed from source."
			echo "------------------------------"
			echo ""
			lib/init-brew.sh
		fi
        #if [ $ARG == "osx" ] || [ $ARG == "all" ]; then
            ## Run the osx.sh Script
            ## I strongly suggest you read through the commented osx.sh
            ## source file and tweak any settings based on your personal
            ## preferences. The script defaults are intended for you to
            ## customize. For example, if you are not running an SSD you
            ## might want to change some of the settings listed in the
            ## SSD section.
            #echo ""
            #echo "------------------------------"
            #echo "Setting sensible OSX defaults."
            #echo "------------------------------"
            #echo ""
            #./osx.sh
        #fi
        if [ $ARG == "pydata" ] || [ $ARG == "all" ]; then
            # Run the pydata.sh Script
            echo "------------------------------"
            echo "Setting up Python data development environment."
            echo "------------------------------"
            echo ""
            lib/init-pydata.sh
        fi
        if [ $ARG == "aws" ] || [ $ARG == "all" ]; then
            # Run the aws.sh Script
            echo "------------------------------"
            echo "Setting up AWS development environment."
            echo "------------------------------"
            echo ""
            lib/init-aws.sh
        fi
        if [ $ARG == "datastores" ] || [ $ARG == "all" ]; then
            # Run the datastores.sh Script
            echo "------------------------------"
            echo "Setting up data stores."
            echo "------------------------------"
            echo ""
            lib/init-datastores.sh
        fi
        if [ $ARG == "web" ] || [ $ARG == "all" ]; then
            # Run the web.sh Script
            echo "------------------------------"
            echo "Setting up JavaScript web development environment."
            echo "------------------------------"
            echo ""
            lib/init-web.sh
        fi
        if [ $ARG == "android" ] || [ $ARG == "all" ]; then
            # Run the android.sh Script
            echo "------------------------------"
            echo "Setting up Android development environment."
            echo "------------------------------"
            echo ""
            lib/init-android.sh
        fi
    done

    echo "------------------------------"
    echo "Completed running!"
    echo "------------------------------"
}


if [ "$1" == "--force" -o "$1" == "-f" ]; then 
    init_env $@
else
    read -p "This script may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then 
        init_env $@
    fi;
fi

unset init_env;
