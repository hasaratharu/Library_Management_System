



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
                
              <h1>ADD BOOK TO THE LIBRARY</h1> 
            </div> 
                
                <ul id="navigation">
                   
                      <li>
                        <a href="login.html">Login</a>
                    </li>
                   
                </ul>
             
            </div> 
        
                
        <div id="result">
        
        
          <%
                    String firstname = request.getParameter("firstname");
                    String lastname = request.getParameter("lastname");
                    String nic = request.getParameter("nic");
                   String contact = request.getParameter("contact");
                   String username = request.getParameter("username");
                   String password = request.getParameter("password");
                  
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "");
                        Statement st = con.createStatement();
                        
                    
                  int i=st.executeUpdate("insert into user(firstname,lastname,nic,contact,username,password) Values ('"+firstname +"','"+lastname +"','"+nic+"','"+contact+"','"+username+"','"+password+"')");
                  
                  
                  if (i>0){
                          out.println("<h1>Registered Successful</h1>");
                  }
                     else {
                          out.println("<h1>Error while Registering</h1>");
                        }
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
                %>
                
        </div>  
           <div id="footer">
            <div>
                <p>
                    © Copyright - 2020. All rights reserved.
                </p>
            </div>
        </div>     
    </body>
</html>
