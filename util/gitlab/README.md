# GitLab

## Installation

```sh
docker run -d --name gitlab --restart always \
    --hostname gitlab.example.com \
    -p 8929:8929 -p 2289:22 \
    -v /srv/gitlab/config:/etc/gitlab \
    -v /srv/gitlab/logs:/var/log/gitlab \
    -v /srv/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest
```

```sh
docker run -d --name gitlab-runner --restart always \
    -v /srv/gitlab-runner:/etc/gitlab-runner \
    -v /var/run/docker.sock:/var/run/docker.sock \
    gitlab/gitlab-runner:latest
```

#### Registering Runners

```sh
docker run --rm -it -v /srv/gitlab-runner:/etc/gitlab-runner gitlab/gitlab-runner register
```

#### GitLab using nginx reverse proxy

1. Edit the gitlab configuration file.
```sh
sudo docker exec -it gitlab editor /etc/gitlab/gitlab.rb
```

```ini
external_url http://example.com/gitlab
gitlab_rails['gitlab_shell_ssh_port'] = 2289
nginx['listen_port'] = 8929
```

2. Restart Gitlab.

```sh
sudo docker restart gitlab
```

3. Modify the nginx configuration file.

```nginx
location /gitlab {
    client_max_body_size 250m;
    proxy_set_header HOST $host:$server_port;
    proxy_pass http://localhost:8929;
}
```

## GitLab backup and restore

```sh
docker exec -t gitlab gitlab-backup create SKIP=builds,artifacts
docker exec -it gitlab gitlab-backup restore
```

## Upgrading major versions

> Recommended upgrade path: 11.5.0 -> 11.11.8 -> 12.0.12 -> 12.10.6 -> 13.0.0 -> 13.2.0 -> latest 

## GitLab CI

#### SSH with docker

```yaml
  before_script:
    - 'which ssh-agent || ( apt update -y && apt install openssh-client -y )'
    - eval $(ssh-agent -s)
    - echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add -
    - mkdir -p ~/.ssh
    - chmod 700 ~/.ssh
    - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config'
```

#### Docker in Docker

```ini
[[runners]]
  executor = "docker"
  [runners.docker]
    image = "docker:dind"
    privileged = true
    volumes = ["/var/run/docker.sock:/var/run/docker.sock","/cache"]
```