<%-- 
    Document   : login
    Created on : Jan 26, 2020, 12:24:32 PM
    Author     : malit
--%>

        



<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Register</title>
          <link rel="stylesheet" href="css/product.css">
    </head>
    <body>
         
          <div id="header">
                  <div>
                
              <h1>LOGIN TO THE LIBRARY</h1> 
            </div> 
                
                <ul id="navigation">
                   
                     
                    <li>
                        <a href="returnBook.html">Return Book</a>
                    </li>				
                    <li>
                        <a href="issueBook.html">Issue Book</a>
                    </li>
                    <li>
                        <a href="search Book.html">Search </a>
                    </li>
                    <li>
                        <a href="addBook.html">Add Book </a>
                    </li>
                </ul>
             
            </div> 
                
        <div id="result">
        
        
          <%
                     
                          
                   String username = request.getParameter("username");
                   String password = request.getParameter("password");
                  
                   if(username.isEmpty()){
                       out.println("user name is required");
                   }
                   if(password.isEmpty()){
                       out.println("password is required");
                   }
                   
                   try{
                   
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "");
                        Statement st = con.createStatement();
                        
                 ResultSet rs;
                 
                  rs =  st.executeQuery("select * from user where username='" + username + "' and password='" + password+ "'");
                   
                   
                  
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
                %>
                
        </div>  
           <div id="footer">
            <div>
                <p>
                    © Copyright - 2018. All rights reserved.
                </p>
            </div>
        </div>     
    </body>
</html>

    </body>
</html>
