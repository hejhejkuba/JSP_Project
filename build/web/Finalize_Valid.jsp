<%-- 
    Document   : Finalize_Valid
    Created on : 7 lut 2023, 22:53:48
    Author     : jakub
--%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "Sklep.User" %>
<% User user = new User(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finalize</title>
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
            user.get_status();
            user.get_data();
            
            String card_number = request.getParameter("par1");
            String CVV = request.getParameter("par2");
            String price = request.getParameter("par3");
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
				          ResultSet rs = stmt.executeQuery( "SELECT Count(*) FROM \"bank_card\" WHERE \"card_numer\" = '" + card_number +"' AND \"CVV\" = '" + CVV +"';" );
				          rs.next();
				          if(rs.getInt(1)==1)
				          {
			                      if(user.user_status.equals("LOGIN") && !user.user_data.equals("GUEST"))
                                              {
                                               stmt2 = c.createStatement();
                                               String user_login = user.user_data;
				              String sql = "INSERT INTO \"transactions\" (\"price\", \"user_id\") VALUES ('"+ price +"', '"+user_login+"');";
				              stmt2.executeUpdate(sql); 
				              rs.close();
				              stmt2.close();
					          c.close(); 
                                                  %>
                                                  <div style=" width: 400px; height: 200px;padding: 10px; background-color: #38b000; text-align: center; border-radius: 35px;">
                                                  <h1 style="color: white;">Kupno powiodło się</h1>
                                                  <br>
                                                  <button onclick = "window.location='http://localhost:8080/Sklep/'">Wroc</button>  
                                                  </div>
                                                  <%  
                                              
                                              } else {
                                              
                                              stmt2 = c.createStatement();
                                              
				              String sql = "INSERT INTO \"transactions\" (\"price\") VALUES ('"+ price +"');";
				              stmt2.executeUpdate(sql); 
				              rs.close();
				              stmt2.close();
					          c.close(); 
                                                  %>
                                                  <div style=" width: 400px; height: 200px;padding: 10px; background-color: #38b000; text-align: center; border-radius: 35px;">
                                                  <h1 style="color: white;">Kupno powiodło się</h1>
                                                  <br>
                                                  <button onclick = "window.location='http://localhost:8080/Sklep/'">Wroc</button>  
                                                  </div>
                                                  <%  
				          }}
				          else {
				        	  rs.close();
					          //stmt2.close();
					          c.close();  
                                                  %>
                                                    <div style="margin-top:20px; display: flex; justify-content: center; align-items: center;">
                                                        <form action="Finalize_Valid.jsp" method="post" style=" width: 400px; height: 250px;padding: 10px; background-color: #38b000; text-align: center; border-radius: 35px;">
                                                       <h1>Finalizowanie</h1>
                                                       <h2 style="color: red;">Blad Transakcji</h2>
                                                       <label>Numer Karty</label>
                                                            <input type="text" name="par1" maxlength="16"><br>
                                                            <br>
                                                            <label>CVV</label>
                                                            <input type="text" name="par2" maxlength="3"><br>
                                                            <input type="hidden" name="par3" value="<%= price %>">
                                                            <br>
                                                            <input style="" type="submit" value="Finalize">
                                                        </form>
                                                    </div>
                                                  
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
