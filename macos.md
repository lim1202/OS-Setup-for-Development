# macOS Setup for Development


## PACKAGE MANAGER

### [Homebrew](https://brew.sh/)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"b
```


## GUI APPLICATIONS

### Install via Homebrew

```sh
brew install <formula|cask>
```

- calibre: The one stop solution for all your e-book needs.
- cheatsheet: Know your shortcuts.
- colima: Container runtimes on macOS (and Linux) with minimal setup.
- dbeaver-community: Free multi-platform database tool.
- docker: Docker client for Mac
- drawio: free online diagram software.
- maccy: macOS clipboard manager.
- openvpn-connect: VPN client.
- postman: API platform
- telegram: Telegram Messenger
- visual-studio-code: Code editor.
- vlc: Free and open-source, portable, cross-platform media player.


## TERMINAL APPLICATIONS

### Zap

```sh
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
```

### Shell Promt: [Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)

0. Install Nerd Fonts

```sh
brew tap homebrew/cask-fonts # Homebrew Cask Fonts

brew install font-fira-code-nerd-font
```

1. Install Starship

```sh
brew install starship
```

2. Add the following to the end of ~/.zshrc:

```sh
# ~/.zshrc
eval "$(starship init zsh)"
```

## PROGRAMMING LANGUAGES

### Python

#### Installation

```sh
brew install --cask miniforge

# conda config --set auto_activate_base false
conda config --set changeps1 false
```

#### Pip configuration

```sh
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
pip config set install.trusted-host mirrors.aliyun.com
```

### Node.js

### [Fast Node Manager (fnm)](https://github.com/Schniz/fnm)

```sh
brew install fnm
```

#### Add the following to your .zshrc profile:
```sh
eval "$(fnm env --use-on-cd)"
```

#### Install latest Node.js LTS version

```sh
fnm install --lts
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


## GIT

### Git Configuration

```ini
# ~/.gitconfig
[includeIf "gitdir:~/github/"]
    path = .gitconfig-github.inc

[includeIf "gitdir:~/work/"]
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
alias glot="git log \$(git describe --tags --abbrev=0)..HEAD --pretty=format:\"- %h %s\" --no-merges"
```
