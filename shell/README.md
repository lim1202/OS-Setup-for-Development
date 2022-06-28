# Shell

## ZSH

#### Shell Promt

- [Powerlevel10k](https://github.com/romkatv/powerlevel10k#installation)

- [Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)

#### Oh My Zsh Installation

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

