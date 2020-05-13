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
<!-- /NAVIGATION -->

<!-- HOME -->
<div id="home">
    <!-- container -->
    <div class="container">
        <!-- home wrap -->
        <div class="home-wrap">
            <!-- home slick -->
            <div id="home-slick">
                <!-- banner -->
                <div class="banner banner-1">
                    <img src="<c:url value="/img/banner01.jpg"/>" alt="">
                    <div class="banner-caption text-center">
                        <h1>Bags sale</h1>
                        <h3 class="white-color font-weak">Up to 50% Discount</h3>
                        <button class="primary-btn">Shop Now</button>
                    </div>
                </div>
                <!-- /banner -->

                <!-- banner -->
                <div class="banner banner-1">
                    <img src="<c:url value="/img/banner02.jpg"/>" alt="">
                    <div class="banner-caption">
                        <h1 class="primary-color">HOT DEAL<br><span class="white-color font-weak">Up to 50% OFF</span></h1>
                        <button class="primary-btn">Shop Now</button>
                    </div>
                </div>
                <!-- /banner -->

                <!-- banner -->
                <div class="banner banner-1">
                    <img src="<c:url value="/img/banner03.jpg"/>" alt="">
                    <div class="banner-caption">
                        <h1 class="white-color">New Product <span>Collection</span></h1>
                        <button class="primary-btn">Shop Now</button>
                    </div>
                </div>
                <!-- /banner -->
            </div>
            <!-- /home slick -->
        </div>
        <!-- /home wrap -->
    </div>
    <!-- /container -->
</div>
<!-- /HOME -->



