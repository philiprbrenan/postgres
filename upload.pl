#!/usr/bin/perl -Ilib
use Data::Table::Text qw(:all);
use GitHub::Crud;

GitHub::Crud::writeFileFromCurrentRun((output.txt), readFile(q(output.txt)));
