#!/bin/bash

# Script to check your feature/dev branch is upto date with the Infrastructure Repo main branch

# pipeline variable contains eg. `refs/heads/chore/cleanup-approle`, we need origin/chore/cleanup-approle
branch="${BUILD_SOURCEBRANCH//refs\/heads/origin}"

# Check the commits count which are present in Main branch but not present in your feature/dev branch 
commits_ahead=$(git rev-list --count origin/main ^"$branch")

# complain, if the main branch commits are not present in your feature/dev branch
if [ "$commits_ahead" -eq 0 ]; then   
    echo "Feature branch is up to date with the main branch."
else
    echo "your branch is out-of-date with the main branch by $commits_ahead commits. Please update your branch and try again."
    exit 1
fi
