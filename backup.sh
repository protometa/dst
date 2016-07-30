#!/bin/bash
# creates a backup of the dst cluster at the given file path
# (on the docker-machine)
docker run --rm \
  -v $(dirname $1):/backup \
  -v dst_storage:/dst_storage \
  ubuntu:14.04 \
  tar -czvf /backup/$(basename $1) /dst_storage
