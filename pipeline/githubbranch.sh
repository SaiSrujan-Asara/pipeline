#!/bin/bash

# Define the names of the main and feature branches
main_branch="main"
feature_branch="test1"

# Fetch the latest changes from the remote repository
git fetch

# Check if the feature branch is up to date with the main branch
if git log --graph --oneline --decorate ${main_branch}..${feature_branch} --abbrev-commit | grep -qE "^\*"; then
  echo "Feature branch is not up to date with the main branch."
  exit 1
else
  echo "Feature branch is up to date with the main branch."
  exit 0
fi
