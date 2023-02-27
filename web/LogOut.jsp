<%-- 
    Document   : LogOut
    Created on : 5 lut 2023, 00:04:45
    Author     : jakub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "Sklep.User" %>
<% User user = new User(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wylogowywanie</title>
                <style>
            
  button:hover {
  background-color: #008000;    
  cursor: pointer;}
            
  button{padding: 10px; font-size:20px; color: white; border-radius: 15px; background-color: #70e000; border: 0px solid black}
        </style>
    </head>
    <body style="background-color: #004b23; margin: 0px; height: 100%; width: 100%;">
        <div style="margin-top:20px; display: flex; justify-content: center; align-items: center;">
            <div style=" width: 400px; height: 200px;padding: 10px; background-color: #38b000; text-align: center; border-radius: 35px;">
                                                  <h1>Nastapilo wylogowanie</h1>
                                                  <br>
                                                  <button id="xd2" onclick = "<% user.log_out2(); user.log_out();%> window.location='http://localhost:8080/Sklep/'">Ok</button>
                                                      
                                                  </div>
        
        </div>
    </body>
</html>
