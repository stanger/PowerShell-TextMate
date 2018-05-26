#!/bin/bash

OUTPUT=./dist
BUNDLE_PATH="$OUTPUT/PowerShell.tmbundle"

if [ -e $BUNDLE_PATH ] ; then
	rm -r $BUNDLE_PATH
fi

pushd EditorSyntax

git pull
#TODO should a build be run here?

popd

mkdir -p $BUNDLE_PATH/Preferences
mkdir -p $BUNDLE_PATH/Syntaxes

cp EditorSyntax/*.tmLanguage $BUNDLE_PATH/Syntaxes
cp src/* $BUNDLE_PATH

pushd $OUTPUT

zip -r PowerShell.tmbundle.zip PowerShell.tmbundle

popd