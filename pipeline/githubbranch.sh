#!/bin/bash

CURRENT_BRANCH=$1

BRANCH_NAME=$(basename $CURRENT_BRANCH)

echo "Current Branch: $BRANCH_NAME"

# Set up GitHub credentials
# export GITHUB_PAT=$GITHUB_PAT

# git config --global user.email "your.email@example.com"
# git config --global user.name "Your Name"

# Clone the GitHub repository using the PAT
# git clone https://$GITHUB_PAT@github.com/SaiSrujan-Asara/terraform.git  

# Continue with your existing logic
git checkout "$BRANCH_NAME"
git fetch origin main
commits_ahead=$(git rev-list --count "$BRANCH_NAME"..origin/main)

if [ "$commits_ahead" -eq 0 ]; then
    echo "Feature branch is up to date with the main branch."
else
    echo "Main branch is $commits_ahead commits ahead of the Feature branch."
    exit 1
    echo "Please update your feature branch with the main branch"
fi
