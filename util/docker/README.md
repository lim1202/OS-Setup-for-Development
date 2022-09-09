# Docker

## Install using the convenience script

```sh
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# via aliyun mirror
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
```

## Setup registry mirrors

```sh
cat << EOF > /etc/docker/daemon.json
{
  "registry-mirrors": [
    "https://ybjcc2gb.mirror.aliyuncs.com"
  ],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}
EOF

sudo systemctl daemon-reload
sudo systemctl restart docker
```

| Mirros  | Url                                     |
| -------- | -------------------------------------- |
| 阿里云    | https://ybjcc2gb.mirror.aliyuncs.com   |
| 腾讯云    | https://mirror.ccs.tencentyun.com.     |

## Manage Docker as a non-root user

```sh
sudo groupadd docker

sudo usermod -aG docker $USER

sudo chmod 666 /var/run/docker.sock
```

## Manage Docker

```sh
docker system df	# Show docker disk usage
docker system prune	# Remove unused data
```

#### Use crontab to clean docker data
```ini
# Remove unused docker data
0 3 * * * /usr/bin/docker system prune -f
```

### Change docker data directory

1. stop docker service

```sh
systemctl stop docker
```

2. add configuration in /etc/docker/daemon.json
 
>   "data-root": "/path/to/your/docker" 

3. move current data to new directory

```sh
rsync -aP /var/lib/docker/ /path/to/your/docker

mv /var/lib/docker /var/lib/docker.old
```

4. start docker service 

```sh
systemctl start docker
```

5. (optional) remove old docker data

```sh
rm -f /var/lib/docker.old
```
