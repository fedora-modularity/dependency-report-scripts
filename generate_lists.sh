#!/bin/sh

source ./config.sh

echo "Generating top-level package lists:"
for repo in $(cat module-repolist.txt); do
    echo "  Processing $repo repository"
    perl mklists.pl -t "$topdir" -r "repos/$repo"
done

for module in $(ls "$topdir/modules"); do
    for arch in $(cat arches.txt); do
        sort -o "$topdir/modules/$module/$arch/toplevel-binary-packages.txt" "$topdir/modules/$module/$arch/toplevel-binary-packages.txt"
    done
done
