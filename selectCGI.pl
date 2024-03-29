#!/usr/bin/perl
#-------------------------------------------------------------------------------
# Test Sql from Perl running under Apache
# Philip R Brenan at appaapps dot com, Appa Apps Ltd Inc., 2021
#-------------------------------------------------------------------------------
use warnings FATAL => qw(all);
use strict;
use Data::Dump qw(dump);
use CGI;
use DBI;

my $c = CGI->new();                                                             # Address data fom CGI
print $c->header;                                                               # Http header

my $d = DBI->connect('dbi:Pg:dbname=test;host=localhost','aaaa','aaaa')         # Connect to database
     or die $DBI::errstr;

my $a = $c->param('a'); my $b = $c->param('b');                                 # Get parameters from URL

if (defined($a) and defined($b))
 {$d->do("insert into test values('$a', '$b');");                               # Sample SQL statement
 }

my $s = qq(select * from test);                                                 # Execute an SQL query against the database
my $t = dump($d->selectall_arrayref($s, { Slice => {} }));                      # Dump the response from the database

print <<END;                                                                    # Print the response from the database in some html
<!doctype html>
<pre>
$t
</pre>
END
