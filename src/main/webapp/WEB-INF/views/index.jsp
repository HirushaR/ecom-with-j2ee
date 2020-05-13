<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>title</head>
<body>
<c:choose>
    <c:when test="${mode=='MODE_ALL'}">
        <h1> this is Welcome page</h1>

    </c:when>
    <c:when test="${mode=='MODE_USER'}">
        <h1> this is USER page</h1>

    </c:when>
    <c:when test="${mode=='MODE_ADMIN'}">
        <h1> this is ADMIN page</h1>

    </c:when>
</c:choose>
</body>
</html>
