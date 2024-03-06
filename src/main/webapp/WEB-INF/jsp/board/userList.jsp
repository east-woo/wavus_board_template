<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>
</head>
<body>
<h2>User List</h2>
<table border="1">
    <tr>
        <th>User ID</th>
        <th>Username</th>
        <th>Email</th>
    </tr>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.userId}</td>
            <td>${user.username}</td>
            <td>${user.email}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>