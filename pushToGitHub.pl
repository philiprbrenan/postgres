#!/usr/bin/perl -I/home/phil/perl/cpan/DataTableText/lib/ -I/home/phil/perl/cpan/GitHubCrud/lib/
#-------------------------------------------------------------------------------
# Push to GitHub postgres
# Philip R Brenan at gmail dot com, Appa Apps Ltd Inc., 2021
#-------------------------------------------------------------------------------
use warnings FATAL => qw(all);
use strict;
use Carp;
use Data::Dump qw(dump);
use Data::Table::Text qw(:all);
use GitHub::Crud qw(:all);
use feature qw(say current_sub);

my $home = q(/home/phil/perl/z/postgres/);                                      # Local files
my $user = q(philiprbrenan);                                                    # User
my $repo = q(postgres);                                                         # Repo
my $wf   = q(.github/workflows/main.yml);                                       # Work flow on Ubuntu

my @files = grep {!m(/lib/)} searchDirectoryTreesForMatchingFiles $home;        # Files to push

if (1)                                                                          # Upload Perl files
 {for my $s(@files)                                                             # Upload each selected file
   {my $t = swapFilePrefix($s, $home);
    my $p = readFile($s);
    my $w = writeFileUsingSavedToken($user, $repo, $t, $p);
    lll "$w $s $t";
   }
 }

for(1..1)                                                                       # Workflow Ubuntu
 {my $d = dateTimeStamp;                                                        # Make work flow different
  my $y = <<END;
# Postgres on GitHub $d

name: Test

on:
  push

jobs:
  c:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout\@v2

    - name: Install
      run: |
        sudo apt install libpq-dev build-essential

    - name: Test
      run: |
        sudo systemctl start postgresql.service
        sudo -i -u postgres psql < load.txt
        gcc -rdynamic -Wall -I/usr/include/postgresql/ -o "select" "select.c"  -lm -lpq; ./select

  java:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout\@v2

    - name: Test
      run: |
        sudo systemctl start postgresql.service
        sudo  -i -u postgres psql < load.txt
        wget  -q https://jdbc.postgresql.org/download/postgresql-42.2.18.jar
        javac -d . -g -cp postgresql-42.2.18.jar Select.java && java -ea -cp .:postgresql-42.2.18.jar Select

  js:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout\@v2

    - name: Install
      run: |
        sudo apt install nodejs
        npm install pg

    - name: Test
      run: |
        sudo systemctl start postgresql.service
        sudo -i -u postgres psql < load.txt
        nodejs select.js

  perl:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout\@v2

    - name: Install
      run: |
        sudo cpan -T -i Data::Table::Text GitHub::Crud Digest::SHA1 Date::Manip DBI DBD::Pg

    - name: Test
      run: |
        sudo systemctl start postgresql.service
        cat load.txt
        sudo -i -u postgres psql < load.txt > output.txt
        perl select.pl
        GITHUB_TOKEN=\${{ secrets.GITHUB_TOKEN }} perl upload.pl

  python:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout\@v2

    - name: Install
      run: |
        pip3 install pgdb

    - name: Test
      run: |
        sudo systemctl start postgresql.service
        cat load.txt
        sudo -i -u postgres psql < load.txt > output.txt
        python3 select.py


  Apache:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout\@v2

    - name: Install Perl
      run: |
        sudo cpan -T -i Data::Table::Text GitHub::Crud Digest::SHA1 Date::Manip DBI DBD::Pg

    - name: Install Apache
      run: |
        sudo apt install apache2
        sudo a2enmod cgid
        sudo systemctl restart apache2
        curl http://localhost/

    - name: Test
      run: |
        sudo systemctl start postgresql.service
        sudo cp selectCGI.pl /usr/lib/cgi-bin/
        sudo chmod ugo=rwx /usr/lib/cgi-bin/selectCGI.pl
        curl http://localhost/cgi-bin/selectCGI.pl
END

  lll "Work flow for $repo ", writeFileUsingSavedToken($user, $repo, $wf, $y);
 }
