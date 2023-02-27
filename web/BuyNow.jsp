<%-- 
    Document   : BuyNow
    Created on : 2 lut 2023, 21:10:46
    Author     : jakub
--%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "Sklep.User" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buy Item</title>
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
            <div style=" width: 700px; height: 450px;padding: 10px; background-color: #38b000; border-radius: 35px; text-align: center;">
        <%
            String id_ = request.getParameter("par1");   
            String price_ = request.getParameter("par2");
            int amount_ = Integer.parseInt(request.getParameter("par3"));
            String photo_id_ = request.getParameter("par4");
            String name_ = request.getParameter("par5");


        %>
        
        <h1><%= name_ %></h1>
        <img src="resources/img/<%= photo_id_ %>.jpg" style="float: left;height: 250px; width: 250px;">
        <p style=" margin: 20px;padding: 30px;">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
        <p style="font-size: 30px;"><b><%= price_ %> zl</b></p>
        <form action="FinalizeBuyNow.jsp" method="post"><input type="hidden" name="par1" value="<%= price_ %>"><input type="submit" value="Pay"></form>
          </div>
            </div>
        </body>
</html>
