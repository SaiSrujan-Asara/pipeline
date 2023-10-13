#!/bin/bash

# Define your feature branch and main branch
feature_branch="your-feature-branch"
main_branch="main"

# Fetch the latest changes from GitHub
git fetch

# Check out the feature branch
git checkout $feature_branch

# Compare the feature branch with the main branch
git status -uno

# Check the result
if [[ $? -eq 0 ]]; then
  echo "The feature branch is up-to-date with $main_branch."
elif [[ $? -eq 128 ]]; then
  echo "The feature branch is behind $main_branch."
else
  echo "The feature branch is ahead of $main_branch."
fi
