# Nginx

## Installation

#### Cent OS

```sh
sudo yum install epel-release

sudo yum install nginx
```

## Configuration

#### Debian, Ubuntu, etc.

```sh
sudo vi /etc/nginx/site-available/$SITE

sudo ln -s /etc/nginx/site-available/$SITE /etc/nginx/site-enabled/

sudo systtemctl restart nginx
```

#### Fedora, Oracle Linux, Red Hat Enterprise Linux, etc.

```sh
sudo vi /etc/nginx/conf.d/$SERVERS

sudo vi /etc/nginx/default.d/$SITE

sudo systemctl restart nginx
```

#### fix failed (13: Permission denied) issue

```sh
setsebool -P httpd_can_network_connect 1

setenforce 0

getenforce
```

## Configuration

#### Remote IP

```nginx
location /ip {
    default_type application/json;
    return 200 "{\"ip\":\"$remote_addr\"}";
}
```

#### Compression

> https://github.com/h5bp/server-configs-nginx/blob/master/h5bp/web_performance/compression.conf

#### Force https

```nginx
server {
    listen       80 default_server;
    listen       [::]:80 default_server;
    server_name  _;
    return 301 https://$server_name$request_uri;
}
```

#### Redirect page

```nginx
server {
    location = / {
        return 302 $scheme://$http_host/online/;
    }
}
```

#### Add slash at the end of url

```nginx
server {
    location = /online {
        return 302 $scheme://$http_host/online/;
    }
}
```

#### Switch maintenance status

```nginx
server {
     set $maintenance on;

     if ($remote_addr ~ (127.0.0.1)) {
        #set $maintenance off;
    }

    location / {
        try_files $uri $uri/ /index.html;

        if ($maintenance = on) {
            rewrite ^(.*)$ /html/maintenance.html redirect;
        }
    }

    location /html/ {
        try_files $uri $uri/ =404;
    }
}
```

#### Proxy

```nginx
server {
    location /api/ {
        proxy_set_header HOST $host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

        proxy_pass http://127.0.0.1:8088;
    }
}
```

#### Web Socket

```nginx
location /grafana {
    proxy_pass http://localhost:3000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "Upgrade";
    proxy_set_header X-real-ip $remote_addr;
    proxy_set_header X-Forwarded-For $remote_addr;
}
```
