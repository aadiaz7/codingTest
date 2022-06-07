#!/bin/bash
#
#Created by aadiaz7

echo "Please enter the Major Version you're looking for"
read majorVersion
echo "Please enter the Minor Version you're looking for"
read minorVersion

if [ $majorVersion = 2 ] && ([ $minorVersion = 14 ] || [ $minorVersion = 17 ])
then 
    majorMinorVersion="v"$majorVersion"."$minorVersion
    ver=$(git ls-remote --tag https://github.com/pre-commit/pre-commit | sed 's|.*/\(.*\)$|\1|' | grep -v '\^' | grep $majorMinorVersion | tail -1)
    wget "https://github.com/pre-commit/pre-commit/archive/refs/tags/$ver.zip" -P precommit-$ver 
    echo "\n"
    echo "The precommit-$ver has been downloaded succesfully"
    echo "\n"
else 
    echo "\n"
    echo "Requested minorVersion or majorVersion not allowed, re-rerun the script"
    echo "\n"
fi