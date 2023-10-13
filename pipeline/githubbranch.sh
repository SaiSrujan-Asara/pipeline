!/bin/bash
# Get the latest commit hash of the main branch
main_branch_commit=$(git ls-remote --heads origin main | awk '{print $1}')

# Get the latest commit hash of the current feature branch
feature_branch_commit=$(git rev-parse HEAD)

# Compare the commit hashes
if [ "$main_branch_commit" != "$feature_branch_commit" ]; then
  echo "The feature branch is outdated with the main branch."
  echo "Main branch commit: $main_branch_commit"
  echo "Feature branch commit: $feature_branch_commit"
  exit 1  # Fail the pipeline
fi