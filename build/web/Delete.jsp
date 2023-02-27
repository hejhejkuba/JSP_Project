<%-- 
    Document   : Delete
    Created on : 12 lut 2023, 20:32:19
    Author     : jakub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <form action="Delete_Valid.jsp" method="post" style=" width: 300px; height: 250px;padding: 20px; background-color: #38b000; text-align: center; border-radius: 35px;">
           <h1 style="color: white">Usun Przedmiot</h1>
            <label for="par1">Wpisz ID</label>
            <input type="number" id="par1" name="par1" style="margin-top: 20px;" max="99" required><br><br>
            <input type="submit" value="Usun">
            
        </form>
        </div>
    </body>
</html>
