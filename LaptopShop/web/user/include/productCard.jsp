<%-- 
    Document   : productCard
    Created on : Oct 7, 2024, 2:22:20 PM
    Author     : Quoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card" style="width: 18rem; height: 30rem">
    <img src="${param.image}" class="card-img-top" alt="">
    <div class="card-body">
        <h5 class="card-title text-center">${param.productName}</h5>
        <p class="card-text"><strong>Giá sốc: </strong> <span class="price">${param.price}</span> </p>
        <a href="product-detail?pid=${param.id}" class="btn btn-primary">Xem</a>
        <button class="cart btn btn-success" data-product-id="${param.id}" >Giỏ hàng</button>
    </div>
</div>
