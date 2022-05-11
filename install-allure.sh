#!/bin/bash
allureVersion=2.17.3
help()
{
    echo "Options:"
    echo "  -v"
    echo "    Specify allure version"
    echo "    Default: 2.17.3"
    echo "  -h"
    echo "    Print help"
}

while getopts ":hv" option; do
   case $option in
        h)
            help
            exit;;
        v)
            allureVersion=$2
            echo $allureVersion
   esac
done

url=https://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline/$allureVersion/allure-commandline-$allureVersion.tgz

if curl --output /dev/null --silent --head --fail "$url"; then
    curl -s $url | tar -xvz -C /opt
    ln -sf /opt/allure-$allureVersion/bin/allure /usr/bin/allure
    echo "Allure `allure --version` has been installed"
else
    echo "Unable to get: $url"
fi