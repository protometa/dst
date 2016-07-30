#!/bin/bash
# update and run Don't Starve Togehter
/bin/dst-update.sh &&
/root/dst/bin/dontstarve_dedicated_server_nullrenderer \
  persistent_storage_root \
  /root/.klei "$@"