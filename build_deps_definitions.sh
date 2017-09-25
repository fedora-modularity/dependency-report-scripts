#!/bin/sh

source ./config.sh

./build_deps.sh 389-ds      bootstrap
./build_deps.sh apache-commons   bootstrap
./build_deps.sh autotools   bootstrap
./build_deps.sh bind        bootstrap
./build_deps.sh cloud-init  platform python3
./build_deps.sh fonts       bootstrap
./build_deps.sh freeipa     bootstrap 389-ds bind sssd python2 python2-ecosystem python3 python3-ecosystem
./build_deps.sh GNOME       platform X11-base autotools
./build_deps.sh hardware-support  bootstrap
./build_deps.sh httpd       bootstrap
./build_deps.sh installer   bootstrap  # platform X11-base python3 python3-ecosystem networking-base GNOME perl
./build_deps.sh java        bootstrap
./build_deps.sh krb5        bootstrap
./build_deps.sh networking-base  bootstrap
./build_deps.sh perl        bootstrap
./build_deps.sh pki         bootstrap
./build_deps.sh postgresql  bootstrap
./build_deps.sh python2     bootstrap
./build_deps.sh python2-ecosystem    bootstrap
./build_deps.sh python3     bootstrap
./build_deps.sh python3-bootstrap    bootstrap
./build_deps.sh python3-ecosystem    bootstrap
./build_deps.sh python3-ecosystem-bootstrap    bootstrap
./build_deps.sh resteasy    bootstrap
./build_deps.sh ruby        bootstrap
./build_deps.sh samba       bootstrap
./build_deps.sh sssd        bootstrap
./build_deps.sh storage-devices bootstrap
./build_deps.sh systemtap   bootstrap
./build_deps.sh tomcat      bootstrap
./build_deps.sh udisks2     bootstrap
./build_deps.sh X11-base    platform autotools perl python3

# I don't need build deps for these...
excluded="platform bootstrap"
arches=$(cat arches.txt)

for module in $excluded; do
    touch "$topdir/modules/$module/modular-build-deps.txt"
    for arch in $arches; do
        touch "$topdir/modules/$module/$arch/buildtime-source-packages-short.txt"
        touch "$topdir/modules/$module/$arch/buildtime-source-packages-full.txt"
        touch "$topdir/modules/$module/$arch/buildtime-binary-packages-short.txt"
        touch "$topdir/modules/$module/$arch/buildtime-binary-packages-full.txt"
    done
done
