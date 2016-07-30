#!/bin/bash
# restores a backup of the dst cluster from the given backup file
# (on the docker-machine)
docker run --rm \
  -v $(dirname $1):/backup \
  -v dst_storage:/dst_storage \
  ubuntu:14.04 \
  bash -c "cd /dst_storage && tar -xzvf /backup/$(basename $1) --strip 1"
