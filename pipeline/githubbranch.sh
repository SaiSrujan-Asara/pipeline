#!/bin/bash
GITNAME="terraform"


if [ "`git log --pretty=%H ...refs/heads/main^ | head -n 1`" = "`git ls-remote origin -h refs/heads/main |cut -f1`" ] ; then
    status=0
    statustxt="up to date"
else
    status=2
    statustxt="not up to date"
fi

if [[ `git status --porcelain` ]]; then
    status=1
    statustxt="uncommited"
fi


echo "$status git_status_$GITNAME - $statustxt"