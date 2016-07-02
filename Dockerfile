
FROM ubuntu:14.04

MAINTAINER Luke Nimtz <luke.nimtz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# install dependencies
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386

# install steam
WORKDIR /root/steamcmd
ADD https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz ./
RUN tar -xvzf steamcmd_linux.tar.gz

# make server directories
VOLUME /root/.klei/
WORKDIR /root/
RUN mkdir -p .klei/DoNotStarveTogether/MyDediServer/Master
RUN mkdir -p .klei/DoNotStarveTogether/MyDediServer/Caves

# add server configs
ADD cluster_token.txt .klei/DoNotStarveTogether/MyDediServer/cluster_token.txt
ADD cluster.ini .klei/DoNotStarveTogether/MyDediServer/cluster.ini
ADD master-server.ini .klei/DoNotStarveTogether/MyDediServer/Master/server.ini
ADD caves-server.ini .klei/DoNotStarveTogether/MyDediServer/Caves/server.ini
ADD worldgenoverride.lua .klei/DoNotStarveTogether/MyDediServer/Caves/worldgenoverride.lua

# install dont starve
RUN ./steamcmd/steamcmd.sh +force_install_dir /root/dst/ +login anonymous +app_update 343050 validate +quit

EXPOSE 11000

# run server
WORKDIR /root/dst/bin
CMD /root/dst/bin/dontstarve_dedicated_server_nullrenderer \
  -persistent_storage_root /root/.klei \
  -conf_dir DoNotStarveTogether \
  -cluster MyDediServer \
  -shard Master
