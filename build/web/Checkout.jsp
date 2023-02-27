<%-- 
    Document   : Checkout
    Created on : 6 lut 2023, 20:51:56
    Author     : jakub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <style>
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
    <body style="background-color: #004b23; margin: 0px; height: 100%; width: 100%;">
        <div style="margin-top:20px; display: flex; justify-content: center; align-items: center;">
        <div style="width: 500px; text-align: center; padding: 30px; background-color: #38b000; text-align: center; border-radius: 35px;">
        <div>
        <%
        String ar[]=request.getParameterValues("par1");
        String a2[]=request.getParameterValues("par2");
        String a3[]=request.getParameterValues("par3");
        int suma = 0;
        if(ar == null)
        {
            %> 
            <h1>Koszyk pusty</h1>
            <%
        } else {
        for(int i=0; i<ar.length;i++){
            %> 
            <p style="color: white; font-size: 20px; border-radius:30px; background-color: #006400;"><%= ar[i] %> <%= a2[i] %> <%= a3[i] %> zl</p>
            
            <% suma = suma + Integer.parseInt(a3[i]);
        };
            %> <p style="font-size: 40px;"><b>Podsumowanie</b></p><p style="border: solid black 1px; font-size: 30px; color: white; border-radius: 30px"><%= suma %> zl</p>
            <form action="FinalizeBuyNow.jsp" method="post"><input type="hidden" name="par1" value="<%= suma %>"><input type="submit" value="Pay"></form>
             <%
};
        %>
        
        </div>
        </div>
        </div>
    </body>
</html>
