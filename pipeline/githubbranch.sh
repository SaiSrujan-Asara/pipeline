check_branch_status() {
  branch_reference="$BUILD_SOURCEBRANCHNAME"
  branch_name=${branch_reference#refs/heads/}
  echo "Branch Name: $branch_name"

  commits_ahead=$(git rev-list --count origin/main ^origin/"$branch_name")
  commits_bhead=$(git rev-list --count ^origin/main origin/"$branch_name")

  echo "Missing Main commits in feature branch : $commits_ahead"
  echo "Missing feature branch commits in Main branch : $commits_bhead"

  if [ "$commits_ahead" -eq 0 ]; then
      echo "Feature branch is up to date with the main branch."
  else
      echo "Please update your feature branch with the main branch."
      exit 1
  fi
}
echo "branch: $BUILD_SOURCEBRANCHNAME"
if [ "$BUILD_SOURCEBRANCHNAME" != "refs/heads/main" ]; then
  check_branch_status
else
  echo "Branch is 'main'. No need to check for updates."
fi
