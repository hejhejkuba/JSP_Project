package Sklep;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DBConnect {
    private static final String URL = "jdbc:postgresql://localhost/Sklep";
   private static final String USER = "postgres";
   private static final String PASSWD = "";
   
   public static Connection connect()
       {
           Connection connection=null;
       try {
           Class.forName("org.postgresql.Driver.class");
       } catch (ClassNotFoundException ex) {
           ex.getMessage();
       }
           try
           {
              
              connection = DriverManager.getConnection(URL,USER,PASSWD);
              System.out.println("yes");
           }
           catch(SQLException e)
           {
              e.printStackTrace();
           }
           return connection;
       }
}