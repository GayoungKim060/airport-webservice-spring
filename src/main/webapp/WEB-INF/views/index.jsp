<%@ page language="java" contentType="text/html; charset=UTF-8"
         isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Spring - Hello World</title>
</head>
<body>

<h2>Hello World!</h2>

<p> The time on the server is ${serverTime}.</p>
<img src="img/logo_seagull.png" class="logo-seagull"/>

<p> <a href="airline/list">Move to Airport Panel </a> </p>

<%--<jsp:forward page="airline/list" />--%>
</body>
</html>