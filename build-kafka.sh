#!/bin/sh

#
# Parameter 1: image name
# Parameter 2: path to component (if different)
#
build_docker_image () {
    IMAGE_NAME=$1;
    IMAGE_PATH=$2;
    if [ -z "$IMAGE_PATH" ]; then
        IMAGE_PATH=${IMAGE_NAME};
    fi
    echo ""
    echo "****************************************************************"
    echo "** Building  ico/${IMAGE_NAME}"
    echo "****************************************************************"
    docker build -t ico/${IMAGE_NAME} ${IMAGE_PATH}
    if [ $? -ne 0 ]; then
        exit $?;
    fi
}


if [[ -z "$1" ]]; then
    echo ""
    echo "A version must be specified."
    echo ""
    echo "Usage:  build-debezium <version>";
    echo ""
    exit 1;
fi

build_docker_image zookeeper
build_docker_image kafka
build_docker_image connect-base
build_docker_image connect

echo ""
echo "**********************************"
echo "Successfully created Docker images"
echo "**********************************"
echo ""
