<%-- 
    Document   : Account
    Created on : 6 lut 2023, 23:00:13
    Author     : jakub
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import= "Sklep.User" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% User user = new User(); %>
<% user.get_data(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
    </head>
    <body style="background-color: #004b23; margin: 0px; height: 100%; width: 100%;">
    <div style="margin-top:20px; display: flex; justify-content: center; align-items: center;">
        <div style="width: 270px; margin: 5px; padding: 20px; background-color: #38b000; border-radius: 35px;"> 
      <%   
      Connection c = null;
      Statement stmt = null;
      try {
         Class.forName("org.postgresql.Driver");
         c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Sklep",
			                    "postgres", "admin");
         c.setAutoCommit(false);
         System.out.println("Opened database successfully");
         stmt = c.createStatement();
         ResultSet rs = stmt.executeQuery( "SELECT * FROM users WHERE login_ = '"+ user.user_data +"';" );
         while ( rs.next() ) {
           
            int id = rs.getInt("id_");
            String login = rs.getString("login_");
            String name = rs.getString("name_");
            String surname = rs.getString("surname_");
             %>
                      
                 <h1 style="color:white; text-align: center;">Dane</h1>
                 <div style="background-color: #006400; border-radius: 35px; padding: 10px; color: white;">
                 <p>id : <%= id %></p>
                 <p>login : <%= login %></p>
                 <p>name : <%= name %></p>
                 <p>surname : <%= surname %></p>
                 </div>
                 
             
            <%
         }
         rs.close();
         stmt.close();
         c.close();
         } catch ( Exception e ) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         System.exit(0);
      }
                %>
                
      <%   
      Connection c2 = null;
      Statement stmt2 = null;
      try {
         Class.forName("org.postgresql.Driver");
         c2 = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Sklep",
			                    "postgres", "admin");
         c2.setAutoCommit(false);
         System.out.println("Opened database successfully");
         stmt2 = c2.createStatement();
         ResultSet rs2 = stmt2.executeQuery( "SELECT * FROM transactions WHERE user_id = '"+ user.user_data +"';" );
         %> 
          <h1 style="color:white; text-align: center;">Zakupy</h1>
                 
         <%
         while ( rs2.next() ) {
           
            int id = rs2.getInt("id_");
            String price = rs2.getString("price");
            ;
             %>
             <br>     
                 <div style="background-color: #006400; border-radius: 35px; padding: 10px; color: white;">
                 <p style="margin-left: 20px">id : <%= id %></p>
                 <p style="margin-left: 20px">Cena : <%= price %> zl</p>
                 </div>
             
            <%
         }
         rs2.close();
         stmt2.close();
         c2.close();
         } catch ( Exception e ) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         System.exit(0);
      }
                %>          
    </div>
    </body>
</html>
