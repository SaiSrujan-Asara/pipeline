branch_name="$BUILD_SOURCEBRANCHNAME"
echo "Branch Name: $branch_name"
# git fetch
full_branch_name=$(echo "$(Build.SourceBranch)" | cut -d'/' -f 2)
# Output the full branch name
echo "Full Branch Name: $full_branch_name"

commits_ahead=$(git rev-list --count origin/main ^origin/feat/"$branch_name")
commits_bhead=$(git rev-list --count ^origin/main origin/"$branch_name")
echo "Missing Main commits in feature branch : $commits_ahead"
echo "Missing feature branch commits in Main branch : $commits_bhead"
if [ "$commits_ahead" -eq 0 ]; then
    echo "Feature branch is up to date with the main branch."
else
    echo "Please update your feature branch with the main branch."
    exit 1
fi
