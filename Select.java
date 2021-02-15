import java.sql.*;

public class Select
 {static final String
     URL  = "jdbc:postgresql://localhost/test",
     USER = "aaaa",
     PASS = "aaaa";

  public static void main(String[] args)
   {Connection conn = null;
    Statement  stmt = null;
    
    try
     {conn = DriverManager.getConnection(URL, USER, PASS);

      stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery("select * from test");

      while(rs.next())
       {String name    = rs.getString(1);
        String address = rs.getString(2);
        System.out.print("Name: " + name+" Address: " + address+"\n");
       }
      
      rs.close();
      stmt.close();
      conn.close();
     }
    catch(Exception e)
     {e.printStackTrace();
     }
   }
 }
