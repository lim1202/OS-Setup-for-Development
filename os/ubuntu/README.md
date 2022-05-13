# Ubuntu

## Add user

```sh
sudo useradd -m $USER

sudo passwd $USER

sudo visudo
```

```ini
# Add user to sudoers
%sudo ALL=(ALL) NOPASSWD: ALL
```

## Set time zone

```sh
sudo dpkg-reconfigure tzdata
```

## Upgrade Release

```sh
sudo do-release-upgrade
```

## Security

```sh
sudo apt-get -y install libpam-pwquality
```

#### Modify security policy

```ini
# /etc/login.defs
PASS_MAX_DAYS 90
PASS_MIN_DAYS 0
PASS_MIN_LEN 8
PASS_WARN_AGE 7   

# /etc/pam.d/common-password - password-related modules common to all services
password    requisite    pam_pwquality.so retry=3 minlen=8 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1

# /etc/pam.d/common-auth - authentication settings common to all services
auth    required    pam_faillock.so preauth silent audit deny=5 unlock_time=1800

# /etc/pam.d/common-account - authorization settings common to all services
account     required      pam_faillock.so
```
