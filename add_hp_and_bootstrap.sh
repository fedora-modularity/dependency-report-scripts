#!/bin/sh

source ./config.sh

cp -r "$topdir/hp" "$topdir/modules/platform"
echo "" > "$topdir/modules/platform/modular-deps.txt"

for arch in $(cat arches.txt); do
    modulearchroot="$topdir/modules/platform/$arch"

    cp $modulearchroot/runtime-binary-packages-full.txt   $modulearchroot/complete-runtime-binary-packages-full.txt 
    cp $modulearchroot/runtime-binary-packages-short.txt  $modulearchroot/complete-runtime-binary-packages-short.txt
    cp $modulearchroot/runtime-source-packages-full.txt   $modulearchroot/complete-runtime-source-packages-full.txt 
    cp $modulearchroot/runtime-source-packages-short.txt  $modulearchroot/complete-runtime-source-packages-short.txt
done


cp -r "$topdir/bootstrap" "$topdir/modules/bootstrap"
echo "" > "$topdir/modules/bootstrap/modular-deps.txt"

for arch in $(cat arches.txt); do
    modulearchroot="$topdir/modules/bootstrap/$arch"

    cp $modulearchroot/selfhosting-binary-packages-full.txt   $modulearchroot/runtime-binary-packages-full.txt 
    cp $modulearchroot/selfhosting-binary-packages-short.txt  $modulearchroot/runtime-binary-packages-short.txt
    cp $modulearchroot/selfhosting-source-packages-full.txt   $modulearchroot/runtime-source-packages-full.txt 
    cp $modulearchroot/selfhosting-source-packages-short.txt  $modulearchroot/runtime-source-packages-short.txt

    cp $modulearchroot/runtime-binary-packages-full.txt   $modulearchroot/complete-runtime-binary-packages-full.txt 
    cp $modulearchroot/runtime-binary-packages-short.txt  $modulearchroot/complete-runtime-binary-packages-short.txt
    cp $modulearchroot/runtime-source-packages-full.txt   $modulearchroot/complete-runtime-source-packages-full.txt 
    cp $modulearchroot/runtime-source-packages-short.txt  $modulearchroot/complete-runtime-source-packages-short.txt
done

