<%-- 
    Document   : productView
    Created on : Oct 7, 2024, 2:54:44 PM
    Author     : Quoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết sản phẩm</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/footer.css">

    </head>
    <body>
        <jsp:include page="include/header.jsp"/>
        <c:set value="${product}" var="p"/>
        <div class = "container">
            <div class="row">
                <div class="col-md-6">
                    <img src="${p.image}" width="100%"  alt="alt"/>
                </div>
                <div class="col-md-6">
                    <c:if test="${p.category.id == 1}">
                        <p><strong>Tên sản phẩm: </strong>${p.productName}</p>
                        <p><strong>Hãng sản xuất: </strong>${p.brand.brandName}</p>
                        <p><strong>CPU: </strong>${p.cpu}</p>
                        <p><strong>RAM: </strong>${p.ram}</p>
                        <p><strong>VGA: </strong>${p.vga}</p>
                        <p><strong>Lưu trữ: </strong>${p.hardDrive}</p>
                        <p><strong>Thiết kế: </strong>${p.design}</p>
                        <p><strong>Hệ điều hành: </strong>${p.operatingSystem}</p>
                        <p><strong>Màn hình: </strong>${p.screen}</p>
                        <p><strong>Dung lượng pin: </strong>${p.batteryCapacity}</p>
                        <p><strong>Thông tin chung: </strong>${p.generalInfo}</p>
                        <p><strong>Bảo hành: </strong>${p.warrantyInfo}</p>
                        <p>
                            <strong class="text-danger fw-bold fs-2">Giá: </strong>
                            <span class="price text-primary fw-bold fs-2">${p.price}</span>
                        </p>

                    </c:if>
                    <c:if test="${p.category.id != 1}">
                        <p><strong>Tên sản phẩm: </strong>${p.productName}</p>
                        <p><strong>Hãng sản xuất: </strong>${p.brand.brandName}</p>
                        <p><strong>Thông tin chung: </strong>${p.generalInfo}</p>
                        <p><strong>Bảo hành: </strong>${p.warrantyInfo}</p>
                        <p><strong>Kho: </strong>${p.stockUnits}</p>
                        <p><strong>Đã bán: </strong>${p.unitsSold}</p>
                        <p>
                            <strong class="text-danger fw-bold fs-2">Giá: </strong>
                            <span class="price text-primary fw-bold fs-2">${p.price}</span>
                        </p>
                    </c:if>
                    <button class="cart btn btn-success" data-product-id="${p.id}" >Thêm vảo giỏ hàng</button>
                    <a href="./search-product?categorySelect=${p.category.id}" class="btn btn-primary">Xem sản phẩm khác</a> 
                </div>
            </div>
        </div>
        <jsp:include page="include/footer.jsp"/>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src = "resources/script/jquery-3.7.1.min.js"></script>
        <script src = "resources/script/script.js"></script>
    </body>
</html>
