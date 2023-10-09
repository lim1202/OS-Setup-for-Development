# Python

## Pip configuration

```shell
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
pip config set install.trusted-host mirrors.aliyun.com
```

#### pip.conf

> On Unix the default configuration file is: $HOME/.config/pip/pip.conf  
> On macOS the configuration file is $HOME/Library/Application Support/pip/pip.conf  
> On Windows the configuration file is %APPDATA%\pip\pip.ini  

```ini
[global]
index-url = https://mirrors.aliyun.com/pypi/simple/

[install]
trusted-host = mirrors.aliyun.com
```

## Pip Install via Mirror

```sh
pip install -i https://mirrors.aliyun.com/pypi/simple \
    --trusted-host mirrors.aliyun.com $PACKAGE
```

## Update All Python Packages On Linux

```sh
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
```

## miniforge

```sh
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh
```

## Miniconda

```sh
wget -c https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

bash Miniconda3-latest-Linux-x86_64.sh

# conda config --set auto_activate_base false
conda config --set changeps1 false
```

## Start a simple http server

```shell
python -m SimpleHTTPServer 8000
```

## Install OpenCV

```sh
apt-get install -y libglib2.0-0 libsm6 libxext6 libxrender-dev
```

## ~~Install Jupyter Notebook~~

```sh
MY_ENV = "jupyter"

# To create an environment with a specific version of Python:
conda create -n $MY_ENV python=3.x

# Kernels for different environments
source activate $MY_ENV

python -m ipykernel install --user --name $MY_ENV --display-name "$MY_ENV_NAME"
```

## Install JupyterLab: Jupyter’s Next-Generation Notebook Interface

```sh
conda install -c conda-forge jupyterlab
#or
pip install jupyterlab

jupyter lab --no-browser # fix powershell-style error in WSL
```
