#!/bin/bash

# Fail on any error.
set -e

# Ensure proper permissions for the mounted volume.
sudo chown vscode:vscode ~/poodi_virtual

cd ~/poodi_virtual

##########################################
# Cloning repo in ~/poodi_virtual folder #
##########################################

# If the current directory is empty, we consider it the first start.
# As the code folder is mounted from Volume, we should avoid rewriting
# "/poodi-workspace" if something is already in this folder.
if [[ "$(ls -A .)" ]]; then
    echo 'Directory not empty. Skip cloning repo.'
else
    echo 'Directory is empty. Cloning repo...'

    # Clone the main repo inside the current directory.
    git clone https://github.com/PotatoCanyon/poodi_virtual.git .
fi

###########################
# Installing dependencies #
###########################

if [[ "$(ls -A .)" ]]; then
    echo 'Directory is not empty. Installing dependencies...'

    # Install deps for ruby
    bundle install
fi
