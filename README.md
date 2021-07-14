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

- ![select.c](https://github.com/philiprbrenan/postgres/blob/main/select.c) shows how to connect to [Postgres database](https://www.postgresql.org/) directly from [the C programming language](https://1lib.eu/book/633119/db5c78). 
- ![select.java](https://github.com/philiprbrenan/postgres/blob/main/select.java) shows how to connect to [Postgres database](https://www.postgresql.org/) directly from [Java](https://en.wikipedia.org/wiki/Java_(programming_language)). 
- ![select.js](https://github.com/philiprbrenan/postgres/blob/main/select.js) shows how to connect to [Postgres database](https://www.postgresql.org/) directly from [NodeJs](https://en.wikipedia.org/wiki/NodeJs). 
- ![select.pl](https://github.com/philiprbrenan/postgres/blob/main/select.pl) shows how to connect to [Postgres database](https://www.postgresql.org/) directly from [Perl](http://www.perl.org/). 
- ![select.py](https://github.com/philiprbrenan/postgres/blob/main/select.py) shows how to connect to [Postgres database](https://www.postgresql.org/) directly from [Python](https://www.python.org/). 

## From Apache

![selectCGI.c](https://github.com/philiprbrenan/postgres/blob/main/selectCGI.pl) shows how to connect to [Postgres database](https://www.postgresql.org/) via [Perl](http://www.perl.org/) using [Common Gateway Interface](https://en.wikipedia.org/wiki/Common_Gateway_Interface) on [Apache Web Server](https://en.wikipedia.org/wiki/Apache_HTTP_Server). 
```
 [curl](https://linux.die.net/man/1/curl) -s     "http://localhost/cgi-bin/selectCGI.pl?a=111111&b=2222222"

<!doctype html>
<pre>
[
  { address => "AAAA", name => "aaa" },
  { address => "BBBB", name => "bbb" },
  { address => "CCCC", name => "ccc" },
  { address => "DDDD", name => "ddd" },
  { address => "EEEE", name => "eee" },
  { address => 2222222, name => 111111 },
]
</pre>
```

## Uploading results

![upload.pl](https://github.com/philiprbrenan/postgres/blob/main/[upload.pl) shows how to return results to a repository from the action being run,  This can also be done via a [Perl](http://www.perl.org/) [one line program](https://en.wikipedia.org/wiki/One-liner_program) :

```
GITHUB_TOKEN=${{ secrets.GITHUB_TOKEN }} [Perl](http://www.perl.org/) -M"GitHub::Crud" -e"GitHub::Crud::writeFileFromFileFromCurrentRun q(output.txt);"
```
