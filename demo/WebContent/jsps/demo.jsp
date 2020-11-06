<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>	        
	        <html>
	        <head>
	        <title>Speak To Me, Please</title>
	        </head>
	        <body>
	        
	        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
	         url = "jdbc:mysql://localhost:3306/sample?serverTimezone=Australia/Sydney"
	         user = "root"  password = "rootadmin"/>
	
	        <h1>Speak To Me, Please</h1>
	
	        Welcome to the Acme Corp. feedback site. 
	         
	        <h2>Here's what your fellow workers have said:</h2> 
	        <table border='1'>
	          <tr><th>Worker</th><th>Comment</th></tr>
		
	       <sql:query dataSource="${snapshot}" var="qryPosts" >
	                  SELECT * FROM sample.POSTS;
	       </sql:query>
	       
	
	       <c:forEach var="row" items="${qryPosts.rows}">
		        <tr>
	               <td><c:out value="${row.POSTNAME}" /></td>
	                  <td><c:out value="${row.COMMENTS}" /></td>
		        </tr>
	          </c:forEach>
	        </table>
	
	        </body>
	        </html>