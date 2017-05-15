#!/bin/sh

sh ./build-java.sh
if [ $? -ne 0 ]; then
    exit $?;
fi

sh ./build-kafka.sh
