<%-- 
    Document   : searchProduct
    Created on : Oct 8, 2024, 3:11:31 PM
    Author     : Quoc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sản phẩm</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/footer.css">
    </head>
    <body>
        <jsp:include page="include/header.jsp"/>

        <div class ="container">
            <form class="container-fluid" id="search" action="search-product" method="get">
                <div class="row">
                    <div class="col-md-4">
                        <label class="form-label" for="categorySelect">Theo danh mục:</label>
                        <select class="form-select" name="categorySelect" id="categorySelect" onchange="onChangeSubmit('search')">
                            <c:forEach items="${categoryList}" var="c">
                                <option ${currentCategory == c.id ? 'selected' : ''} value="${c.id}">${c.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="brandSelect">Theo nhãn hiệu:</label>
                        <select class="form-select" name="brandSelect" id="brandSelect" onchange="onChangeSubmit('search')">
                            <option ${currentBrand == 0 ? 'selected' : ''} value="0">Tất cả các nhãn hiệu</option>
                            <c:forEach items="${brandList}" var="b">
                                <option  ${currentBrand == b.id ? 'selected' : ''} value="${b.id}">${b.brandName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label" for="priceRange">Theo tầm giá:</label>
                        <select class="form-select" name="priceRange" id="priceRange" onchange="onChangeSubmit('search')">
                            <option ${currentPriceRange == "allRange" ? 'selected' : ''} value="allRange">Tất cả tầm giá</option>
                            <option ${currentPriceRange == "under500" ? 'selected' : ''} value="under500">Dưới 500K</option>
                            <option ${currentPriceRange == "500to1M" ? 'selected' : ''} value="500to1M">500K đến 1 triệu</option>
                            <option ${currentPriceRange == "1Mto5M" ? 'selected' : ''} value="1Mto5M">1 đến 5 triệu</option>
                            <option ${currentPriceRange == "5Mto10M" ? 'selected' : ''} value="5Mto10M">5 đến 10 triệu</option>
                            <option ${currentPriceRange == "10to15" ? 'selected' : ''} value="10to15">10-15 triệu</option>
                            <option ${currentPriceRange == "15to20" ? 'selected' : ''} value="15to20">15-20 triệu</option>
                            <option ${currentPriceRange == "20to30" ? 'selected' : ''} value="20to30">20-30 triệu</option>
                            <option ${currentPriceRange == "30andUp" ? 'selected' : ''} value="30andUp">Trên 30 triệu</option>
                        </select>
                    </div>
                </div>
                <br/>
                <div class ="row">
                    <div class="col-md-6">
                        <label class="form-label" for="searchKey">Nhập từ khóa</label>
                        <input value="${currentKey}" class="form-control" type="text" placeholder="Tìm kiếm theo tên" id="searchKey" name="searchKey"/>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label" for="sortOrder">Theo tầm giá:</label>
                        <select class="form-select" name="sortOrder" id="sortOrder" onchange="onChangeSubmit('search')">
                            <option ${currentOrder == null ? 'selected' : ''} value = ${null}>Sắp xếp theo mức giá</option>
                            <option ${currentOrder == "asc" ? 'selected' : ''} value="asc">Tăng dần</option>
                            <option ${currentOrder == "desc" ? 'selected' : ''} value="desc">Giảm dần</option>
                        </select>
                    </div>
                </div>
                <br/> 
                <button data-current-category="${currentCategory}" class="btn btn-primary" type="button" id="reset-button">Đặt lại</button>
            </form>

            <br/>

            <div class="row">
                <c:forEach items="${productList}" var="p" begin="0" end="3">
                    <div class = "col-md-3">
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
            <div class="row">
                <c:forEach items="${productList}" var="p" begin="4" end="7">
                    <div class = "col-md-3">
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
            <div class="row">
                <c:forEach items="${productList}" var="p" begin="8" end="11">
                    <div class = "col-md-3">
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
        <br/>
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                    <a class="page-link" href="?page=${currentPage - 1}&brandSelect=${currentBrand}&categorySelect=${currentCategory}&priceRange=${currentPriceRange}&searchKey=${currentKey}&sortOrder=${currentOrder}" 
                       tabindex="-1">Previous</a>
                </li>

                <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                        <a class="page-link" href="?page=${i}&brandSelect=${currentBrand}&categorySelect=${currentCategory}&priceRange=${currentPriceRange}&searchKey=${currentKey}&sortOrder=${currentOrder}">${i}</a>
                    </li>
                </c:forEach>

                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                    <a class="page-link" href="?page=${currentPage + 1}&brandSelect=${currentBrand}&categorySelect=${currentCategory}&priceRange=${currentPriceRange}&searchKey=${currentKey}&sortOrder=${currentOrder}">Next</a>
                </li>
            </ul>
        </nav>

        <jsp:include page="include/footer.jsp"/>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src = "resources/script/jquery-3.7.1.min.js"></script>
        <script src="resources/script/script.js"></script>
        <script>
                            $(document).ready(function () {
                                $('#reset-button').click(function () {
                                    let currentCategory = $(this).data('current-category');
                                    window.location.href = "search-product?categorySelect=" + currentCategory;
                                });
                            });
        </script>
    </body>
</html>
