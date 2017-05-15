#!/bin/sh

if [[ -z "$1" ]]; then
    echo ""
    echo "A version must be specified."
    echo ""
    echo "Usage:  build-java <version>";
    echo ""
    exit 1;
fi

echo ""
echo "****************************************************************"
echo "** Building  ico/jdk:$1"
echo "****************************************************************"
docker build -t ico/jdk:$1 jdk
