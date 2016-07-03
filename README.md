

# Don't Starve Together Dedicated Server

*Requires 64-bit*

Starts Cave cluster with Docker Compose. [Based on instructions from the forums.](http://forums.kleientertainment.com/topic/64441-dedicated-server-quick-setup-guide-linux/)

## Quick Start

### Add server token

* Can be generated from `Account` page in main menu
* Paste it in `cluster_token.txt`

### Edit Configs

* Modify `cluster.ini`
	- `cluster_name` will show up in server listings
    - `cluster_description` 
    - `cluster_password` if you want your server to be password protected
    - `cluster_key` make it secret

### Start server

* [With a `docker-machine` setup][0] just run `docker-compose up -d`.

[0]:https://docs.docker.com/machine/get-started-cloud/