<!-- section -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- section-title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h2 class="title">Deals Of The Day</h2>
                    <div class="pull-right">
                        <div class="product-slick-dots-1 custom-dots"></div>
                    </div>
                </div>
            </div>
            <!-- /section-title -->

            <!-- banner -->
            <div class="col-md-3 col-sm-6 col-xs-6">
                <div class="banner banner-2">
                    <img src="<c:url value="/img/banner14.jpg"/>" alt="">
                    <div class="banner-caption">
                        <h2 class="white-color">NEW<br>COLLECTION</h2>
                        <button class="primary-btn">Shop Now</button>
                    </div>
                </div>
            </div>
            <!-- /banner -->

            <!-- Product Slick -->
            <div class="col-md-9 col-sm-6 col-xs-6">
                <div class="row">
                    <div id="product-slick-1" class="product-slick">
                        <!-- Product Single -->
                    <c:forEach items="${products}" var="product">
                        <div class="product product-single">
                            <div class="product-thumb">
                                <div class="product-label">
                                    <span>New</span>
                                    <span class="sale">-20%</span>
                                </div>
                                <ul class="product-countdown">
                                    <li><span>00 H</span></li>
                                    <li><span>00 M</span></li>
                                    <li><span>00 S</span></li>
                                </ul>
                                <button class="main-btn quick-view" onclick="window.location.replace('/viewproduct/${product.id}')"><i class="fa fa-search-plus"></i> Quick view</button>
                                <img src="<c:url value="/img/${product.image}"/>"  style="height:20rem;" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-price">${product.price/100*80} <del class="product-old-price">${product.price}</del></h3>
                                <div class="product-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o empty"></i>
                                </div>
                                <h2 class="product-name"><a href="<c:url value="/product/${product.id}"></c:url>">${product.name}</a></h2>
                                <div class="product-btns">
                                    <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
                                    <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
                                    <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                        <!-- /Product Single -->


                        <!-- /Product Single -->
                    </div>
                </div>
            </div>
            <!-- /Product Slick -->
        </div>
        <!-- /row -->

        <!-- section -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- banner -->
                    <div class="col-md-4 col-sm-6">
                        <a class="banner banner-1" href="#">
                            <img src="<c:url value="/img/banner10.jpg"/>" alt="">
                            <div class="banner-caption text-center">
                                <h2 class="white-color">NEW COLLECTION</h2>
                            </div>
                        </a>
                    </div>
                    <!-- /banner -->

                    <!-- banner -->
                    <div class="col-md-4 col-sm-6">
                        <a class="banner banner-1" href="#">
                            <img src="<c:url value="/img/banner11.jpg"/>" alt="">
                            <div class="banner-caption text-center">
                                <h2 class="white-color">NEW COLLECTION</h2>
                            </div>
                        </a>
                    </div>
                    <!-- /banner -->

                    <!-- banner -->
                    <div class="col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-3">
                        <a class="banner banner-1" href="#">
                            <img src="<c:url value="/img/banner12.jpg"/>" alt="">
                            <div class="banner-caption text-center">
                                <h2 class="white-color">NEW COLLECTION</h2>
                            </div>
                        </a>
                    </div>
                    <!-- /banner -->

                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /section -->



        <div class="row">
            <!-- banner -->
            <div class="col-md-3 col-sm-6 col-xs-6">
                <div class="banner banner-2">
                    <img src="/img/banner13.jpg" alt="">
                    <div class="banner-caption">
                        <h2 class="white-color">NEW<br>COLLECTION</h2>
                        <button class="primary-btn">Shop Now</button>
                    </div>
                </div>
            </div>
            <!-- /banner -->
        <c:forEach items="${phones}" var="phone">
            <!-- Product Single -->
            <div class="col-md-3 col-sm-6 col-xs-6">
                <div class="product product-single">
                    <div class="product-thumb">
                        <div class="product-label">
                            <span>New</span>
                            <span class="sale">-20%</span>
                        </div>
                        <button class="main-btn quick-view" onclick="window.location.replace('/viewproduct/${phone.id}')"><i class="fa fa-search-plus"></i> Quick view</button>
                        <img src="./img/${phone.image}" alt="">
                    </div>
                    <div class="product-body">
                        <h3 class="product-price">${phone.price*20/100} <del class="product-old-price">${phone.price}</del></h3>
                        <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o empty"></i>
                        </div>
                        <h2 class="product-name"><a href="#">${phone.name}</a></h2>
                        <div class="product-btns">
                            <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
                            <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
                            <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Product Single -->
        </c:forEach>
        </div>
        <div class="row">
            <!-- banner -->
            <div class="col-md-3 col-sm-6 col-xs-6">
                <div class="banner banner-2">
                    <img src="/img/banner13.jpg" alt="">
                    <div class="banner-caption">
                        <h2 class="white-color">NEW<br>COLLECTION</h2>
                        <button class="primary-btn">Shop Now</button>
                    </div>
                </div>
            </div>
            <!-- /banner -->
            <c:forEach items="${laptops}" var="laptop">
                <!-- Product Single -->
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="product product-single">
                        <div class="product-thumb">
                            <div class="product-label">
                                <span>New</span>
                                <span class="sale">-20%</span>
                            </div>
                            <button class="main-btn quick-view" onclick="window.location.replace('/viewproduct/${laptop.id}')" ><i class="fa fa-search-plus"></i> Quick view</button>
                            <img src="./img/${laptop.image}" alt="">
                        </div>
                        <div class="product-body">
                            <h3 class="product-price">${laptop.price*20/100} <del class="product-old-price">${laptop.price}</del></h3>
                            <div class="product-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o empty"></i>
                            </div>
                            <h2 class="product-name"><a href="#">${laptop.name}</a></h2>
                            <div class="product-btns">
                                <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
                                <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
                                <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Product Single -->
            </c:forEach>
        </div>
        <div class="row">
            <!-- banner -->
            <div class="col-md-3 col-sm-6 col-xs-6">
                <div class="banner banner-2">
                    <img src="/img/banner13.jpg" alt="">
                    <div class="banner-caption">
                        <h2 class="white-color">NEW<br>COLLECTION</h2>
                        <button class="primary-btn">Shop Now</button>
                    </div>
                </div>
            </div>
            <!-- /banner -->
            <c:forEach items="${ards}" var="ard">
                <!-- Product Single -->
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="product product-single">
                        <div class="product-thumb">
                            <div class="product-label">
                                <span>New</span>
                                <span class="sale">-20%</span>
                            </div>
                            <button class="main-btn quick-view" onclick="window.location.replace('/viewproduct/${ard.id}')"><i class="fa fa-search-plus"></i> Quick view</button>
                            <img src="./img/${ard.image}" alt="">
                        </div>
                        <div class="product-body">
                            <h3 class="product-price">${ard.price*20/100} <del class="product-old-price">${ard.price}</del></h3>
                            <div class="product-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o empty"></i>
                            </div>
                            <h2 class="product-name"><a href="#">${ard.name}</a></h2>
                            <div class="product-btns">
                                <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
                                <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
                                <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Product Single -->
            </c:forEach>
        </div>
    </div>
    <!-- /container -->
