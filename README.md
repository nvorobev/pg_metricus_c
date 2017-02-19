# PG Metricus (pg_metricus)

### INFO

Sending metrics in the socket (Brubeck, Graphite, etc.) from pl/pgsql code.

### INSTALLATION

In the directory where you downloaded pg_metricus, run

```
make install
```

You need set control variables in postgresql.conf. 
These can be added/changed at anytime with a simple reload. See the documentation for more details.:

```
pg_metricus.host = '10.9.5.164'
pg_metricus.port = 8124
```

Log into PostgreSQL and run the following commands. 
Schema is optional (but recommended) and can be whatever you wish, but it cannot be changed after installation.

```plpgsql
create schema metricus;
create extension pg_metricus schema metricus;
```

### EXAMPLE

Format for Brubeck:
```plpgsql
select metricus.send_metric(format('%s.%s:%s|%s', 
    metric_path, 
    metric_name, 
    metric_value, 
    metric_type
));
```

Format for Graphite:
```plpgsql
select metricus.send_metric(format(E'%s.%s %s %s \n', 
    metric_path, 
    metric_name, 
    metric_value, 
    extract(epoch from now())::integer
));
```
