

# Don't Starve Together Dedicated Server

*Requires 64-bit*

Starts Cave cluster with Docker Compose. [Based on instructions from the forums.](http://forums.kleientertainment.com/topic/64441-dedicated-server-quick-setup-guide-linux/)

<<<<<<< Updated upstream
## Quick Start
=======
Paste it in `cluster_tocken.txt`
>>>>>>> Stashed changes

### Add server token

* Can be generated from `Account` page in main menu
* Paste it in `cluster_token.txt`

### Edit Configs

<<<<<<< Updated upstream
* Modify `cluster.ini`
	- `cluster_name` will show up in server listings
    - `cluster_description` 
    - `cluster_password` if you want your server to be password protected
    - `cluster_key` make it secret

### Start server
=======
Modify `cluster.ini`
* `cluster_name` will show up in server listings
* `cluster_description`
* `cluster_password`
* `cluster_key`
>>>>>>> Stashed changes

* [With a `docker-machine` setup][0] just run `docker-compose up -d`.

<<<<<<< Updated upstream
[0]:https://docs.docker.com/machine/get-started-cloud/
=======
    `docker-compose up -d`


## Update server

If the server stops showing up in the listings, it may need an update. With the services running execute the install/update command for each server and then restart.

    docker-compose exec master /root/steamcmd/steamcmd.sh +force_install_dir /root/dst/ +login anonymous +app_update 343050 validate +quit
    docker-compose exec caves /root/steamcmd/steamcmd.sh +force_install_dir /root/dst/ +login anonymous +app_update 343050 validate +quit
    docker-compose restart
>>>>>>> Stashed changes
