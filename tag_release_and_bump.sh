#!/usr/bin/env bash

version=$1

if [ "$version" = "" ] ; then
    echo "usage: $0 <release>"
    exit 1
fi
git pull
sed -i "" -e "s|^__version__=.*$|__version__='${version}'|" catoclient/__init__.py
sed -i "" -e "s|^    version=.*$|    version='${version},'|" setup.py
echo $version > VERSION

git add VERSION catoclient/__init__.py setup.py
git commit -m "bump release to $release"
git push
git tag -a $version -m "Version $version"
git push --tags
