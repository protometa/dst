
FROM unbutu:14.04

MAINTAINER Luke Nimtz <luke.nimtz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# install dependencies
RUN apt-get update
RUN apt-get install libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386

# install steam
RUN mkdir ~/steamcmd
RUN cd ~/steamcmd
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -xvzf steamcmd_linux.tar.gz

# make server directories
RUN mkdir -p ~/.klei/DoNotStarveTogether/MyDediServer/Master
RUN mkdir -p ~/.klei/DoNotStarveTogether/MyDediServer/Caves

# add server configs
ADD cluster_tocken.txt ~/.klei/DoNotStarveTogether/MyDediServer/cluster_tocken.txt
ADD cluster.ini ~/.klei/DoNotStarveTogether/MyDediServer/cluster.ini
ADD master-server.ini ~/.klei/DoNotStarveTogether/MyDediServer/Master/server.ini
ADD caves-server.ini ~/.klei/DoNotStarveTogether/MyDediServer/Caves/server.ini
ADD worldgenoverride.lua ~/.klei/DoNotStarveTogether/MyDediServer/Caves/worldgenoverride.lua

# run script entrypoint
ADD entrypoint.sh ~/entrypoint.sh
ENTRYPOINT ~/entrypoint.sh