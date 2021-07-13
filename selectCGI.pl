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

my $cgi = CGI->new();
print $cgi->header;

my $d = DBI->connect('dbi:Pg:dbname=test;host=localhost','aaaa','aaaa') or die $DBI::errstr; # Connect to database
my $s = qq(select * from test);
my $t = dump($d->selectall_arrayref($s, { Slice => {} }));

print <<END;
<!doctype html>
<pre>
$t
</pre>
END
