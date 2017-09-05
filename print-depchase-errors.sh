#!/usr/bin/sh

source ./config.sh

cat $topdir/modules/*/*/depchase-runtime-failures.txt | sort -u
cat $topdir/modules/*/*/depchase-* | grep AssertionError:
