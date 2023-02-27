
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import= "Sklep.User" %>
<% User user = new User(); %>

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
        <title>Litwin Line</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="resources/css/main_style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="background-color: #004b23; margin: 0px;text-align: center; overflow: hidden;">
        <script>
          function Delete(id){
              const element = document.getElementById(id);
              element.remove();
              
          };
          function myFunction(id, name, price) {
              const div_ = document.createElement("div");
              div_.setAttribute("id", id);
              div_.setAttribute("style", "margin: 30px; padding: 10px; background-color: #38b000; text-align: center; border-radius: 35px;");
              
              const input_1 = document.createElement("input");
              input_1.setAttribute("type", "hidden");
              input_1.setAttribute("name", "par1");
              input_1.setAttribute("value", id);
              
              const input_2 = document.createElement("input");
              input_2.setAttribute("type", "hidden");
              input_2.setAttribute("name", "par2");
              input_2.setAttribute("value", name);
              
              const input_3 = document.createElement("input");
              input_3.setAttribute("type", "hidden");
              input_3.setAttribute("name", "par3");
              input_3.setAttribute("value", price);
              
        
              const para = document.createElement("p");
              
              const deletee = document.createElement("button");
              deletee.setAttribute("onclick", "Delete( " + id + ")");
              
              Text = id + ' '+ name + ' ' + price + 'zl';
              Delete_Text = 'Delete';
              
              
              
              const node = document.createTextNode(Text);
              para.appendChild(node);
              const node2 = document.createTextNode(Delete_Text);
              deletee.appendChild(node2);
              const element = document.getElementById("basket_form_bar");
              
              
              
             div_.appendChild(para);
             div_.appendChild(input_1);
             div_.appendChild(input_2);
             div_.appendChild(input_3);
             div_.appendChild(deletee); 
              
              element.appendChild(div_);
              
        }  
            
            
        </script>
        <div id="nazwa" style="width: 100%;  background-color: #004b23; margin: 0px; ">
        <h1 style="font-size: 40px;margin: 0px; color: #FFFFFF;">Litwin Line</h1> 
        </div>
        <div id="main" style="margin:0px; width: 100%; height: 90%" >
            <div id="left_bar" style="float: left; height: 100%; background-color: #006400; width: 15%; text-align: center;">
                    <% user.get_status();%>
                    <h2 style="color: white; font-size: 40px">Options</h2><br><br>
                    <p style="color:white;">Your Status:  <%= user.user_status %></p><br><br>
                    <% if(user.user_status.equals("GUEST")){ %>
                    <button onclick="window.location='http://localhost:8080/Sklep/Register.jsp'">Register</button><br><br>
                    <button onclick="window.location='http://localhost:8080/Sklep/Login.jsp'">Log In</button><br><br>
                    <% }; %>
                    <% if(user.user_status.equals("LOGIN")){ %>
                    <button onclick="window.location='http://localhost:8080/Sklep/LogOut.jsp'">Log Out</button><br><br>
                    <button onclick="window.location='http://localhost:8080/Sklep/Account.jsp'">Account</button><br><br>
                    <% }; %>
                    <% if(user.user_status.equals("ADMIN")){ %>
                    <button onclick="window.location='http://localhost:8080/Sklep/AddItem.jsp'">Add Product</button><br><br>
                    <button onclick="window.location='http://localhost:8080/Sklep/Delete.jsp'">Delete Item</button><br><br>
                    <button onclick="window.location='http://localhost:8080/Sklep/LogOut.jsp'">Log Out</button><br><br>
                    
                    <% }; %>
                
                
            </div>
            <div id="right_bar" style="overflow: scroll; float: left; height: 100%; width: 65%; background-color: #008000;">
                <% Connection c = null;
      Statement stmt = null;
      try {
         Class.forName("org.postgresql.Driver");
         c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Sklep",
			                    "postgres", "admin");
         c.setAutoCommit(false);
         System.out.println("Opened database successfully");
         stmt = c.createStatement();
         ResultSet rs = stmt.executeQuery( "SELECT * FROM products;" );
         while ( rs.next() ) {
           
            int id = rs.getInt("id_");
            int price = rs.getInt("price");
            int amount = rs.getInt("amount");
            int photo_id = rs.getInt("photo_id");
            String  name = rs.getString("name_");
            boolean sold  = rs.getBoolean("sold");
             %>
             <div id="product" style="float: left; width: 270px; height: 410px; margin: 5px; padding: 10px; background-color: #38b000; text-align: center; border-radius: 35px;">
                 <h3><%= name %></h3>
                 <img src="resources/img/<%= photo_id %>.jpg" style="height: 200px; width: 200px;">
                 <p><%= price %> zl</p>
                 <% if(amount!=0 && sold != true){ %>
                 <form action="BuyNow.jsp">
                     <input type="hidden" name="par1" value="<%= id %>">
                     <input type="hidden" name="par2" value="<%= price %>">
                     <input type="hidden" name="par3" value="<%= amount %>">
                     <input type="hidden" name="par4" value="<%= photo_id %>">
                     <input type="hidden" name="par5" value="<%= name %>">
                     <input type="hidden" name="par6" value="<%= sold %>">
                     <input type="submit" value="buy now">
                 
                 </form>
                 
                 <button onclick="myFunction('<%= id %>', '<%= name %>', '<%= price %>')" >add to cart</button>
                 <%} else {%>
                 <button>SOLD</button>
                 <%};%>
                 
             </div>
            <%
         }
         rs.close();
         stmt.close();
         c.close();
         } catch ( Exception e ) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         System.exit(0);
      }
                %>
            </div>
            <div id="basket_bar" style="overflow: scroll; float: left; height: 100%; width: 20%; background-color: #008000;">
                <h1 style="color: white;">Koszyk</h1>
                <form id="basket_form_bar" action="Checkout.jsp">
                    <input type="submit" value="Checkout">    
                </form>
                </div>
        </div>
        <section id="footer_bar" style ="margin: 0px; color: white; position: fixed; width: 100vw; bottom: 0px; text-align: center;background-color: #004b23">
            <div  id="media_list" style="float:left; width: 100vw; border-bottom: 1px solid white;">
              <img class="linked_img" src = "resources/img/instagram.svg" alt="Instagram" style="height: 35px; background-color: #38b000; border-radius: 10px; padding:2px"
                   onclick="window.location='https://www.instagram.com/kasiawlesie/'">
              <img class="linked_img" src = "resources/img/square-facebook.svg" alt="Facebook" style="height: 35px; margin-left: 30px; background-color: #38b000; border-radius: 10px; padding:2px"
                   onclick="window.location='https://www.facebook.com/profile.php?id=100063621759769'">
              <img class="linked_img" src = "resources/img/youtube.svg" alt="YouTube" 
                   style="height: 35px;
                   margin-left: 30px; 
                   background-color: #38b000; 
                   border-radius: 10px; 
                   padding: 2px;"
                  
                   onclick="window.location='https://youtu.be/2gUCdmelgdc'"
                   >
                   
              
             
            </div>
            <footer style="margin: 0px; color: white; width: 100vw; bottom: 0px; text-align: center;background-color: #004b23">
                
                <p style=" margin: 0px;">Made by Jakub Litwin</p>    
            </footer>
        </section>
    </body>
</html>
