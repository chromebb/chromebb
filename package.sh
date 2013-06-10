#!/bin/bash

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

HERE=$(dirname $(realpath $0))

DIST=$HERE/dist
BUILD=$HERE/build

mkdir $DIST $BUILD


# Chrome (using crxmake)

CHROME_BUILD=$BUILD/chrome-build
PEM=$BUILD/key.pem

mkdir $CHROME_BUILD
cp -a chrome/* $CHROME_BUILD/
cp -a src/*.js $CHROME_BUILD/
openssl genrsa | openssl pkcs8 -topk8 -nocrypt -v2 aes-128-ecb > $PEM
(cd $BUILD && $HERE/util/crxmake.sh $CHROME_BUILD $PEM $DIST/bb-salary-calc.crx)


# Firefox (using cfx)

FF_BUILD=$BUILD/ff-build

mkdir $FF_BUILD
cp -R firefox/* $FF_BUILD
cp -R src/* $FF_BUILD/data
(cd $FF_BUILD && cfx xpi && mv *.xpi $DIST)


# Cleanup

rm -Rf $BUILD