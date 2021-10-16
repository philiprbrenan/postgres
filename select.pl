#!/usr/bin/perl
#-------------------------------------------------------------------------------
# Test Sql from Perl.
# Philip R Brenan at appaapps dot com, Appa Apps Ltd Inc., 2021
#-------------------------------------------------------------------------------
use warnings FATAL => qw(all);
use strict;
use Data::Dump qw(dump);
use DBI;

my $d = DBI->connect('dbi:Pg:dbname=test;host=localhost','aaaa','aaaa') or die $DBI::errstr; # Connect to database
my $s = qq(select * from test);
say STDERR dump($d->selectall_arrayref($s, { Slice => {} }));
