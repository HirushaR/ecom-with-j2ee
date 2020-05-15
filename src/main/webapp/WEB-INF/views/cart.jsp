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

</head>

<body>
<!-- HEADER -->
<%@include file="template/header.jsp"%>


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
                            <th class="text-center">Total</th>
                            <th class="text-right"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${carts}" var="cart">

                        <tr>
                            <td class="thumb"><img src="/img/${cart.image}" alt=""></td>
                            <td class="details">
                                <a href="#">${cart.name}</a>
                                <ul>
                                    <li><span>Size: XL</span></li>
                                    <li><span>Color: Camelot</span></li>
                                </ul>
                            </td>
                            <td class="price text-center"><strong>${cart.price}</strong><br><del class="font-weak"><small>${cart.price}</small></del></td>
                            <td class="qty text-center"><input class="input" type="number" value="1"></td>
                            <td class="total text-center"><strong class="primary-color">$32.50</strong></td>
                            <td class="text-right"><button class="main-btn icon-btn"><i class="fa fa-close"></i></button></td>
                        </tr>
                        </c:forEach>

                        </tbody>
                        <tfoot>
                        <tr>
                            <th class="empty" colspan="3"></th>
                            <th>SUBTOTAL</th>
                            <th colspan="2" class="sub-total">$97.50</th>
                        </tr>
                        <tr>
                            <th class="empty" colspan="3"></th>
                            <th>SHIPING</th>
                            <td colspan="2">Free Shipping</td>
                        </tr>
                        <tr>
                            <th class="empty" colspan="3"></th>
                            <th>TOTAL</th>
                            <th colspan="2" class="total">$97.50</th>
                        </tr>
                        </tfoot>
                    </table>
                    <div class="pull-right">
                        <button class="primary-btn">Place Order</button>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<%@include file="template/footer.jsp"%>
</body>

</html>