</div>
<!-- /section -->

<!-- section -->
<div class="section section-grey">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- banner -->
            <div class="col-md-8">
                <div class="banner banner-1">
                    <img src="<c:url value="/img/banner13.jpg"/>" alt="">
                    <div class="banner-caption text-center">
                        <h1 class="primary-color">HOT DEAL<br><span class="white-color font-weak">Up to 50% OFF</span></h1>
                        <button class="primary-btn">Shop Now</button>
                    </div>
                </div>
            </div>
            <!-- /banner -->

            <!-- banner -->
            <div class="col-md-4 col-sm-6">
                <a class="banner banner-1" href="#">
                    <img src="<c:url value="/img/banner11.jpg"/>"  alt="">
                    <div class="banner-caption text-center">
                        <h2 class="white-color">NEW COLLECTION</h2>
                    </div>
                </a>
            </div>
            <!-- /banner -->

            <!-- banner -->
            <div class="col-md-4 col-sm-6">
                <a class="banner banner-1" href="#">
                    <img src="<c:url value="/img/banner12.jpg"/>"  alt="">
                    <div class="banner-caption text-center">
                        <h2 class="white-color">NEW COLLECTION</h2>
                    </div>
                </a>
            </div>
            <!-- /banner -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /section -->

<!-- section -->
<%--<div class="section">--%>
<%--    <!-- container -->--%>
<%--    <div class="container">--%>
<%--        <!-- row -->--%>
<%--        <div class="row">--%>
<%--            <!-- section title -->--%>
<%--            <div class="col-md-12">--%>
<%--                <div class="section-title">--%>
<%--                    <h2 class="title">Latest Products</h2>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- section title -->--%>

<%--            <!-- Product Single -->--%>
<%--            <div class="col-md-3 col-sm-6 col-xs-6">--%>
<%--                <div class="product product-single">--%>
<%--                    <div class="product-thumb">--%>
<%--                        <button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>--%>
<%--                        <img src="<c:url value="/img/product01.jpg"/>"  alt="">--%>
<%--                    </div>--%>
<%--                    <div class="product-body">--%>
<%--                        <h3 class="product-price">$32.50</h3>--%>
<%--                        <div class="product-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star-o empty"></i>--%>
<%--                        </div>--%>
<%--                        <h2 class="product-name"><a href="#">hand bag</a></h2>--%>
<%--                        <div class="product-btns">--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>--%>
<%--                            <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- /Product Single -->--%>

<%--            <!-- Product Single -->--%>
<%--            <div class="col-md-3 col-sm-6 col-xs-6">--%>
<%--                <div class="product product-single">--%>
<%--                    <div class="product-thumb">--%>
<%--                        <div class="product-label">--%>
<%--                            <span>New</span>--%>
<%--                            <span class="sale">-20%</span>--%>
<%--                        </div>--%>
<%--                        <button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>--%>
<%--                        <img src="<c:url value="/img/product02.jpg"/>" alt="">--%>
<%--                    </div>--%>
<%--                    <div class="product-body">--%>
<%--                        <h3 class="product-price">$32.50 <del class="product-old-price">$45.00</del></h3>--%>
<%--                        <div class="product-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star-o empty"></i>--%>
<%--                        </div>--%>
<%--                        <h2 class="product-name"><a href="#">mens watch</a></h2>--%>
<%--                        <div class="product-btns">--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>--%>
<%--                            <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- /Product Single -->--%>

<%--            <!-- Product Single -->--%>
<%--            <div class="col-md-3 col-sm-6 col-xs-6">--%>
<%--                <div class="product product-single">--%>
<%--                    <div class="product-thumb">--%>
<%--                        <div class="product-label">--%>
<%--                            <span>New</span>--%>
<%--                            <span class="sale">-20%</span>--%>
<%--                        </div>--%>
<%--                        <button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>--%>
<%--                        <img src="<c:url value="/img/product03.jpg"/>" alt="">--%>
<%--                    </div>--%>
<%--                    <div class="product-body">--%>
<%--                        <h3 class="product-price">$32.50 <del class="product-old-price">$45.00</del></h3>--%>
<%--                        <div class="product-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star-o empty"></i>--%>
<%--                        </div>--%>
<%--                        <h2 class="product-name"><a href="#">mens wallet</a></h2>--%>
<%--                        <div class="product-btns">--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>--%>
<%--                            <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- /Product Single -->--%>

