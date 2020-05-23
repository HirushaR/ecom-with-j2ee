<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org">

<head>
    <title>Sign in</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.min.css">
</head>

<body>

<div style="padding-top: 5rem"></div>
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
        <h2>Login for the Eshop</h2>
        <hr>
    </div>
</div>
<div class="container">
    <c:if test="${param.error}">
        <div class="alert alert-danger" role="alert" th:if="${param.error}">
            The email or password is incorrect!
        </div>
    </c:if>

    <form  action="<c:url value='/login'/>" method="post" >
<%--        <h1 class="h3 mb-3 font-weight-normal">Sign in</h1>--%>
<%--        <label for="inputEmail" class="sr-only">Email</label>--%>
<%--        <input type="email" id="email" name="email" class="form-control" placeholder="Email" required autofocus>--%>
<%--        <label for="inputPassword" class="sr-only">Password</label>--%>
<%--        <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>--%>
<%--        <div class="checkbox mb-3">--%>
<%--            <label>--%>
<%--                <input type="checkbox" name="remember-me" /> Remember me--%>
<%--            </label>--%>
<%--        </div>--%>


    <div class="row">
        <div class="col-md-3 field-label-responsive">
            <label for="email">Email</label>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-at"></i></div>
                    <input type="text" name="email" class="form-control" id="email"
                           placeholder="username@jackrutorial.com" required autofocus>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-md-3 field-label-responsive">
            <label for="password">Password</label>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-at"></i></div>
                    <input type="password" name="password" class="form-control" id="password"
                           placeholder="password" required autofocus>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3 field-label-responsive">
            <label for="password"></label>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon" style="width: 2.6rem"><i class="fa fa-at"></i></div>
                    <label>
                        <input type="checkbox" name="remember-me" /> Remember me
                    </label>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <button type="submit" class="btn btn-success"><i class="fa fa-user-plus"></i> Login</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <a href="/signup">Don't have an Account?Register Here</a>
        </div>
    </div>

    </form>
</div>
</body>
</html>
