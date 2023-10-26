check_branch_status() {
  echo "Branch Name: $BUILD_SOURCEBRANCHNAME"
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
if [ "$BUILD_SOURCEBRANCHNAME" != "main" ]; then
  check_branch_status
else
  echo "Branch is 'main'. No need to check for updates."
fi
