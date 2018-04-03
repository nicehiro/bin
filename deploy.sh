#!/usr/bin/bash

# This script used to deploy Hugo blog to github.
# Get it from Hugo's website.

echo -e "\033[0;32mDeploying updates to Github...\033[0m"

cd /home/hiro/Documents/hugo-static/

# Build the project.
hugo

# Go to public folder
cd /home/hiro/Documents/hugo-static/public/
# Add changes to git
git add .

# Commit changes
msg="rebuilding site `date`"
if [ $# -eq 1 ]
then msg="$1"
fi

git commit -m "$msg"

# Push
git push origin master
