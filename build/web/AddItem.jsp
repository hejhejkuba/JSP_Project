<%-- 
    Document   : AddItem
    Created on : 12 lut 2023, 15:40:32
    Author     : jakub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <form action="AddItemValid.jsp" method="post" style=" width: 300px; height: 400px;padding: 20px; background-color: #38b000; text-align: center; border-radius: 35px;">
           <h1 style="color: white">Dodaj Przedmiot</h1>
            <label for="par1">Nazwa</label>
            <input type="text" id="par1" name="par1" style="margin-top: 20px;" required><br>
            <label for="par2">Cena</label>
            <input type="number" id="par2" name="par2" style="margin-top: 20px;" required><br>
            <label for="par3">Ilosc</label>
            <input type="number" id="par3" name="par3" style="margin-top: 20px;" required><br><br>
            <label for="img" style="font-size: 24px">Zdjecie</label>
            <input type="file" id="img" name="par4" accept="image/*" style="margin-top: 20px;" required><br>
            <input type="submit" value="Dodaj">
            
        </form>
        </div>
    </body>
</html>
