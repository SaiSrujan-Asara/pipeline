#!/bin/bash

# Get the current branch name (assuming you are using a relatively recent Git version)
feature_branch=$(git branch --show-current)
echo "Feature branch: $feature_branch"

# Fetch the latest changes from the main branch
git fetch origin main

# Use `git rev-list` to count the number of commits the feature branch is ahead of the main branch
commits_ahead=$(git rev-list --count origin/main.."$feature_branch")

if [ "$commits_ahead" -eq 0 ]; then
    echo "Feature branch is up to date with the main branch."
else
    echo "Feature branch is $commits_ahead commits ahead of the main branch."
fi
