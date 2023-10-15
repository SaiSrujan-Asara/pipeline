#!/bin/bash

feature_branch= $(git branch --show-current)
echo "Feature branch: $feature_branch"
echo "Main branch: $main_branch"

git fetch origin main

value = $(git rev-list --count origin/main..test1)

if [ value == 0 ]; then
    echo "Feature Branch is Upto date with main branch"
else
    echo "Feature Branch is not Upto date with main branch"
fi
