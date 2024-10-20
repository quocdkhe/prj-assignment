<%-- 
    Document   : header
    Created on : Sep 29, 2024, 10:55:29 AM
    Author     : Quoc
--%>

<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page import="dal.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    CategoryDAO cdao = new CategoryDAO();
    List<Category> categoryList = cdao.getAllCategories();
%>
<nav class="py-2 bg-body-tertiary border-bottom">
    <div class="container d-flex flex-wrap">
        <ul class="nav me-auto">
            <li class="nav-item"><a href="./user-home" class="nav-link link-body-emphasis px-2" aria-current="page">Trang chủ</a>
            </li>
            <li class="nav-item">
                <a class="dropdown-toggle nav-link link-body-emphasis px-2" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Danh mục sản phẩm
                </a>
                <ul class="dropdown-menu">
                    <c:forEach items="<%= categoryList%>" var ="c">
                        <li><a class="dropdown-item" href="search-product?categorySelect=${c.id}">${c.categoryName}</a></li>
                        </c:forEach>
                </ul>
            </li>
            <li class="nav-item"><a href="./shipping" class="nav-link link-body-emphasis px-2">Thông tin vận chuyển</a></li>
            <li class="nav-item"><a href="./guarantee" class="nav-link link-body-emphasis px-2">Bảo hành tận nơi</a></li>
            <li class="nav-item"><a href="./contact" class="nav-link link-body-emphasis px-2">Liên hệ</a></li>

        </ul>
        <c:if test="${sessionScope.user == null}">
            <ul class="nav">
                <li class="nav-item"><a href="login" class="btn btn-outline-primary me-3">Đăng nhập</a></li>
                <li class="nav-item"><a href="register" class="btn btn-primary me-3">Đăng kí</a></li>
            </ul> 
        </c:if>

        <c:if test="${sessionScope.user != null}">
            <ul class="nav">
                <li class="nav-item">
                    <a class="dropdown-toggle nav-link link-body-emphasis px-2" role="button" data-bs-toggle="dropdown" aria-expanded="false">Xin chào, ${user.fullName}</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="./order">Đơn hàng của tôi</a></li>
                        <li><a class="dropdown-item" href="./user-account">Thông tin cá nhân</a></li>
                        <li><a class="dropdown-item" href="./contact-history">Lịch sử feedback</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="btn btn-warning" href ="logout">Đăng xuất</a></li>
            </ul> 
        </c:if>

    </div>
</nav>
<header class="py-3 mb-4 border-bottom">
    <div class="container d-flex flex-wrap justify-content-center">
        <a href="./user-home" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto link-body-emphasis text-decoration-none">
            <img src="resources/images/tomcat.ico" width="40" height="32" alt="logo"/>
            <span class="fs-4">Laptop Shop</span>
        </a>
        <div class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
            <a href="./add-to-cart" class = "btn btn-primary">Giỏ hàng</a>
        </div>
    </div>
</header>
