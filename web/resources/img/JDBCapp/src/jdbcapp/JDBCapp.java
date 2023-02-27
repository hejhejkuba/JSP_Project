package jdbcapp;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class JDBCapp { 

        public static void main(String[] args) 
        throws ClassNotFoundException, SQLException 
		{ 
                //sterownik - należy dopasować do swojej bazy danych - tu: baza MySQL
		//Class.forName("com.mysql.jdbc.Driver");
		Class.forName("org.apache.derby.jdbc.EmbeddedDriver");	
                
                
                //lokalizacja i dostęp do bazy danych - należy dopasować do swojej bazy 
                // - tu: localhost, czyli baza umieszczona lokalnie, na tym samym komputerze, login i hasło do bazy jak widać
                String url = "jdbc:derby://localhost:1527/JDBC_sample"; 
		//String url = "jdbc:mysql://localhost/test";
                String user = "root"; 
		String passwd = "root"; 
                
                //String url = "jdbc:mysql://database.phys.uni.lodz.pl/java"; 
                //String url = "jdbc:mysql://192.168.2.4/java"; 
		//String user = "java"; 
		//String passwd = "java"; 
                
		//nawiązanie połączenia
                Connection db = DriverManager.getConnection(url, user, passwd); 
                
                db.setAutoCommit(true); 
		
                //utworzenie obiektu typu Statement, który odpowiada za generowanie zapytań do bazy
                Statement st = db.createStatement(); 
		try
		{
                    //////////////////////////////////////////////////////
                    //ten fragment kodu można wykorzystać do stworzenia tabeli, jeśli tabela już istnieje, jest zbędny
                   /* 
                   String sql = "CREATE TABLE STUDENT " +
                   "(id INTEGER, " +
                   " imie VARCHAR(255), " + 
                   " nazwisko VARCHAR(255))"; 

                   st.executeUpdate(sql);
                   */ 
                   /////////////////////////////////////////////////// 
                   
                // Wysłanie do bazy zapytania typu select, robimy to za pomocą metody executeQuery()
                // Wynik otrzymujemy w obiekcie typu ResultSet
                ResultSet rs = st.executeQuery("select * from STUDENT");
                
                   //////////////////////////////////////////////////////
                   // Przykładowe zapytania modyfikujące - w ich przypadku używamy metody executeUpdate()
                   //String sql = "INSERT INTO STUDENT VALUES (17,'Jan','Kowalski')";
                   //String sql = "DELETE FROM STUDENT WHERE nazwisko='Kos'";
                   //int insertedRows = st.executeUpdate(sql);
                   
                   ///////////////////////////////////////////////////// 
		// pętla while przeglądająca wyniki
		while (rs.next())
		{ 
			System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3));
                        //System.out.println(rs.getString(2)+" "+rs.getString(3));
		} 
		
		rs.close(); 
		//db.commit(); 
		st.close();
		db.close(); 
		}
	catch(SQLException wyjatek) {

        System.out.println("SQLException: " + wyjatek.getMessage());
        System.out.println("SQLState: " + wyjatek.getSQLState());
        System.out.println("Error: " + wyjatek.getErrorCode());
	}

		} 
}
