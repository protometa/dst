#!/bin/bash
# simple command to mount storage for browsing and editing of configs
# (on the docker-machine)
docker run -it --rm  \
  -v dst_storage:/dst_storage \
  -w /dst_storage/DoNotStarveTogether/Cluster_1/ \
  ubuntu:14.04 bash