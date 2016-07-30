#!/bin/bash
# this installs (or updates) Don't Starve Togehter
/root/steamcmd/steamcmd.sh \
  +force_install_dir /root/dst/ \
  +login anonymous \
  +app_update 343050 \
  validate +quit