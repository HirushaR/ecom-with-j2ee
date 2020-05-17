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
<html>
<head>
    <title>Bootstrap - Input multiple tags example using Tag Manager Jquery Plugin</title>
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


    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/tagmanager/3.0.2/tagmanager.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tagmanager/3.0.2/tagmanager.min.js"></script>
</head>
<body>

<%@include file="template/header.jsp"%>

<%--<form id="checkout-form" class="clearfix">--%>
<%--    <div class="form-group">--%>
<%--        <label>Name:</label>--%>
<%--        <input type="text" name="name" class="form-control" >--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <label>Add Tags:</label><br/>--%>
<%--        <input type="text" name="tags" placeholder="Tags" class="tm-input form-control tm-input-info"/>--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <label>Details:</label>--%>
<%--        <textarea class="form-control"></textarea>--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <button class="btn btn-success">Submit</button>--%>
<%--    </div>--%>
<%--</form>--%>

<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <form id="checkout-form" class="clearfix" method="post" action="/createproduct">
                <div class="col-md-6">
                    <div class="billing-details" id="userprofile">
                        <div class="section-title">
                            <h3 class="title">Billing Details</h3>
                        </div>
                        <div class="form-group">
                            <input class="input" type="text" name="name" placeholder="title">
                        </div>
                        <div class="form-group">
                            <textarea class="text-area" name="description" rows="4" cols="50">
                                Add Description
                            </textarea>
                        </div>
                        <div class="form-group">
                            <textarea class="text-area" name="details" rows="4" cols="50">
                                Add details
                            </textarea>
                        </div>
                        <div class="form-group">
                            <label for="cars">Choose a car:</label>
                            <select id="cars" name="category">
                                <c:forEach items="${products}" var="product">
                                    <option value="${product.category}">${product.category}</option>
                                </c:forEach>


                            </select>
                        </div>
                        <div class="form-group">
                            <input class="input" type="file" name="image" placeholder="image">
                        </div>
                        <div class="form-group">
                            <input class="input" type="number" name="price" placeholder="price">
                        </div>
                        <div class="form-group">
                            <input class="input" type="number" name="quantity" placeholder="quantity">
                        </div>
                        <div class="form-group">
                            <div class="form-group">
                                <label>Add Tags:</label><br/>
                                <input type="text" name="tags" placeholder="Tags" class="tm-input form-control tm-input-info"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <input class="btn btn-sm" type="submit" name="submit" value="Submit">
                        </div>
                    </div>

                </div>
            </form>

                <div class="col-md-6">
                    <div class="shiping-methods">
                        <div class="section-title">
                            <h4 class="title">Shiping Methods</h4>
                        </div>
                        <div class="input-checkbox">
                            <input type="radio" name="shipping" id="shipping-1" checked>
                            <label for="shipping-1">Free Shiping -  $0.00</label>
                            <div class="caption">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                <p>
                            </div>
                        </div>
                        <div class="input-checkbox">
                            <input type="radio" name="shipping" id="shipping-2">
                            <label for="shipping-2">Standard - $4.00</label>
                            <div class="caption">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                <p>
                            </div>
                        </div>
                    </div>

                    <div class="payments-methods">
                        <div class="section-title">
                            <h4 class="title">Payments Methods</h4>
                        </div>
                        <div class="input-checkbox">
                            <input type="radio" name="payments" id="payments-1" checked>
                            <label for="payments-1">Direct Bank Transfer</label>
                            <div class="caption">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                <p>
                            </div>
                        </div>
                        <div class="input-checkbox">
                            <input type="radio" name="payments" id="payments-2">
                            <label for="payments-2">Cheque Payment</label>
                            <div class="caption">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                <p>
                            </div>
                        </div>
                        <div class="input-checkbox">
                            <input type="radio" name="payments" id="payments-3">
                            <label for="payments-3">Paypal System</label>
                            <div class="caption">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                <p>
                            </div>
                        </div>
                    </div>
                </div>


        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>


<script type="text/javascript">
    $(".tm-input").tagsManager();
</script>

<%@include file="template/footer.jsp"%>
</body>
</html>
