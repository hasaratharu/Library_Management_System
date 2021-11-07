



<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD BOOK</title>
          <link rel="stylesheet" href="css/product.css">
    </head>
    <body>
         
         <div id="header">
                  <div>
                
              <h1>ADD BOOK TO THE LIBRARY</h1> 
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
                   
                </ul>
             
            </div> 
        
                
        <div id="result">
        
        
          <%
                    String book_id = request.getParameter("book_id");
                    String book_name = request.getParameter("book_name");
                    String edition = request.getParameter("edition");
                   String publisher = request.getParameter("publisher");
                   
                  
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "");
                        Statement st = con.createStatement();
                        
                    
                  int i=st.executeUpdate("insert into book(book_id,book_name ,edition,publisher) Values ('"+ book_id +"','"+ book_name +"','"+edition+"','"+publisher+"')");
                  
                  
                  if (i>0){
                          out.println("<h1>Record Add Successful</h1>");
                  }
                     else {
                          out.println("<h1>Error while Adding</h1>");
                        }
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
