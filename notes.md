# To start PG from the terminal
```
$> pg_ctl -D /Users/maxgronlund/.asdf/installs/postgres/15.2/data start
```

## I found the conf file like this
```
$> find / -name "postgresql.conf" 2>/dev/null
```