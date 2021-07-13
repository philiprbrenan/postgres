# Postgres

![Test](https://github.com/philiprbrenan/postgres/workflows/Test/badge.svg)

Access a [Postgres database](https://www.postgresql.org/) database query from the [command line](https://en.wikipedia.org/wiki/Command-line_interface) or via [Apache Web Server](https://en.wikipedia.org/wiki/Apache_HTTP_Server) as a [GitHub](https://github.com/philiprbrenan) action
- see [file](https://en.wikipedia.org/wiki/Computer_file) **output.txt** for the results of running the query in **load.txt**.
Clone this repo and you can run your own queries too in **C**, **Java**,
**Javascript**, **Perl**, **Python**.  Much easier than using [Docker](https://en.wikipedia.org/wiki/Docker_(software)) or [Amazon Web Services](http://aws.amazon.com). 
```
Run sudo systemctl start postgresql.service
CREATE DATABASE
You are now connected to database "test" as "postgres".
CREATE TABLE
INSERT 0 1
INSERT 0 1
 name | address
------+---------
 aaa  | AAAA
 bbb  | BBBB
(2 rows)
```

## From the command line

- **select.c** shows how to connect to [Postgres database](https://www.postgresql.org/) directly from [the C programming language](https://1lib.eu/book/633119/db5c78). 
- **Select.java** shows how to connect to [Postgres database](https://www.postgresql.org/) directly from [Java](https://en.wikipedia.org/wiki/Java_(programming_language)). 
- **select.js** shows how to connect to [Postgres database](https://www.postgresql.org/) directly from [NodeJs](https://en.wikipedia.org/wiki/NodeJs). 
- **select.pl** shows how to connect to [Postgres database](https://www.postgresql.org/) directly from [Perl](http://www.perl.org/). 
- **select.py** shows how to connect to [Postgres database](https://www.postgresql.org/) directly from [Python](https://www.python.org/). 
- **upload.pl** shows how to return results to this repository from the action being run.


## From Apache

- **selectCGI.pl** shows how to connect to [Postgres database](https://www.postgresql.org/) via [Perl](http://www.perl.org/) [Common Gateway Interface](https://en.wikipedia.org/wiki/Common_Gateway_Interface) on [Apache Web Server](https://en.wikipedia.org/wiki/Apache_HTTP_Server). 