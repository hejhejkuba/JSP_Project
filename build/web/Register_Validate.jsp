<%-- 
    Document   : Register_Validate
    Created on : 4 lut 2023, 22:19:49
    Author     : jakub
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REJESTRACJA</title>
        <style>
            
  input[type=submit]:hover {
  background-color: #008000;    
  cursor: pointer;}
            
  input[type=submit]{padding: 10px; font-size:20px; color: white; border-radius: 15px; background-color: #70e000; border: 0px solid black}
  
              
  button:hover {
  background-color: #008000;    
  cursor: pointer;}
            
  button{padding: 10px; font-size:20px; color: white; border-radius: 15px; background-color: #70e000; border: 0px solid black}
        </style>
    </head>
     <body style="background-color: #004b23; margin: 0px; height: 100%; width: 100%;">
         <div style="margin-top:20px; display: flex; justify-content: center; align-items: center;">
            <% 
            String name = request.getParameter("par1");
            String surname = request.getParameter("par2");
            String login = request.getParameter("par3");
            String password = request.getParameter("par4");
            
             Connection c = null;
		      Statement stmt = null;
	              Statement stmt2 = null;
		
			try {
		         Class.forName("org.postgresql.Driver");
		         c = DriverManager
		            .getConnection("jdbc:postgresql://localhost:5432/Sklep",
		                    "postgres", "admin");
		         
		         if (c != null) {
		        	   c.setAutoCommit(true);
				         stmt = c.createStatement();
				          ResultSet rs = stmt.executeQuery( "SELECT Count(*) FROM \"users\" WHERE \"login_\" = '" + login +"';" );
				          rs.next();
				          if(rs.getInt(1)==0)
				          {
			                      stmt2 = c.createStatement();
			                    
				              String sql = "INSERT INTO \"users\" (\"login_\", \"password_\", \"name_\", \"surname_\") VALUES ('"+ login +"', '"+password+"', '"+name+"', '"+surname+"');";
				              stmt2.executeUpdate(sql); 
				              rs.close();
				              stmt2.close();
					          c.close(); 
                                                  %>
                                                  <div style=" width: 400px; height: 200px;padding: 10px; background-color: #38b000; text-align: center; border-radius: 35px;">
                                                  <h1 style="color: white;">Rejestracja powiodła się</h1>
                                                  <br>
                                                  <h2 style="color: white;">Witaj <%= name %></h2>
                                                  <button onclick = "window.location='http://localhost:8080/Sklep/'">Wroc</button>
                                                      
                                                  </div>
                                                  <%  
				          }
				          else {
				        	  rs.close();
					          //stmt2.close();
					          c.close();  
                                                  %>
                                                  <form action="Register_Validate.jsp" method="post" style=" width: 300px; height: 400px;padding: 10px; background-color: #38b000; text-align: center; border-radius: 35px;">
                                                    <h1>REJESTRACJA</h1>
                                                    <h2 style="color: red;">Taki użytkownik istnieje</h2>
                                                         <label>Imie</label>
                                                         <input type="text" name="par1"><br><br>
                                                         <label>Nazwisko</label>
                                                         <input type="text" name="par2"><br><br>
                                                         <label>Login</label>
                                                         <input type="text" name="par3"><br>
                                                         <br>
                                                         <label>Haslo</label>
                                                         <input type="password" name="par4"><br>
                                                         <br>
                                                         <input style="" type="submit" value="Zarejestruj">
                                                     </form>
                                                  
                                                  <%
				          };
		            } else {
		            	%> 
                                <h1>SERWER WYLACZONY</h1>                  
                                <%

		        }
		      
		         
		 	} catch (Exception e) {
	         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	         
	      }


            %>
            
         </div>   
    </body>
</html>
