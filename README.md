# Intergo Multi-Project Local Development

Base domain: **local.intergo.co**

## First time Initialization

---

### Requirements:
* Docker Latest version
* Docker-Compose Latest version (for Mac/Windows is already integrated)
* Hardware min.: 2xCPU, 2GB RAM, 5GB Disk

Note: If you just fresh installed docker on Ubuntu system and you receive some permissions error, check [Troubleshoot](#troubleshoot-zone) area.

### Project cloning

---

Create a directory on your projects directory where this repository will be cloned. Suggested:
`/projects/intergo/`

Once cloned, following structure should be available:
```
/projects/intergo/  
                 /.git
                 /docker/
                 .gitignore
                 README.md
```

All following commands will run inside `docker/` directory:

```bash
# Create a copy of your .env and docker-compose.yml from base files
/projects/intergo/# cd docker
/projects/intergo/docker/# cp .env.base .env
/projects/intergo/docker/# cp docker-compose.base.yml docker-compose.yml
```

In case you use Valet, or you need different port for http, https, mysql and mongodb, you have to adjusts `.env` file using a text editor, eg.:

```bash
/projects/intergo/docker/# vi .env
```

### Build images

---

For initial run, you need to open a shell terminal and run following commands inside `docker/` directory:
```
/projects/intergo/docker# docker-compose up -d --build 
```

It will take 5-30min, depending on your machine and internet speed.

### Initialize mysql

---

MariaDB container is used for all projects, for this, we need to create databases and users for each project.

In same terminal, run following command:
```
/projects/intergo/docker# docker-compose exec -T mariadb mysql -proot < include/mariadb/initialize.sql
```

### Per project clone

---

Once following commands has been run, structure will look like:
```
/projects/intergo/  
                 /.git
                 /code_emailvalidation/
                 /code_verification/
                 /code_smsto/
                 /docker/
                 .gitignore
                 README.md
```
On each `code_*` directory you need to clone the specific project repository.

### Per-Project initialization
Each project have it own commands that need to be run and are available on project README file.




Project structure tree:

| Project Name      | CodePath                                   | URL                                     |
| ----------------- | ------------------------------------------ | --------------------------------------- |
| SMS.to            | ./code_smsto                               | smsto.local.intergo.co <br/> smsto-api.local.intergo.co                 |
| EmailVerifier.com | ./code_emailverifier <br>./code_validation | emailverifier.local.intergo.co          |
| ~~Fax.to~~            | ~~./code_faxto~~                               | ~~faxto.local.intergo.co~~                  |
| Docker            | ./docker (reservered)                      | docker files and initialization scripts |



## Available services

| Name          | URL                            | Port          |
| ------------- | ------------------------------ | ------------- |
| MailHog       | mailhog.local.intergo.co       | n/a           |
| Mongo Express | mongo-express.local.intergo.co | n/a           |
| Supervisor    | supervisor.local.intergo.co    | n/a           |
| PhpMyAdmin    | phpmyadmin.local.intergo.co    | root autlogin |
| Redis Browser | redis-web.local.intergo.co     | n/a           |
| MariaDB       | localhost / root / root                    | 3307 (default)         |




## Cleanup commands

To mass stop and delete all containers, you can use following commands:
```bash
# Stop all containers
$ docker stop $(docker ps -a -q)
# Remove all containers
$ docker rm $(docker ps -a -q)
```


## Troubleshot Zone
---

### Ubuntu users, fresh install of docker

In case you received permission denied error like:

```
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http:///var/run/docker.sock/v1.39/containers/json: dial unix /var/run/docker.sock: connect: permission denied
```

Reason for this is that your current user is not part of docker group and is unable to run docker commands.

To fix it, run following command:

```bash
sudo usermod --append --groups docker `whoami`
```



### Is CRON running?
All CRON's are defined here:
```
/projects/intergo/docker# cat include/php-fpm-horizon/cron_root
# Cron heathCheck
* *     * * *   echo "Last run: `date`" > /tmp/cron_check

#GeoIP
*/5 *     * * *   [ ! -f /code_smsto/storage/app/geoip2/GeoLite2-Country.mmdb ] && /opt/update_geoip_databases.sh

# Laravel
* *     * * *   php /code_smsto/artisan schedule:run
* *     * * *   php /code_emailverifier/artisan schedule:run
```

Then, a 1min CRON check is run on:
```
/projects/intergo/docker# docker-compose exec php-fpm-horizon cat /tmp/cron_check
Last run: Sun Dec 23 09:59:01 UTC 2018
```
