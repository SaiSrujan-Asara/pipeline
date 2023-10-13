[ "`git log --pretty=%H ...refs/heads/main^ | head -n 1`" = "`git ls-remote origin -h refs/heads/main |cut -f1`" ] && echo "up to date" || echo "not up to date"
