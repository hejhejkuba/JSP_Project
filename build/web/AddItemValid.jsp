<%-- 
    Document   : AddItemValid
    Created on : 12 lut 2023, 16:16:03
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Item</title>
    </head>
    <body style="background-color: #004b23; margin: 0px;text-align: center; overflow: hidden;">
        <div style="margin-top:20px; display: flex; justify-content: center; align-items: center;">
        
        <% 
    String name = request.getParameter("par1");
    String price = request.getParameter("par2");
    String amount = request.getParameter("par3");
    String photo = request.getParameter("par4");
    String photo_cut = "";
    int photo_id = 0;
    int int_amount = 0;
    
    if(name.equals("")|| price.equals("") || amount.equals("") || photo.equals("")){
    %>
    
        <form action="AddItemValid.jsp" method="post" style=" width: 300px; height: 400px;padding: 20px; background-color: #38b000; text-align: center; border-radius: 35px;">
            <h1 style="color: white">Dodaj Przedmiot</h1>
            <h1 style="color: red">Bledne dane</h1>
            <label for="par1">Nazwa</label>
            <input type="text" id="par1" name="par1" style="margin-top: 20px;"><br>
            <label for="par2">Cena</label>
            <input type="number" id="par2" name="par2" style="margin-top: 20px;"><br>
            <label for="par3">Ilosc</label>
            <input type="number" id="par3" name="par3" style="margin-top: 20px;"><br><br>
            <label for="img" style="font-size: 24px">Zdjecie</label>
            <input type="file" id="img" name="par4" accept="image/*" style="margin-top: 20px;"><br>
            <input type="submit" value="Dodaj">
            
        </form>
        
    
    
    <%
    }else{
     String[] res = photo.split("[.]", 0);
     photo_cut = res[0];
     int_amount = Integer.parseInt(amount);
     try{
     photo_id = Integer.parseInt(photo_cut);
     }
     catch(Exception k){
     %>
     <form action="AddItemValid.jsp" method="post" style=" width: 300px; height: 400px;padding: 20px; background-color: #38b000; text-align: center; border-radius: 35px;">
            <h1 style="color: white">Dodaj Przedmiot</h1>
            <h1 style="color: red">Bledne dane zdjecia</h1>
            <label for="par1">Nazwa</label>
            <input type="text" id="par1" name="par1" style="margin-top: 20px;"><br>
            <label for="par2">Cena</label>
            <input type="number" id="par2" name="par2" style="margin-top: 20px;"><br>
            <label for="par3">Ilosc</label>
            <input type="number" id="par3" name="par3" style="margin-top: 20px;"><br><br>
            <label for="img" style="font-size: 24px">Zdjecie</label>
            <input type="file" id="img" name="par4" accept="image/*" style="margin-top: 20px;"><br>
            <input type="submit" value="Dodaj">
            
        </form>
     <%
        };
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
			                    
				              String sql = "INSERT INTO \"products\" (\"name_\", \"price\", \"amount\", \"photo_id\") VALUES ('"+ name +"', '"+price+"', '"+int_amount+"', '"+photo_id+"');";
				              stmt2.executeUpdate(sql); 
				              stmt2.close();
					          c.close(); 
                                                %>
                                                  <div style=" width: 400px; height: 350px;padding: 10px; background-color: #38b000; text-align: center; border-radius: 35px;">
                                                  <h1 style="color: white;">Dodano przedmiot</h1>
                                                  <br>
                                                  <h2 style="color: white;">Nazwa: <%= name %></h2>
                                                  <h2 style="color: white;">Cena: <%= price %></h2>
                                                  <h2 style="color: white;">Ilosc: <%= int_amount %></h2>
                                                  <h2 style="color: white;">Photo_id: <%= photo_id %></h2>
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

};
    
    %>
        </div>
    </body>
</html>
