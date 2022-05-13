# Windows

## Windows 10

#### Upgrade Windows 10 from Home Chinese Version to Home Global Version

> YTMG3-N6DKC-DKB77-7M9GH-8HVX7

## Chocolatey

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

```powershell
choco feature enable -n allowGlobalConfirmation
```

#### Install Packages

```
choco install 7zip
```

#### Upgrade Packages

```
choco upgrade all
```

## Windows Setup

#### Remap Capslock to Control

```powershell
# use PowerShell (run as Admin)
$hexified = "00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00".Split(',') | % { "0x$_"};

$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout';

New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified);
```

## WSL2

```sh
export WIN_IP=$(ip route | grep default | awk '{print $3}')
export WSL_IP=$(hostname -I | awk '{print $1}')
export ALL_PROXY="http://${WIN_IP}:7890"
export ALL_PROXY="http://${WIN_IP}:7890"

git config --global http.https://github.com.proxy $HTTP_PROXY

alias adb="/mnt/c/Apps/platform-tools/adb.exe"
```

## Windows Terminal

#### SSH in Windows Terminal

1. Install built-in SSH client in Windows 10

2. Generating GUIDs For Your Profiles
 - Powershell: ``[guid]::NewGuid()``
 - Linux: ``uuidgen``

3. Customize settings

```json
"profiles":{
    "list":
    [{
        "guid":"{guid}",
        "name": "SSH in Windows Terminal",
        "icon": "ms-appx:///ProfileIcons/{guid}.png",
        "commandline": "ssh root@hostname"
    }]
}
```


