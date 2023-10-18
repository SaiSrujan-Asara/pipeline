#!/bin/bash

# Get the current branch name
# feature_branch=$(git branch --show-current)
CURRENT_BRANCH=$1

BRANCH_NAME=$(basename $CURRENT_BRANCH)

echo "Current Branch: $CURRENT_BRANCH"

# Fetch the latest changes from the remote main branch
git fetch origin main

# Use `git rev-list` to count the number of commits the  remote main branch is ahead of feature branch 
commits_ahead=$(git rev-list --count "$feature_branch"..origin/main)

if [ "$commits_ahead" -eq 0 ]; then
    echo "Feature branch is up to date with the main branch."
else
    echo "Main branch is $commits_ahead commits ahead of the Feature branch."
    echo "Please update your feature branch with the main branch"
fi
