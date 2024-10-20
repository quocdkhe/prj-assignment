<%-- Document : productManager Created on : Sep 30, 2024, 11:30:24 AM Author : Quoc --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí sản phẩm</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/sidebars.css">
    </head>
    <body>
        <main class="d-flex flex-nowrap">
            <jsp:include page="template/sidebar.jsp" />
            <div class="container mt-5">
                <h3>Trang quản lí sản phẩm</h3>
                <br>
                <div class="container">
                    <form id="search" action="product-manager" method="get" class="row">
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
                    </form>
                    <br><!-- comment -->

                    <table class="table table-light">
                        <thead>
                            <tr>
                                <th>Hình ảnh</th>
                                <th>Tên SP</th>
                                <th>Danh mục</th>
                                <th>Hãng sản xuất</th>
                                <th>Đơn giá</th>
                                <th>Số lượng</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${productList}" var="p">
                                <tr>
                                    <td><img src="${p.image}" width="40" height="40" alt="alt" /></td>
                                    <td>${p.productName}</td>
                                    <td>${p.category.categoryName}</td>
                                    <td>${p.brand.brandName}</td>
                                    <td class="price">${p.price}</td>
                                    <td>${p.stockUnits}</td>
                                    <td>
                                        <button type="button" class="btn btn-info" data-bs-toggle="modal"
                                                data-bs-target="#detailsModal${p.id}">Chi tiết</button>
                                        <button  data-bs-toggle="modal" data-bs-target="#editModal${p.id}" class="btn btn-primary">Cập nhật</button>
                                        <c:if test="${p.category.id == 1}">
                                            <jsp:include page="template/editLaptopPCModal.jsp">
                                                <jsp:param name="id" value="${p.id}" />
                                                <jsp:param name="productName" value="${p.productName}" />
                                                <jsp:param name="brandId" value="${p.brand.id}" />
                                                <jsp:param name="cpu" value="${p.cpu}" />
                                                <jsp:param name="ram" value="${p.ram}" />
                                                <jsp:param name="vga" value="${p.vga}" />
                                                <jsp:param name="hardDrive" value="${p.hardDrive}" />
                                                <jsp:param name="design" value="${p.design}" />
                                                <jsp:param name="operatingSystem" value="${p.operatingSystem}" />
                                                <jsp:param name="screen" value="${p.screen}" />
                                                <jsp:param name="batteryCapacity" value="${p.batteryCapacity}" />
                                                <jsp:param name="generalInfo" value="${p.generalInfo}" />
                                                <jsp:param name="warrantyInfo" value="${p.warrantyInfo}" />
                                                <jsp:param name="price" value="${p.price}" />
                                                <jsp:param name="stockUnits" value="${p.stockUnits}" />
                                            </jsp:include>
                                        </c:if>
                                        <c:if test="${p.category.id != 1}">
                                            <jsp:include page="template/editOtherProductModal.jsp">
                                                <jsp:param name="id" value="${p.id}" />
                                                <jsp:param name="productName" value="${p.productName}" />
                                                <jsp:param name="brandId" value="${p.brand.id}" />
                                                <jsp:param name="categoryId" value="${p.category.id}" />
                                                <jsp:param name="generalInfo" value="${p.generalInfo}" />
                                                <jsp:param name="warrantyInfo" value="${p.warrantyInfo}" />
                                                <jsp:param name="price" value="${p.price}" />
                                                <jsp:param name="stockUnits" value="${p.stockUnits}" />
                                            </jsp:include>
                                        </c:if>


                                        <form onsubmit="deleteAlert(event)" style="display:inline-block" method="post" action="product-manager">
                                            <input name="delete" type="hidden" value="${p.id}"/>
                                            <button type="submit" class ="btn btn-danger">Xóa</button>
                                        </form>

                                    </td>
                                </tr>
                                <!-- Modal chi tiết sản phẩm -->
                                <!-- Modal -->
                            <div class="modal fade" id="detailsModal${p.id}" tabindex="-1"
                                 aria-labelledby="detailsModalLabel${p.id}" aria-hidden="true">
                                <div class="modal-dialog modal-xl">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="detailsModalLabel${p.id}">Chi
                                                tiết sản phẩm</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Clcpue"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-md-6"><img src="${p.image}" width="500" height="500" alt="alt" /></div>
                                                <div class="col-md-6">
                                                    <c:if test="${p.category.id == 1}">
                                                        <p><strong>Mã sản phẩm: </strong>${p.id}</p>
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
                                                        <p><strong>Đơn giá: </strong><span class="price">${p.price}</span></p>
                                                        <p><strong>Kho: </strong>${p.stockUnits}</p>
                                                        <p><strong>Đã bán: </strong>${p.unitsSold}</p>
                                                    </c:if>
                                                    <c:if test="${p.category.id != 1}">
                                                        <p><strong>Mã sản phẩm: </strong>${p.id}</p>
                                                        <p><strong>Tên sản phẩm: </strong>${p.productName}</p>
                                                        <p><strong>Hãng sản xuất: </strong>${p.brand.brandName}</p>
                                                        <p><strong>Thông tin chung: </strong>${p.generalInfo}</p>
                                                        <p><strong>Bảo hành: </strong>${p.warrantyInfo}</p>
                                                        <p><strong>Đơn giá: </strong> <span class="price">${p.price}</span></p>
                                                        <p><strong>Kho: </strong>${p.stockUnits}</p>
                                                        <p><strong>Đã bán: </strong>${p.unitsSold}</p>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Đóng</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        </tbody>
                    </table>

                    <!--  Thêm mới Laptop, PC -->
                    <jsp:include page="template/addLaptopModal.jsp" />

                    <!-- Thêm mới những sản phẩm khác -->
                    <jsp:include page="template/addOtherProductModal.jsp"/>

                    <!-- Làm phân trang -->
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <a class="page-link" href="?page=${currentPage - 1}&brandSelect=${currentBrand}&categorySelect=${currentCategory}&priceRange=${currentPriceRange}" 
                                   tabindex="-1">Previous</a>
                            </li>

                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="?page=${i}&brandSelect=${currentBrand}&categorySelect=${currentCategory}&priceRange=${currentPriceRange}">${i}</a>
                                </li>
                            </c:forEach>

                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                <a class="page-link" href="?page=${currentPage + 1}&brandSelect=${currentBrand}&categorySelect=${currentCategory}&priceRange=${currentPriceRange}">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </main>
        <script src="resources/bootstrap-5.3.3-dist/js/sidebar.js"></script>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/script/jquery-3.7.1.min.js"></script>
        <script src="resources/script/script.js"></script>
    </body>

</html>