<%--            <!-- Product Single -->--%>
<%--            <div class="col-md-3 col-sm-6 col-xs-6">--%>
<%--                <div class="product product-single">--%>
<%--                    <div class="product-thumb">--%>
<%--                        <div class="product-label">--%>
<%--                            <span>New</span>--%>
<%--                        </div>--%>
<%--                        <button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>--%>
<%--                        <img src="<c:url value="/img/product04.jpg"/>" alt="">--%>
<%--                    </div>--%>
<%--                    <div class="product-body">--%>
<%--                        <h3 class="product-price">$32.50</h3>--%>
<%--                        <div class="product-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star-o empty"></i>--%>
<%--                        </div>--%>
<%--                        <h2 class="product-name"><a href="#">mens shoe</a></h2>--%>
<%--                        <div class="product-btns">--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>--%>
<%--                            <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- /Product Single -->--%>
<%--        </div>--%>
<%--        <!-- /row -->--%>

<%--        <!-- row -->--%>
<%--        <div class="row">--%>
<%--            <!-- banner -->--%>
<%--            <div class="col-md-3 col-sm-6 col-xs-6">--%>
<%--                <div class="banner banner-2">--%>
<%--                    <img src="<c:url value="/img/banner15.jpg"/>" alt="">--%>
<%--                    <div class="banner-caption">--%>
<%--                        <h2 class="white-color">NEW<br>COLLECTION</h2>--%>
<%--                        <button class="primary-btn">Shop Now</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- /banner -->--%>

<%--            <!-- Product Single -->--%>
<%--            <div class="col-md-3 col-sm-6 col-xs-6">--%>
<%--                <div class="product product-single">--%>
<%--                    <div class="product-thumb">--%>
<%--                        <div class="product-label">--%>
<%--                            <span>New</span>--%>
<%--                            <span class="sale">-20%</span>--%>
<%--                        </div>--%>
<%--                        <button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>--%>
<%--                        <img src="<c:url value="/img/product07.jpg"/>" alt="">--%>
<%--                    </div>--%>
<%--                    <div class="product-body">--%>
<%--                        <h3 class="product-price">$32.50 <del class="product-old-price">$45.00</del></h3>--%>
<%--                        <div class="product-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star-o empty"></i>--%>
<%--                        </div>--%>
<%--                        <h2 class="product-name"><a href="#">ladies hand bag</a></h2>--%>
<%--                        <div class="product-btns">--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>--%>
<%--                            <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- /Product Single -->--%>

<%--            <!-- Product Single -->--%>
<%--            <div class="col-md-3 col-sm-6 col-xs-6">--%>
<%--                <div class="product product-single">--%>
<%--                    <div class="product-thumb">--%>
<%--                        <div class="product-label">--%>
<%--                            <span>New</span>--%>
<%--                            <span class="sale">-20%</span>--%>
<%--                        </div>--%>
<%--                        <button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>--%>
<%--                        <img src="<c:url value="/img/product06.jpg"/>" alt="">--%>
<%--                    </div>--%>
<%--                    <div class="product-body">--%>
<%--                        <h3 class="product-price">$32.50 <del class="product-old-price">$45.00</del></h3>--%>
<%--                        <div class="product-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star-o empty"></i>--%>
<%--                        </div>--%>
<%--                        <h2 class="product-name"><a href="#">side bag</a></h2>--%>
<%--                        <div class="product-btns">--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>--%>
<%--                            <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- /Product Single -->--%>

<%--            <!-- Product Single -->--%>
<%--            <div class="col-md-3 col-sm-6 col-xs-6">--%>
<%--                <div class="product product-single">--%>
<%--                    <div class="product-thumb">--%>
<%--                        <div class="product-label">--%>
<%--                            <span>New</span>--%>
<%--                            <span class="sale">-20%</span>--%>
<%--                        </div>--%>
<%--                        <button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>--%>
<%--                        <img src="<c:url value="/img/product05.jpg"/>" alt="">--%>
<%--                    </div>--%>
<%--                    <div class="product-body">--%>
<%--                        <h3 class="product-price">$32.50 <del class="product-old-price">$45.00</del></h3>--%>
<%--                        <div class="product-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star-o empty"></i>--%>
<%--                        </div>--%>
<%--                        <h2 class="product-name"><a href="#">ladies shoe</a></h2>--%>
<%--                        <div class="product-btns">--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>--%>
<%--                            <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- /Product Single -->--%>
<%--        </div>--%>
<%--        <!-- /row -->--%>

