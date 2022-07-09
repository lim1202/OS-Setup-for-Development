# Node.js


## ~~[NVM](https://github.com/creationix/nvm)~~

```sh
NVM_VERSION = "v0.39.1" # replace it with latest version

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh | bash
``` 

#### Upgrade Node.js version

```sh
nvm install $NEW_VERSION --reinstall-packages-from=$OLD_VERSION

nvm uninstall $OLD_VERSION
``` 

## [Fast Node Manager (fnm)](https://github.com/Schniz/fnm)

```sh
brew install fnm
```

Add the following to your .zshrc profile:
```sh
eval "$(fnm env --use-on-cd)"
```

## NPM Mirror

```sh
npm config set registry https://registry.npmmirror.com/

npm install -g cnpm --registry=https://registry.npmmirror.com/
```

## VUE cli

```sh
npm install -g @vue/cli
# OR
yarn global add @vue/cli
```

## TypeScript

```sh
npm install -g typescript
```
