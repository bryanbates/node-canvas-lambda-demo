#!/usr/bin/env bash

set -ex

# Create a new AWS Linux instance (I last used an m5.4xl)
# SSH in (ec2-user@...)

# Update if needed
sudo yum update

# Install NVM as per https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/setting-up-node-on-ec2-instance.html
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

# Activate NVM w/o having to leave the current session
export NVM_DIR="$HOME/.nvm"
. "$NVM_DIR/nvm.sh"
. "$NVM_DIR/bash_completion"

# Install the desired version of Node
nvm install 8.10.0

# Install Git & dev tools needed to build canvas/fabric
sudo yum install git
sudo yum groupinstall "Development Tools" "Development Libraries"
sudo yum install cairo-devel.x86_64
sudo yum install libjpeg-turbo-devel.x86_64
sudo yum install libjpeg-turbo-static.x86_64
sudo yum install giflib-devel.x86_64 giflib.x86_64

# Create a key
ssh-keygen -b 4096

# Add ssh key to github account as needed
cat ~/.ssh/id_rsa.pub

# Your repo will vary
git clone git@github.com:brycobat/node-canvas-lambda-demo.git

# Clean out old install, re-build canvas/fabric on this Node version
cd node-canvas-lambda-demo/
rm -rf node_modules/

# If this step fails, it's likely because there's some extra dependencies needed.
# The error message(s) should indicate what's missing.
npm install

# Update the local copy of the dependencies for the lambda bundle
./update_aws_deps.sh

# Commit the update
# git add .
# git commit -m "update: Rebuild for Node 8.10"

./bundle.sh

# At this point the node-canvas-lambda-demo.zip has the code for the Lambda func.
