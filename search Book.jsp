

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Book</title>
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
                    <li>
                        <a href="addBook.html">Add Book </a>
                    </li>
                </ul>
             
            </div> 
        
                
           
                    
<%
String book_id= request.getParameter("book_id");

String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "library";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

 <table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#f1b0b7">
<td><b>Book Id</b></td>
<td><b>Book Name</b></td>
<td><b>Edition</b></td>
<td><b>Publisher</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM book WHERE book_id = '"+book_id+"'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor=" #f5c6cb">

<td><%=resultSet.getString("book_id") %></td>
<td><%=resultSet.getString("book_name") %></td>
<td><%=resultSet.getString("edition") %></td>
<td><%=resultSet.getString("publisher") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
                 
           <div id="footer">
            <div>
                <p>
                    © Copyright - 2020. All rights reserved.
                </p>
            </div>
        </div>    
    </body>
</html>

