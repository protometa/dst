
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

# download and install dst (this part can take awhile)
ADD dst-update.sh /bin/dst-update.sh
RUN chmod +x /bin/dst-update.sh
RUN /bin/dst-update.sh

ADD entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh

# add server configs
ADD storage/ /root/.klei/DoNotStarveTogether/Cluster_1/

VOLUME /root/.klei/

# expose master port (only master will listen on this)
EXPOSE 10889

# run server
# this entrypoint will accept a -shard run option for the server
# (see docker-compose file)
WORKDIR /root/dst/bin
ENTRYPOINT ["/bin/entrypoint.sh"]
