#!/bin/bash

# Move docker's storage location to scratch disk so we don't run out of space.
echo 'DOCKER_OPTS="${DOCKER_OPTS} --graph=/tmpfs/docker"' | sudo tee --append /etc/default/docker
# Use container registry mirror for pulling docker images (should make downloads faster)
# See https://cloud.google.com/container-registry/docs/using-dockerhub-mirroring
echo 'DOCKER_OPTS="${DOCKER_OPTS} --registry-mirror=https://mirror.gcr.io"' | sudo tee --append /etc/default/docker
sudo service docker restart

# Download Docker images from DockerHub
export DOCKERHUB_ORGANIZATION=protobuftesting
export RAKE_COMPILER_DOCK_IMAGE=${DOCKERHUB_ORGANIZATION}/rake-compiler-dock_9dd125bbd67ff94383fcf97e02167e0c0e115c3f

# All artifacts come here
mkdir artifacts
export ARTIFACT_DIR=$(pwd)/artifacts

