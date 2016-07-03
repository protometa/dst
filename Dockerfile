
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

# install dont starve together
RUN ./steamcmd.sh +force_install_dir /root/dst/ +login anonymous +app_update 343050 validate +quit

# expose master port (only master will listen on this)
EXPOSE 10889

# run server
WORKDIR /root/dst/bin
ENTRYPOINT ["/root/dst/bin/dontstarve_dedicated_server_nullrenderer", "-persistent_storage_root", "/root/.klei"]