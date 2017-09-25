#!/bin/sh

source ./config.sh

module=$1

echo "Generating modulemd for $module"
{
        cat << EOF
document: modulemd
version: 1
data:
    summary: $module module
    description: This $module module has been generated.
    license:
        module:
            - MIT
    dependencies:
        buildrequires:
EOF
        for dep in $(cat "$topdir/modules/$module/modular-build-deps.txt"); do
            echo "            $dep: $buildrequires_ref"
        done
        cat << EOF
        requires:
EOF
        for dep in $(cat "$topdir/modules/$module/modular-deps.txt"); do
            echo "            $dep: $requires_ref"
        done
        cat << EOF
    references:
        community: https://docs.pagure.org/modularity/
        documentation: https://github.com/modularity-modules/$module
        tracker: https://github.com/modularity-modules/$module
    api:
        rpms:
EOF
        for pkg in $(cat "$topdir/modules/$module/all/toplevel-binary-packages.txt"); do
            echo "            - $pkg"
        done
        cat << EOF
    profiles:
        default:
            description: A generated profile based on top-lvl package list.
            rpms:
EOF
        for pkg in $(cat "$topdir/modules/$module/all/toplevel-binary-packages.txt"); do
            echo "                - $pkg"
        done
        cat << EOF
    components:
        rpms:
EOF
    for pkg in $(cat "$topdir/modules/$module/all/runtime-source-packages-full.txt"); do
        echo "            ${pkg%-*-*}:"
        echo "                rationale: Generated."
        ref=$(./get_package_hashes.py $(echo $pkg | sed -e "s/\(.*\).src$/\1/") | sed -e "s/^.*:\([^)]*\))/\1/")
        if [ -n "$ref" ]; then
            echo "                ref: $ref"
        else
            echo "                ref: $components_ref"
        fi
    done
} > "$topdir/modules/$module/$module.yaml"

