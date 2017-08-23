#!/bin/sh

source ./config.sh

repo=$(mktemp -d)
git clone https://github.com/fedora-modularity/baseruntime-package-lists.git $repo
rm -rf "$topdir/hp" "$topdir/bootstrap"
mkdir -p "$topdir/"
cp -r $repo/data/Fedora/devel/hp "$topdir/"
cp -r $repo/data/Fedora/devel/bootstrap "$topdir/"
rm -rf "$repo"

