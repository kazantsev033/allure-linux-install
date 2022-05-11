#!/bin/bash

ALLURE_REPO=https://api.github.com/repos/allure-framework/allure2
allureVersion=`curl -s $ALLURE_REPO/releases/latest | grep tag_name | cut -d '"' -f 4`

help()
{
    echo "Options:"
    echo "  -v"
    echo "    Specify Allure version"
    echo "    Default: latest"
    echo "  -h"
    echo "    Print help"
}

while getopts ":hv" option; do
   case $option in
        h)
            help
            exit;;
        v)
            if [ -z "$2" ]
            then
                echo "Allure version is not specified"
                exit
            else
                allureVersion=$2
            fi            
   esac
done

url=`curl -s $ALLURE_REPO/releases/tags/$allureVersion | grep browser_download_url | grep tgz | cut -d '"' -f 4`

if [ -z "$url" ]
then
    echo "Unbale to find Allure with version $allureVersion"
    exit
fi

if curl --output /dev/null --silent --head --fail "$url"; then
    wget -c $url -O - | tar -xvz --overwrite -C /opt
    ln -sf /opt/allure-$allureVersion/bin/allure /usr/bin/allure
    echo "Allure `allure --version` has been installed"
else
    echo "Unable to get: $url"
fi