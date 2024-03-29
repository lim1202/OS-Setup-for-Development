# Shell

## CURL

### Timing Details With cURL

```sh
#!/bin/bash

curl -w @- -o /dev/null -s "$@" <<'EOF'
    time_namelookup:  %{time_namelookup}\n
       time_connect:  %{time_connect}\n
    time_appconnect:  %{time_appconnect}\n
   time_pretransfer:  %{time_pretransfer}\n
      time_redirect:  %{time_redirect}\n
 time_starttransfer:  %{time_starttransfer}\n
                    ----------\n
         time_total:  %{time_total}\n
EOF
```

```sh
❯ ./curl-time ip-api.com
    time_namelookup:  0.014111
       time_connect:  0.014727
    time_appconnect:  0.000000
   time_pretransfer:  0.014778
      time_redirect:  0.000000
 time_starttransfer:  0.482006
                    ----------
         time_total:  0.482578
```

## CLI Tools Made With Rust

#### Install Cargo

```sh
curl https://sh.rustup.rs -sSf | sh

```

- [bat](https://github.com/sharkdp/bat): A cat(1) clone with syntax highlighting and Git integration.
- [exa](https://github.com/ogham/exa): a modern replacement for ls.
- [ripgrep](https://github.com/BurntSushi/ripgrep): a line-oriented search tool that recursively searches the current directory for a regex pattern. 
- [dust](https://github.com/bootandy/dust): du + rust = dust. Like du but more intuitive.
- [bottom](https://github.com/ClementTsang/bottom): A customizable cross-platform graphical process/system monitor for the terminal.

## ZSH

### Shell Promt

- [Powerlevel10k](https://github.com/romkatv/powerlevel10k#installation)

- [Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)

### Zap

```sh
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
```

### Oh My Zsh

#### Installation

```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### Oh-My-ZSH Plugins

- zsh-autosuggestions

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- zsh-syntax-highlighting

```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

> Note that zsh-syntax-highlighting must be the last plugin sourced.


## SSH

```sh
# cat ~/.ssh/id_rsa.pub | ssh $USERNAME@$HOSTNAME "mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys"
ssh-copy-id $USERNAME@$HOSTNAME
```

#### Issue Let's Encrypt Free SSL certificate

- Install ACME [>>Link<<](https://github.com/acmesh-official/acme.sh/wiki/How-to-install)

- Issue with Aliyun DNS

```shell
export Ali_Key=<AccessKey>
export Ali_Secret=<AccessSecret>

acme.sh --issue --dns dns\_ali -d <example.com> -d <*.example.com>
```

- Install certificate

```shell
 acme.sh --installcert -d <example.com> -d <*.example.com> \
 --keypath /etc/pki/nginx/private/<example.com>.key \
 --fullchainpath /etc/pki/nginx/<example.com>.cer
```

#### SSH tunnel

```sh
ssh -NT -D $LOCAL_PORT $USER@$HOSTNAME -p $REMOTE_PORT
```

## Rsync

```sh
rsync -qaz $SRC $HOST:$DEST

# filter by file type
rsync -qaz --prune-empty-dirs --include="*/" --include="*.yml" --exclude="*" $SRC $HOST:$DEST
```

## Proxy

```
export ALL_PROXY=http://127.0.0.1:7890
```

- open Chrome with proxy in MacOS

```sh
open -a "Google Chrome" --args --proxy-server="socks://localhost:1080"
```


#### Proxy server via Tinyproxy

```sh
sudo apt install tinyproxy

tinyproxy -c /etc/tinyproxy.conf
```

