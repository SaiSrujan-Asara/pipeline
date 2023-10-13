#!/bin/bash

main_branch="main"
feature_branch=$(git branch --show-current)

# Ensure we're in the repository directory
cd /path/to/your/repository

# Fetch the latest changes from the remote repository
git fetch origin

# Check if the feature branch is up to date with the main branch
if git rev-list --left-right --count origin/${main_branch}...origin/${feature_branch} | awk '{print $1}' | grep -qE "^[1-9]"; then
  echo "Feature branch is not up to date with the main branch."
  exit 1
else
  echo "Feature branch is up to date with the main branch."
  exit 0
fi


# # Get the latest commit hash of the main branch
# main_branch_commit=$(git ls-remote --heads origin main | awk '{print $1}')

# # Get the latest commit hash of the current feature branch
# feature_branch_commit=$(git rev-parse HEAD)

# # Compare the commit hashes
# if [ "$main_branch_commit" != "$feature_branch_commit" ]; then
#   echo "The feature branch is outdated with the main branch."
#   echo "Main branch commit: $main_branch_commit"
#   echo "Feature branch commit: $feature_branch_commit"
#   exit 1  # Fail the pipeline
# else
#   echo "Feature branch is up to date with the main branch."
#   exit 0
# fi