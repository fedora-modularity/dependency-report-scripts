#!/usr/bin/sh

source ./config.sh

cat $topdir/modules/*/*/depchase-runtime-failures.txt | sort -u
