#!/usr/bin/env bash
for TAG in bionic xenial trusty; do
  for ANSIBLE_VERSION in 1.6 2.0 2.1 2.2 2.4 2.5 2.6; do
    echo docker build --build-arg IMAGE=ubuntu --build-arg TAG=$TAG --build-arg ANSIBLE_VERSION=$ANSIBLE_VERSION -t ubuntu:${TAG}_ansible${ANSIBLE_VERSION} .
    docker build --build-arg IMAGE=ubuntu --build-arg TAG=$TAG --build-arg ANSIBLE_VERSION=$ANSIBLE_VERSION -t ubuntu:${TAG}_ansible${ANSIBLE_VERSION} .
  done
done
