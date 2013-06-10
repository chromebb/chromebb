#!/bin/bash

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

HERE=$(dirname $(realpath $0))

PLATFORMS=$HERE/platforms
DIST=$HERE/dist
BUILD=$HERE/build

mkdir $DIST $BUILD

cp -a $PLATFORMS/. $BUILD


# Chrome (using crxmake)

CHROME_BUILD=$BUILD/chrome
PEM=$BUILD/key.pem

cp -a src/* $CHROME_BUILD/
openssl genrsa | openssl pkcs8 -topk8 -nocrypt -v2 aes-128-ecb > $PEM
(cd $BUILD && $PLATFORMS/util/crxmake.sh $CHROME_BUILD $PEM $DIST/bb-salary-calc.crx)


# Firefox (using cfx)

FF_BUILD=$BUILD/firefox

cp -a src/* $FF_BUILD/data
(cd $FF_BUILD && cfx xpi && mv *.xpi $DIST)


# Cleanup

rm -Rf $BUILD