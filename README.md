# postgres

Run a Postgres database as a github action - see file **output.txt** for the results of running the query in **load.txt**. Clone this repo and you can run your own queries too in C, Javascript, Perl, Python.  Much easier than using docker.

```
Run sudo systemctl start postgresql.service
CREATE DATABASE
You are now connected to database "test" as user "postgres".
CREATE TABLE
INSERT 0 1
INSERT 0 1
 name | address 
------+---------
 aaa  | AAAA
 bbb  | BBBB
(2 rows)
```

**select.c** shows how to connect to Postgres directly from Ansi C.

**Select.java** shows how to connect to Postgres directly from Java.

**select.js** shows how to connect to Postgres directly from Javascript.

**select.pl** shows how to connect to Postgres directly from Perl.

**select.py** shows how to connect to Postgres directly from Python.

**upload.pl** shows how to return results to this repository from the action being run.
