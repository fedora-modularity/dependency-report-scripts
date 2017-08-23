#!/bin/sh

source ./config.sh

mkdir -p "$topdir/repos"
for repo in $(cat module-repolist.txt); do
  if [ ! -d "$topdir/repos/$repo" ]; then
    git clone https://github.com/modularity-modules/$repo.git \
        "$topdir/repos/$repo"
  else
    (cd "$topdir/repos/$repo" && git pull)
  fi
done
