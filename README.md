

# Don't Starve Together Dedicated Server

*Requires 64-bit*

Starts Cave cluster with Docker Compose. [Based on instructions from the forums.][0]

## Quick Start

### Add server token

A token can be generated from `Account` page in main menu. Paste it in `cluster_token.txt`.

### Edit Configs

Modify `cluster.ini`:
* `cluster_name` will show up in server listings
* `cluster_description` will show up in server info
* `cluster_password` if you want your server to be password protected
* `cluster_key` make it secret

[*More info on these config files in the forums*][2]

### Start server

[With a `docker-machine` setup][1] just run `docker-compose up -d`.


## Update server

If the server stops showing up in the listings, it may need an update. The servers will update themselves on start so just restart them:

    docker-compose restart


## Backup and Restore

Included are some scripts that can help you backup and restore clusters.

To create a backup for example:

    ./backup.sh ~/dst-backups/my-backup.tar.gz

Then to restore that backup:

    ./restore.sh ~/dst-backups/my-backup.tar.gz

The server will load the restored state next time it starts. These scripts are just `docker` commands that can be modified to work on other platforms.

[0]: http://forums.kleientertainment.com/topic/64441-dedicated-server-quick-setup-guide-linux/
[1]: https://docs.docker.com/machine/get-started-cloud/
[2]: http://forums.kleientertainment.com/topic/64552-dedicated-server-settings-guide/

