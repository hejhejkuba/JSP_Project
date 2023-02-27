<%-- 
    Document   : Register
    Created on : 2 lut 2023, 18:47:25
    Author     : jakub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="text-align: center;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REJESTRACJA</title>
        <style>
            
  input[type=submit]:hover {
  background-color: #008000;    
  cursor: pointer;}
            
  input[type=submit]{padding: 10px; font-size:20px; color: white; border-radius: 15px; background-color: #70e000; border: 0px solid black}
        </style>
    </head>
    <body style="background-color: #004b23; margin: 0px; height: 100%; width: 100%;">
        <div style="margin-top:20px; display: flex; justify-content: center; align-items: center;">
       <form action="Register_Validate.jsp" method="post" style=" width: 300px; height: 400px;padding: 10px; background-color: #38b000; text-align: center; border-radius: 35px;">
           <h1>REJESTRACJA</h1>
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
        </div>
    </body>
</html>