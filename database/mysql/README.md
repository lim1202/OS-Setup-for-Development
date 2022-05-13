## MariaDB

> MariaDB Server is one of the world’s most popular open source relational databases and is available in the standard repositories of all major Linux distributions. 

Installation: https://mariadb.org/download/

#### Improve the security of your MariaDB installation

```shell
mysql_secure_installation
```

#### Configuring MariaDB for Remote Client Access

- Editing the Defaults File

> /etc/my.cnf

```ini
[mysqld]
skip-networking=0
skip-bind-address
```

- Granting User Connections From Remote Hosts

```sql
GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.100.%' 
  IDENTIFIED BY 'my-new-password' WITH GRANT OPTION;
  
SELECT User, Host FROM mysql.user WHERE Host <> 'localhost';
```

#### Moving Mysql's Datadir to a Cloud Drive - bind mounts

```shell
sudo mv /var/lib/mysql/* /data/mysql/
sudo mount -o bind /data/mysql /var/lib/mysql
echo '/data/mysql /var/lib/mysql none bind' >> /etc/fstab 
```
