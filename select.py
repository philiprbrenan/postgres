#!/usr/bin/python
import pgdb

C = pgdb.Connection(host='localhost', user='aaaa', password='aaaa', database='test')
c = C.cursor()

c.execute( "select * from test" )

for firstname, lastname in c.fetchall() :
  print( firstname, lastname )

c.close()
