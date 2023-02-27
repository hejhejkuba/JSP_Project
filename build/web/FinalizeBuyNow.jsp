<%-- 
    Document   : FinalizeBuyNow
    Created on : 5 lut 2023, 00:33:56
    Author     : jakub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        </style>
    </head>
    <body style="background-color: #004b23; margin: 0px; height: 100%; width: 100%;">
        <% String suma[] = request.getParameterValues("par1"); %>
        
        <div style="margin-top:20px; display: flex; justify-content: center; align-items: center;">
            <form action="Finalize_Valid.jsp" method="post" style=" width: 400px; height: 250px;padding: 10px; background-color: #38b000; text-align: center; border-radius: 35px;">
           <h1>Finalizowanie</h1>
           <label>Numer Karty</label>
                <input type="text" name="par1" maxlength="16"><br>
                <br>
                <label>CVV</label>
                <input type="text" name="par2" maxlength="3"><br>
                <input type="hidden" name="par3" value="<%= suma[0] %>">
                <br>
                <input style="" type="submit" value="Finalize">
            </form>
        </div>
    </body>
</html>
