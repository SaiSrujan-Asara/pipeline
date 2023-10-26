#!/bin/bash
1
# Define your feature branch and the remote main branch
branch_reference="$BUILD_SOURCEBRANCHNAME"
FEATURE_BRANCH=${branch_reference#refs/heads/}
echo "Branch Name: $FEATURE_BRANCH"

MAIN_BRANCH="main"

# Function for error handling
function handle_error() {
  echo "Error: $1"
  exit 1
}

# Function to check for merge conflicts
function check_for_merge_conflicts() {
  if git diff --name-only --diff-filter=U | grep -q .; then
    handle_error "Merge conflicts detected. Resolve conflicts and commit changes before pushing."
  fi
}

# Fetch the latest changes from the remote main branch
git fetch origin "$MAIN_BRANCH" || handle_error "Failed to fetch latest changes from $MAIN_BRANCH."

# Check out the feature branch
git checkout "$FEATURE_BRANCH" || handle_error "Failed to check out $FEATURE_BRANCH."

# Merge the latest changes from the main branch into the feature branch
git pull origin "$MAIN_BRANCH" || handle_error "Failed to merge changes from $MAIN_BRANCH."

# Check for merge conflicts
check_for_merge_conflicts

# Push the updated feature branch back to the remote repository
git push origin "$FEATURE_BRANCH" || handle_error "Failed to push changes to $FEATURE_BRANCH."

# Success message
echo "Feature branch $FEATURE_BRANCH is now up to date with $MAIN_BRANCH."
