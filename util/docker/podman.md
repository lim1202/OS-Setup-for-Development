# Podman

> What is Podman? Podman is a daemonless container engine for developing, managing, and running OCI Containers on your Linux System. Containers can either be run as root or in rootless mode. Simply put: alias docker=podman. More details [here](https://podman.io/whatis.html).

## Configuration registry mirror

```shell
 cat ~/.config/containers/registries.conf
```

```ini
unqualified-search-registries = ["docker.io", "quay.io"]

[[registry]]
prefix = "docker.io"
location = "ybjcc2gb.mirror.aliyuncs.com"

[[registry]]
prefix = "quay.io"
location = "quay-mirror.qiniu.com"
```

