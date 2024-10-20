<%-- 
    Document   : home
    Created on : Sep 29, 2024, 10:38:41 AM
    Author     : Quoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laptop Shop</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/footer.css">
    </head>
    <body>
        <jsp:include page="include/header.jsp"/>
        <jsp:include page="include/carousel.jsp"/>
        <div class ="container mt-5">
            <p class="display-6 text-center">Danh mục nổi bật</p>
            <div class = "row">
                <div class="col-md-2">
                    <div class="card" >
                        <div class="card-body">
                            <h4 class="card-title">Laptop</h4>
                            <a href="search-product?categorySelect=1">
                                <img src="resources/images/laptop.png" width="100%" alt="alt"/>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="card" >
                        <div class="card-body">
                            <h4 class="card-title">Tivi</h4>
                            <a href="search-product?categorySelect=6">
                                <img src="resources/images/tivi_samsung.png" width="100%" alt="alt"/>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="card" >
                        <div class="card-body">
                            <h4 class="card-title">Phụ kiện</h4>
                            <a href="search-product?categorySelect=5">
                                <img src="resources/images/phu_kien.png" width="100%" alt="alt"/>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="card" >
                        <div class="card-body">
                            <h4 class="card-title">Máy in</h4>
                            <a href="search-product?categorySelect=15">
                                <img src="resources/images/may_in.jpg" width="100%" alt="alt"/>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="card" >
                        <div class="card-body">
                            <h4 class="card-title">Màn hình</h4>
                            <a href="search-product?categorySelect=17">
                                <img src="resources/images/man_hinh.png" width="100%" alt="alt"/>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-md-2">
                    <div class="card" >
                        <div class="card-body">
                            <h4 class="card-title">Camera an ninh</h4>
                            <a href="search-product?categorySelect=3">
                                <img src="resources/images/camera_an_ninh.png" width="100%" alt="alt"/>
                            </a>
                        </div>
                    </div>
                </div>


            </div>
            <br/>
            <hr/>
            <br/>
        </div>

        <div class="container mt-3">
            <p class="display-6 text-center">Back to school 2024</p>
            <div class ="row">
                <c:forEach items="${backToSchol}" var="p">
                    <div class="col-md-3">
                        <jsp:include page="include/productCard.jsp">
                            <jsp:param name="id" value="${p.id}"/>
                            <jsp:param name="image" value="${p.image}"/>
                            <jsp:param name="price" value="${p.price}"/>
                            <jsp:param name="productName" value="${p.productName}"/>
                        </jsp:include>
                    </div>
                </c:forEach>
            </div>	
            <br/>
            <hr/>
            <br/>
            <div class ="row">
                <p class="display-6 text-center">Laptop doanh nhân</p>
                <c:forEach items="${businessLaptop}" var="p">
                    <div class="col-md-3">
                        <jsp:include page="include/productCard.jsp">
                            <jsp:param name="id" value="${p.id}"/>
                            <jsp:param name="image" value="${p.image}"/>
                            <jsp:param name="price" value="${p.price}"/>
                            <jsp:param name="productName" value="${p.productName}"/>
                        </jsp:include>
                    </div>
                </c:forEach>
            </div>

            <br/>
            <hr/>
            <br/>
            <div class ="row">
                <p class="display-6 text-center">Combo dành cho game thủ</p>
                <c:forEach items="${gamingGear}" var="p">
                    <div class="col-md-3">
                        <jsp:include page="include/productCard.jsp">
                            <jsp:param name="id" value="${p.id}"/>
                            <jsp:param name="image" value="${p.image}"/>
                            <jsp:param name="price" value="${p.price}"/>
                            <jsp:param name="productName" value="${p.productName}"/>
                        </jsp:include>
                    </div>
                </c:forEach>
            </div>

        </div>

        <jsp:include page="include/footer.jsp"/>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src = "resources/script/jquery-3.7.1.min.js"></script>
        <script src = "resources/script/script.js"></script>
    </body>
</html>
