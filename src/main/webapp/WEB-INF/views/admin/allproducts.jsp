<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Danuja Fernando
  Date: 5/6/2020
  Time: 2:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>E-CORNER</title>


    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"> </c:url> " />

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/css/slick.css" > </c:url>" />
    <link type="text/css" rel="stylesheet" href="<c:url value="/css/slick-theme.css" > </c:url>"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/css/nouislider.min.css" > </c:url>"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css"> </c:url> "/>

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="<c:url value="/css/style.css" > </c:url> "/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <%
        int tot = 0;
    %>

</head>

<body>
<!-- HEADER -->
<%@include file="../template/header.jsp"%>


<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="order-summary clearfix">
                    <div class="section-title">
                        <h3 class="title">Order Review</h3>
                    </div>
                    <table class="shopping-cart-table table">
                        <thead>
                        <tr>
                            <th>Product</th>
                            <th></th>
                            <th class="text-center">Price</th>
                            <th class="text-center">Quantity</th>
                            <th class="text-center">Category</th>
                            <th class="text-right"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="tot" scope="application" value="${0}"></c:set>


                        <c:forEach items="${products}" var="product" varStatus="loop">

                            <tr>
                                <td class="thumb"><img src="/img/${product.image}" alt=""></td>
                                <td class="details">
                                    <a href="#">${product.name}</a>
                                    <ul>
                                        <li><span>Size: XL</span></li>
                                        <li><span>Color: Camelot</span></li>
                                    </ul>
                                </td>
                                <td class="price text-center"><strong>${product.price}</strong><br><del class="font-weak"><small>${product.price}</small></del></td>
                                <td class="total text-center">${product.quantity}</td>
                                <td class="total text-center"><strong class="primary-color">${ product.category.name}</strong></td>
                                <c:set var="tot" scope="application" value="${loop.count}" />
                                <td class="text-right"><button class="main-btn icon-btn"><i class="fa fa-close"></i></button></td>
                            </tr>
                        </c:forEach>

                        </tbody>
                        <tfoot>
                        <tr>
                            <th class="empty" colspan="3"></th>
                            <th>TOTAL PRODCUTS</th>
                            <th colspan="2" class="total"><c:out value="${tot}"/></th>
                        </tr>
                        </tfoot>
                    </table>


                </div>

            </div>
        </div>
    </div>
</div>

<%@include file="../template/footer.jsp"%>
</body>

</html>
