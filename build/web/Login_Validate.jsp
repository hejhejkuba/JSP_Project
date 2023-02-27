<%-- 
    Document   : Login_Validate
    Created on : 4 lut 2023, 22:19:37
    Author     : jakub
--%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "Sklep.User" %>
<!DOCTYPE html>
<% User user = new User(); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logowanie</title>
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
    String login = request.getParameter("par1");
    String password = request.getParameter("par2");
    Connection c = null;
		Statement stmt = null;
	      try {
	          Class.forName("org.postgresql.Driver");
	          c = DriverManager
			            .getConnection("jdbc:postgresql://localhost:5432/Sklep",
			                    "postgres", "admin");
	          if (c != null) {
	          c.setAutoCommit(false);
	         // System.out.println("Opened database successfully");

	          stmt = c.createStatement();
	          ResultSet rs = stmt.executeQuery( "SELECT Count(*) FROM \"users\" WHERE \"login_\" = '" + login + "' AND \"password_\" = '" + password + "';" );
	          rs.next();
	          if(rs.getInt(1)==0)
	          {
	        	  //user dont exist
	        	  
	        	  rs.close();
		          stmt.close();
		          c.close(); 
                          %>
                            <div style="margin-top:20px; display: flex; justify-content: center; align-items: center;">
                               <form action="Login_Validate.jsp" method="post" style=" width: 300px; height: 400px;padding: 10px; background-color: #38b000; text-align: center; border-radius: 35px;">
                                   <h1>LOGOWANIE</h1>
                                   <h2 style="color: red;">Bledne dane</h2>
                                   <label>Login</label>
                                        <input type="text" name="par1"><br>
                                        <br>
                                        <label>Haslo</label>
                                        <input type="password" name="par2"><br>
                                        <br>
                                        <input style="" type="submit" value="Zaloguj">
                                    </form>
                                </div>
                            <%
	          }
	          else {
	        	 
	        	  rs.close();
		          stmt.close();
		          c.close();
                          if(login.equals("admin1") && password.equals("admin1")){user.set_admin();}else{user.set_login();user.set_data(login);};
                          
                          %>
                          <div style=" width: 400px; height: 200px;padding: 10px; background-color: #38b000; text-align: center; border-radius: 35px;">
                                                  <h1 style="color: white;">Logowanie powiodło się</h1>
                                                  <br>
                                                  <h2 style="color: white;">Witaj <%= login %></h2>
                                                  <button onclick = "window.location='http://localhost:8080/Sklep/'">Wroc</button>
                                                      
                                                  </div>
                          
                          
                          <%
		          
	          };
	          }
	          else {
                      		%> 
                                <h1>SERWER WYLACZONY</h1>                  
                                <%
	          }
	         
	       } catch ( Exception e ) {
	          System.err.println( e.getClass().getName()+": "+ e.getMessage() );
                  		%> 
                                <h1>SERWER WYLACZONY</h1>                  
                                <%

	   
	       }
    
    
    
    %> 
        </div>
    </body>
</html>
