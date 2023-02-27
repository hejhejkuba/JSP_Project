<%-- 
    Document   : Delete_Valid
    Created on : 12 lut 2023, 20:32:28
    Author     : jakub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Product</title>
        <style>
            .linked_img:hover{
                cursor: pointer;
                
            }
  input[type=submit]:hover {
  background-color: #008000;    
  cursor: pointer;}
            
  input[type=submit]{padding: 10px; font-size:20px; color: white; border-radius: 15px; background-color: #70e000; border: 0px solid black}
  
  button:hover {
  background-color: #008000;    
  cursor: pointer;}
  
  #right_bar::-webkit-scrollbar {
    display: none;
}    
 #basket_bar::-webkit-scrollbar {
    display: none;
}  
  button{padding: 10px; font-size:20px; color: white; border-radius: 15px; background-color: #70e000; border: 0px solid black}
        </style>
    </head>
       <body style="background-color: #004b23; margin: 0px;text-align: center; overflow: hidden;">
        
        <div style="margin-top:20px; display: flex; justify-content: center; align-items: center;">
        <% 
        int id = Integer.parseInt(request.getParameter("par1"));
                     Connection c = null;
	              Statement stmt2 = null;
        try {
		         Class.forName("org.postgresql.Driver");
		         c = DriverManager
		            .getConnection("jdbc:postgresql://localhost:5432/Sklep",
		                    "postgres", "admin");
		         
		         if (c != null) {
		        	   c.setAutoCommit(true);
                                              stmt2 = c.createStatement();
			                    
				              String sql = "DELETE FROM \"products\"  WHERE \"id_\" = '"+ id +"';";
				              stmt2.executeUpdate(sql); 
				              stmt2.close();
					          c.close(); 
                                                %>
                                                <div style=" width: 300px; height: 250px;padding: 20px; background-color: #38b000; text-align: center; border-radius: 35px;"> 
                                                <h1 style="color: white">Usunieto przedmiot pomyslnie</h1>
                                                <button onclick = "window.location='http://localhost:8080/Sklep/'">Wroc</button>
                                                </div>
                                                  <%  
            }else{
		            	%> 
                                <h1>SERWER WYLACZONY</h1>                  
                                <%};
}catch (Exception e) {
	         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
	         
	      };
        %>
        </div>
    </body>
</html>
