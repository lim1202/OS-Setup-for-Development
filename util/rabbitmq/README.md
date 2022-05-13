# RabbitMQ

## Run RabbitMQ via Docker

```sh
docker run -it --rm --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3-management
```

## RabbitMQ plugins

```sh
rabbitmq-plugins enable rabbitmq_management

rabbitmq-plugins enable rabbitmq_prometheus

# confirm that RabbitMQ now exposes metrics in Prometheus format
curl -s localhost:15692/metrics | head -n 3
```

## Nginx reverse proxy

1. Nginx proxy pass

```nginx
location /rabbitmq/ {
    proxy_pass http://127.0.0.1:15672;
}
```

2. RabbitMQ configuration

[example rabbitmq.conf file](https://github.com/rabbitmq/rabbitmq-server/blob/v3.7.x/docs/rabbitmq.conf.example)

[example advanced.conf file](https://github.com/rabbitmq/rabbitmq-server/blob/master/docs/advanced.config.example)

```ini
## URL path prefix for HTTP API and management UI
management.path_prefix = /rabbitmq
```

## Heartbeat

```sh
# Set
rabbitmqctl eval 'application:set_env(rabbit, heartbeat, 1800).'

# Get
rabbitmqctl eval 'application:get_env(rabbit, heartbeat).'
```
