#!/bin/sh

set -e

EENSY_PATH=../eensy
VERSION=1.0-rc2

for c in $EENSY_PATH/configs/*_defconfig
do
    rm -rf output

    base=$(basename $c)
    name=$(echo $base | cut -d '_' -f 1)
    make BR2_EXTERNAL=$EENSY_PATH $base
    make
    cd output/images
    xz sdcard.img
    mv sdcard.img.xz ../../eensy-$VERSION-$name.img.xz
    cd -
done