<%--        <!-- row -->--%>
<%--        <div class="row">--%>
<%--            <!-- section title -->--%>
<%--            <div class="col-md-12">--%>
<%--                <div class="section-title">--%>
<%--                    <h2 class="title">Picked For You</h2>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- section title -->--%>

<%--            <!-- Product Single -->--%>
<%--            <div class="col-md-3 col-sm-6 col-xs-6">--%>
<%--                <div class="product product-single">--%>
<%--                    <div class="product-thumb">--%>
<%--                        <button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>--%>
<%--                        <img src="<c:url value="/img/product04.jpg"/>" alt="">--%>
<%--                    </div>--%>
<%--                    <div class="product-body">--%>
<%--                        <h3 class="product-price">$32.50</h3>--%>
<%--                        <div class="product-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star-o empty"></i>--%>
<%--                        </div>--%>
<%--                        <h2 class="product-name"><a href="#">mens shoe</a></h2>--%>
<%--                        <div class="product-btns">--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>--%>
<%--                            <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- /Product Single -->--%>

<%--            <!-- Product Single -->--%>
<%--            <div class="col-md-3 col-sm-6 col-xs-6">--%>
<%--                <div class="product product-single">--%>
<%--                    <div class="product-thumb">--%>
<%--                        <div class="product-label">--%>
<%--                            <span>New</span>--%>
<%--                        </div>--%>
<%--                        <button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>--%>
<%--                        <img src="<c:url value="/img/product03.jpg"/>" alt="">--%>
<%--                    </div>--%>
<%--                    <div class="product-body">--%>
<%--                        <h3 class="product-price">$32.50</h3>--%>
<%--                        <div class="product-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star-o empty"></i>--%>
<%--                        </div>--%>
<%--                        <h2 class="product-name"><a href="#">mens wallet</a></h2>--%>
<%--                        <div class="product-btns">--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>--%>
<%--                            <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- /Product Single -->--%>

<%--            <!-- Product Single -->--%>
<%--            <div class="col-md-3 col-sm-6 col-xs-6">--%>
<%--                <div class="product product-single">--%>
<%--                    <div class="product-thumb">--%>
<%--                        <div class="product-label">--%>
<%--                            <span class="sale">-20%</span>--%>
<%--                        </div>--%>
<%--                        <button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>--%>
<%--                        <img src="<c:url value="/img/product02.jpg"/>" alt="">--%>
<%--                    </div>--%>
<%--                    <div class="product-body">--%>
<%--                        <h3 class="product-price">$32.50 <del class="product-old-price">$45.00</del></h3>--%>
<%--                        <div class="product-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star-o empty"></i>--%>
<%--                        </div>--%>
<%--                        <h2 class="product-name"><a href="#">mens watch</a></h2>--%>
<%--                        <div class="product-btns">--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>--%>
<%--                            <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- /Product Single -->--%>

<%--            <!-- Product Single -->--%>
<%--            <div class="col-md-3 col-sm-6 col-xs-6">--%>
<%--                <div class="product product-single">--%>
<%--                    <div class="product-thumb">--%>
<%--                        <div class="product-label">--%>
<%--                            <span>New</span>--%>
<%--                            <span class="sale">-20%</span>--%>
<%--                        </div>--%>
<%--                        <button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>--%>
<%--                        <img src="<c:url value="/img/product01.jpg"/>" alt="">--%>
<%--                    </div>--%>
<%--                    <div class="product-body">--%>
<%--                        <h3 class="product-price">$32.50 <del class="product-old-price">$45.00</del></h3>--%>
<%--                        <div class="product-rating">--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star"></i>--%>
<%--                            <i class="fa fa-star-o empty"></i>--%>
<%--                        </div>--%>
<%--                        <h2 class="product-name"><a href="#">hand bag</a></h2>--%>
<%--                        <div class="product-btns">--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>--%>
<%--                            <button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>--%>
<%--                            <button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- /Product Single -->--%>
<%--        </div>--%>
<%--        <!-- /row -->--%>
<%--    </div>--%>
<%--    <!-- /container -->--%>
<%--</div>--%>
<!-- /section -->

<!-- FOOTER -->
<%@include file="template/footer.jsp"%>
</body>

</html>
