# Windows Setup for Development

## PACKAGE MANAGER

### [Chocolatey](https://chocolatey.org/install)

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco feature enable -n allowGlobalConfirmation
```

## GUI APPLICATIONS

### Install via Chocolatey

```
choco install 7zip calibre dbeaver drawio mitmproxy pandoc starship vscode xmind-2020
```

## TERMINAL APPLICATIONS

### [WSL2](https://docs.microsoft.com/en-us/windows/wsl/install) Installation

```powershell
wsl --install
```

### Python

#### Miniconda Installation

```sh
wget -c https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

bash Miniconda3-latest-Linux-x86_64.sh

# conda config --set auto_activate_base false
conda config --set changeps1 false
```

#### Pip configuration

```sh
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
pip config set install.trusted-host mirrors.aliyun.com
```

### Node.js

#### [NVM](https://github.com/creationix/nvm) Installation

```sh
NVM_VERSION = "v0.39.1" # replace it with latest version
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh | bash
```

#### Install latest Node.js LTS version

```sh
nvm install --lts
```

#### NPM mirror configuration

```sh
npm config set registry https://registry.npmmirror.com/
```

#### Install global npm packages

```sh
npm install -g @vue/cli typescript
```

### Java

#### Install Java via SdkMan

```sh
curl -s "https://get.sdkman.io" | bash

sdk list java
sdk install java
```

## OH MY ZSH

```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Shell Promt: [Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)

1. Install Starship

```sh
curl -sS https://starship.rs/install.sh | sh
```

2. Add the following to the end of ~/.zshrc:

```sh
# ~/.zshrc
eval "$(starship init zsh)"
```

### Oh-My-ZSH Plugins

- zsh-autosuggestions

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- zsh-syntax-highlighting

```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

> Note that zsh-syntax-highlighting must be the last plugin sourced.


## GIT

### Git Configuration

```ini
# ~/.gitconfig
[includeIf "gitdir:~/code/github/"]
    path = .gitconfig-github.inc

[includeIf "gitdir:~/code/work/"]
    path = .gitconfig-work.inc
```

```ini
# ~/.gitconfig-github.inc && ~/.gitconfig-work.inc
[user]
        name = Your Name
        email = Your Email
```

### Add git changelog command to ~/.zshrc
```sh
# ~/.zshrc
alias gitchangelog="git log \$(git describe --tags --abbrev=0)..HEAD --pretty=format:\"- %h %s\" --no-merges"
```
