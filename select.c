#include <stdio.h>
#include <stdlib.h>
#include <libpq-fe.h>

int main()
 {PGconn *conn = PQconnectdb("user=aaaa password=aaaa host=localhost dbname=test");

  if (PQstatus(conn) == CONNECTION_BAD)
   {fprintf(stderr, "Connection to database failed: %s\n", PQerrorMessage(conn));
    exit(1);
   }

  PGresult *res = PQexec(conn, "select * from test");

  if (PQresultStatus(res) != PGRES_TUPLES_OK)
   {printf("No data retrieved\n");
    exit(1);
   }

  int rows = PQntuples(res);

  for(int i=0; i<rows; i++)
   {printf("%s %s\n", PQgetvalue(res, i, 0), PQgetvalue(res, i, 1));
   }

  PQclear(res);
  PQfinish(conn);

  return 0;
 }
