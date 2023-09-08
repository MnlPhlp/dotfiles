#!/bin/bash
prefix=${PASSWORD_STORE_DIR:-$HOME/.local/share/gopass/stores/root}
outfile=${1:-exported_passes}

for file in "$prefix"/**/*.gpg; do
    echo $file
    name="${file/$prefix/}"
    printf "%s\n" "Name: ${name%.*}" >> $outfile
    #pass "${file%.*}" >> $outfile
    gpg2 --decrypt "${file}" >> "$outfile"
    printf "\n\n" >> $outfile
done
