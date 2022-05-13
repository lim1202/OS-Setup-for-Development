# Postgres

## Install PostgreSQL on CentOS 7 using the CentOS repositories

```shell
sudo yum install postgresql-server postgresql-contrib
sudo postgresql-setup --initdb
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

## PostgreSQL Basic Setup

#### change the user’s password

```shell
sudo passwd postgres
```

#### switch to the PostgreSQL prompt and change the password for the PostgreSQL postgres user 

```shell
su - postgres
psql -d template1 -c "ALTER USER postgres WITH PASSWORD 'NewPassword';"
```

## Enable remote access to PostgreSQL database server

#### Enable client authentication

```shell
su - postgres

vi /var/lib/pgsql/data/pg_hba.conf
```

Append the following configuration lines to give access to 10.10.29.0/24 network:

> host all all 10.10.29.0/24 trust

#### Enable networking for PostgreSQL

```shell
vi /var/lib/pgsql/data/postgresql.conf
```

> listen_addresses='*'

#### Restart PostgreSQL

```shell
sudo systemctl restart postgresql
```

## Backup

```sh
# Backup daily
/usr/bin/pg_dump -U postgres -d dbname | gzip > /var/lib/pgsql/backups/dbdump_$(date '+%a').gz

# Backup hourly
/usr/bin/pg_dump -U postgres -d dbname | gzip > /var/lib/pgsql/backups/dbdump_$(date '+%H').gz
```

## Enabling PostGIS

```shell
sudo yum install postgis
```

#### Run the following SQL

```sql
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
```

## Useful SQL commands

#### Grant privileges

```sql
GRANT CONNECT ON DATABASE dbname to username;
GRANT USAGE ON SCHEMA public TO username;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public to username;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public to username;
```

#### Change owner

```sql
SELECT 'ALTER TABLE '|| schemaname || '."' || tablename ||'" OWNER TO username;'
FROM pg_tables WHERE  schemaname = 'public'
ORDER BY schemaname, tablename;

SELECT 'ALTER SEQUENCE '|| sequence_schema || '."' || sequence_name ||'" OWNER TO username;'
FROM information_schema.sequences WHERE sequence_schema = 'public'
ORDER BY sequence_schema, sequence_name;

SELECT 'ALTER VIEW '|| table_schema || '."' || table_name ||'" OWNER TO username;'
FROM information_schema.views WHERE table_schema = 'public'
ORDER BY table_schema, table_name;

SELECT 'ALTER FUNCTION '|| routines.routine_schema || '."' || routines.routine_name ||'" OWNER TO username;'
FROM information_schema.routines
LEFT JOIN information_schema.parameters ON routines.specific_name=parameters.specific_name
WHERE routines.specific_schema = 'public'
ORDER BY routines.routine_schema, routines.routine_name, parameters.ordinal_position;
```

#### Close idle connnection

```sql
WITH inactive_connections AS (
    SELECT
        pid,
        rank() over (partition by client_addr order by backend_start ASC) as rank
    FROM 
        pg_stat_activity
    WHERE
        -- Exclude the thread owned connection (ie no auto-kill)
        pid <> pg_backend_pid( )
    AND
        -- Exclude known applications connections
        application_name !~ '(?:psql)|(?:pgAdmin.+)'
    AND
        -- Include connections to the same database the thread is connected to
        datname = current_database() 
    AND
        -- Include connections using the same thread username connection
        usename = current_user 
    AND
        -- Include inactive connections only
        state in ('idle', 'idle in transaction', 'idle in transaction (aborted)', 'disabled') 
    AND
        -- Include old connections (found with the state_change field)
        current_timestamp - state_change > interval '15 minutes' 
)
SELECT
    pg_terminate_backend(pid)
FROM
    inactive_connections 
WHERE
    rank > 1 -- Leave one connection for each application connected to the database
```

#### List tables and columns

```sql
SELECT c.table_name, c.column_name,pgd.description
FROM pg_catalog.pg_statio_all_tables AS st
INNER JOIN pg_catalog.pg_description pgd ON (pgd.objoid = st.relid)
INNER JOIN information_schema.columns c ON (pgd.objsubid = c.ordinal_position
AND c.table_schema = st.schemaname AND c.table_name = st.relname)
WHERE c.table_schema = 'public'
ORDER BY c.table_name, c.ordinal_position ;
```

#### Caclulate the size of the database

```sql
SELECT 
    t1.datname AS db_name,
    pg_size_pretty(pg_database_size(t1.datname)) AS db_size
FROM pg_database t1
ORDER BY pg_database_size(t1.datname) DESC;
```
