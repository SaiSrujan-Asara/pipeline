branch_reference="$BUILD_SOURCEBRANCHNAME"
branch_name=${branch_reference#refs/heads/}
echo "Branch Name: $branch_name"
# git fetch
commits_ahead=$(git rev-list --count origin/main ^origin/"$branch_name")
echo "total commits: $commits_ahead"
if [ "$commits_ahead" -eq 0 ]; then
    echo "Feature branch is up to date with the main branch."
else
    echo "Please update your feature branch with the main branch."
    exit 1
fi
