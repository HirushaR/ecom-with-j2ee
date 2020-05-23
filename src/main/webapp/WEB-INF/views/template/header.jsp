<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.example.eshop.repository.UserRepository" %>
<%@ page import="com.example.eshop.controller.HomeController" %>
<%@ page import="com.example.eshop.model.CartProduct" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Danuja Fernando
  Date: 5/6/2020
  Time: 5:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <!-- top Header -->

    <!-- /top Header -->

    <!-- header -->
    <div id="header">
        <div class="container">
            <div class="pull-left">
                <!-- Logo -->
                <div class="header-logo">
                    <a class="logo" href="<c:url value="/home" />">
                        <img src="<c:url value="/img/logo.png" />" alt="">
                    </a>
                </div>
                <!-- /Logo -->

                <!-- Search -->

                <!-- /Search -->
            </div>
            <div class="pull-right">
                <ul class="header-btns">
                    <!-- Account -->
                    <li class="header-account dropdown default-dropdown">
                        <div class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="true">
                            <div class="header-btns-icon">
                                <i class="fa fa-user-o"></i>
                            </div>
                            <strong class="text-uppercase">My Account <i class="fa fa-caret-down"></i></strong>
                        </div>
                        <a href="/profile/${user.id}" class="text-uppercase">${user.firstname}</a>
                        <ul class="custom-menu">
                            <c:if test="${roles.equals('USER')}">
                                <li><a href="/profile/${user.id}"><i class="fa fa-user-o"></i> My Account</a></li>
                            </c:if>
                            <c:if test="${roles.equals('SELLER')}">
                                <li><a href="/profile/${user.id}"><i class="fa fa-user-o"></i> My  Account</a></li>
                                <li><a href="/seller/addproduct"><i class="fa fa-user-o"></i> Add Product </a></li>
                            </c:if>
                            <c:if test="${roles.equals('ADMIN')}">
                                <li><a href="/profile/${user.id}"><i class="fa fa-user-o"></i> My  Account</a></li>
                                <li><a href="/seller/addproduct"><i class="fa fa-user-o"></i> Add Product </a></li>
                                <li><a href="/admin/allUser"><i class="fa fa-user-o"></i> See All User </a></li>
                                <li><a href="/admin/allProduct"><i class="fa fa-user-o"></i> See All Product </a></li>
                            </c:if>

                            <li><a href="/cart"><i class="fa fa-check"></i> Cart</a></li>
                            <li><a href="/logout">Log Out</a></a></li>
                        </ul>
                    </li>
                    <c:set var="tot" scope="application" value="${0}"></c:set>
                    <c:set var="count" scope="application" value="${0}"></c:set>

                    <c:forEach items="${carts}" var="cart" varStatus="loop">
                        <c:set var="tot" scope="application" value="${tot + cart.product.price * cart.quantity}" />
                        <c:set var="count" scope="application" value="${loop.count  }"></c:set>
                    </c:forEach>
                    <li class="header-cart dropdown default-dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                            <div class="header-btns-icon">
                                <i class="fa fa-shopping-cart"></i>
                                <span class="qty"><c:out value="${count}"/></span>
                            </div>

                            <strong class="text-uppercase">My Cart:</strong>
                            <br>
                            <span><c:out value="${tot}"/></span>
                        </a>
                        <div class="custom-menu">
                            <div id="shopping-cart">
                                <div class="shopping-cart-list">
                                    <c:forEach items="${carts}" var="cart" varStatus="loop">
                                        <div class="product product-widget">
                                            <div class="product-thumb">
                                                <img src="/img/${cart.product.image}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-price">${cart.product.price} <span class="qty">x${cart.product.quantity}</span></h3>
                                                <h2 class="product-name"><a href="">${cart.product.name}</a></h2>
                                            </div>

                                        </div>
                                    </c:forEach>


                                </div>
                                <div class="shopping-cart-btns">
                                    <button class="main-btn" onclick="window.location.replace('/cart')">View Cart</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <!-- /Cart -->

                    <!-- Mobile nav toggle-->
                    <li class="nav-toggle">
                        <button class="nav-toggle-btn main-btn icon-btn"><i class="fa fa-bars"></i></button>
                    </li>
                    <!-- / Mobile nav toggle -->
                </ul>
            </div>
        </div>
        <!-- header -->
    </div>
    <!-- container -->
</header>
<!-- /HEADER -->

<!-- NAVIGATION -->
<div id="navigation">
    <!-- container -->
    <div class="container">
        <div id="responsive-nav">
            <!-- category nav -->
            <div class="category-nav show-on-click">
                <span class="category-header">Categories <i class="fa fa-list"></i></span>
                <ul class="category-list">
                    <c:forEach items="${categories}" var="category">
                        <li><a href="/products/${category.id}">${category.name}</a></li>
                    </c:forEach>

                </ul>
            </div>
            <!-- /category nav -->

            <!-- menu nav -->
            <div class="menu-nav">
                <span class="menu-header">Menu <i class="fa fa-bars"></i></span>
                <ul class="menu-list">
                    <li><a href="<c:url value="/home" />">Home</a></li>
                    <li><a href="<c:url value="/products" /> ">Shop</a></li>

                        <div class="header-search">
                            <form action="/search" method="get">
                                <input class="input search-input" type="text" name="search" placeholder="Enter your keyword">
                                <button type="submit" class="search-btn"><i class="fa fa-search"></i></button>
                            </form>
                        </div>

                </ul>
            </div>
            <!-- menu nav -->
        </div>
    </div>
    <!-- /container -->
</div>
