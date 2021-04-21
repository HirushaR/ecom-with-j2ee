<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml"
	  xmlns:th="http://www.thymeleaf.org">
<head>
	<title>Sign up</title>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.min.css">
</head>
<body>
<div class="container">
	<div style="padding-top: 20px"></div>
<%--	<form class="form-horizontal" role="form" method="POST" th:action="@{/signup}" th:object="${user}">--%>
		<form name="formLogin" action="/signup" method="POST" th:object="${user}">
			<div th:if="${param.error}" class="alert alert-dismissible alert-danger">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				Sign in Error
			</div>

			<div class="form-group">

				<input id="txtUsername" name="username" th:field="*{username}" type="text" class="form-control" autofocus="autofocus"/>
			</div>
			<div class="form-group">
				<label for="txtfirstname">First Name</label>

				<input id="txtfirstname" name="firstname" type="text" th:field="*{firstname}" class="form-control" autofocus="autofocus"/>
			</div>
			<div class="form-group">
				<label for="txtlastname">Last Name</label>

				<input id="txtlastname" name="lastname" type="text" th:field="*{lastname}" class="form-control" autofocus="autofocus"/>
			</div>
			<div class="form-group">
				<label for="txtemail">Email</label>

				<input id="txtemail" name="email" type="text" class="form-control" th:field="*{email}" autofocus="autofocus"/>
			</div>


			<div class="form-group">
				<label for="txtPassword">Password</label>
				<input id="txtPassword" name="password" type="password" th:field="*{password}" class="form-control"/>
			</div>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<button type="submit" class="btn btn-success"><i class="fa fa-user-plus"></i> Register</button>
			</div>
		</div>
		<a href="/login">Already an User?Login Here!</a>
	</form>
</div>
</body>
</html>
