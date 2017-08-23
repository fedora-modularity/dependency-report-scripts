#!/bin/sh

source ./config.sh

arches=$(cat arches.txt)
modules=$(ls "$topdir/modules" | sed \
                        -e "s/^bootstrap$//g" \
                        -e "s/^platform$//g")

echo "Drawing graphs:"
for module in $modules; do
    echo "  Processing $module module..."
    for arch in $arches; do
        grep -F -f \
            "$topdir/modules/$module/$arch/runtime-binary-packages-full.txt" \
            "$topdir/modules/$module/$arch/depchase-runtime-relations.txt" \
            > "$topdir/modules/$module/$arch/relations-runtime.txt"

        {
            pkg=NONE
            while read line; do
                if [[ $line == ├─* ]] || [[ $line == └─* ]] ; then
                    dep=$(echo $line | sed -e "s/.* //" )
                    echo "  \"${pkg%-*-*}\" -> \"${dep%-*-*}\";"
                else
                    pkg=$line
                fi
            done < "$topdir/modules/$module/$arch/relations-runtime.txt"
        } | sort -u > "$topdir/modules/$module/$arch/graph.txt"
        echo "strict digraph G {" > "$topdir/modules/$module/$arch/graph.dot"
        echo "node [fontname=monospace];" >> "$topdir/modules/$module/$arch/graph.dot"
        cat "$topdir/modules/$module/$arch/graph.txt" >> "$topdir/modules/$module/$arch/graph.dot"
        echo "}" >> "$topdir/modules/$module/$arch/graph.dot"
        START=7; cat "$topdir/modules/$module/$arch/graph.dot" \
            | sfdp -Gstart=$START -Goverlap=prism \
            | gvmap -e -d $START \
            | neato -Gstart=$START -n -Ecolor="#44444455" -Tsvg \
            > "$topdir/modules/$module/$arch/graph.svg"
    done
done


