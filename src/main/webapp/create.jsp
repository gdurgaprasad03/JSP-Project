<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Employee Table</title>
</head>
<body>
 	<h2>Create Employee Table</h2>
 
 	<!-- Form with button to trigger table creation -->
 	<form method="post">
      	<button type="submit" name="createTable" value="true">Create
           	Table</button>
 	</form>
 
 	<c:if test="${param.createTable == 'true'}">
      	<!-- Set up data source -->
      	<sql:setDataSource var="dbSource" driver="com.mysql.cj.jdbc.Driver"
      	 	url="jdbc:mysql://localhost:3306/ jsp" user="root"
           	password="root" />
 
      	<!-- Create table operation -->
      	<c:catch var="error">
           	<sql:update dataSource="${dbSource}" var="rowCount">
            	CREATE TABLE emp1 (
                	ENO INT(5) PRIMARY KEY,
                	ENAME CHAR(10),
                	ESAL FLOAT,
                	EADDR CHAR(10)
            	)
        	</sql:update>
      	</c:catch>
 
      	<!-- Display success or error message -->
      	<c:choose>
           	<c:when test="${not empty error}">
                 	<h1 style="color: red;">
                      	Table Creation Failure:
                      	<c:out value="${error}" />
                 	</h1>
           	</c:when>
           	<c:when test="${rowCount == 0}">
                 	<h1>Table Created Successfully</h1>
           	</c:when>
           	<c:otherwise>
                 	<h1>Unknown Error Occurred</h1>
           	</c:otherwise>
      	</c:choose>
 	</c:if>
</body>
</html>
    