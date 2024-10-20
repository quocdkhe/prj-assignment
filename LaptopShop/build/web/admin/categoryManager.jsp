<%-- Document : category Created on : Sep 30, 2024, 11:31:54 AM Author : Quoc --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí danh mục</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/sidebars.css">

    <body>
        <main class="d-flex flex-nowrap">
            <jsp:include page="template/sidebar.jsp" />
            <div class="container mt-5">
                <h3>Trang quản lí danh mục sản phẩm</h3>
                <br>
                <div class ="container">
                    <table class="table table-bordered">
                        <thead class="table-light">
                            <tr>
                                <th>Mã danh mục</th>
                                <th>Tên danh mục</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.categoryList}" var="category">
                                <tr>
                                    <td>${category.id}</td>
                                    <td>${category.categoryName}</td>
                                    <td>
                                        <button class="btn btn-primary" data-bs-toggle="modal"
                                                data-bs-target="#updateCategoryModal${category.id}">Cập nhật</button>
                                        <form onsubmit="deleteAlert(event)" style="display: inline-block;" method="post" action="category-manager">
                                            <input name="deleteId" type="hidden"
                                                   type="text" value="${category.id}">
                                            <button type="submit" class="btn btn-danger">Xóa</button>
                                        </form>
                                    </td>
                                </tr>
                                <!-- Modal cập nhật tên danh mục -->
                            <form method="post" action="category-manager">    
                                <div class="modal fade" id="updateCategoryModal${category.id}" tabindex="-1"
                                     aria-labelledby="updateCategoryModal${category.id}Label" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="updateCategoryModal${category.id}">
                                                    Cập nhật</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>

                                            <div class="modal-body">
                                                <label class="form-label" for="id">ID danh mục</label>
                                                <input name="id" class="form-control" value="${category.id}"
                                                       type="number" readonly id="id">

                                                <label class="form-label" for="categoryName">Tên danh
                                                    mục</label>
                                                <input value="${category.categoryName}" name="categoryName"
                                                       class="form-control" type="text" id="categoryName">
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">Đóng</button>
                                                <button type="submit" class="btn btn-primary">Lưu thay
                                                    đổi</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>

                    <div  class="container mt-3">
                        <button data-bs-toggle="modal" data-bs-target="#addCategoryModal" type="button" class="btn btn-success">Thêm mới danh mục</button>
                    </div>

                    <!-- Modal thêm mới danh mục -->
                    <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="addCategoryModalLabel">Modal title</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <form method="post" action="category-manager">
                                    <div class="modal-body">
                                        <label class="form-label" for="categoryName">Tên danh
                                            mục</label>
                                        <input name="categoryName"
                                               class="form-control" type="text" id="categoryName">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Đóng</button>
                                        <button type="submit" class="btn btn-primary">Thêm mới</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Làm phân trang -->
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <a class="page-link" href="?page=${currentPage - 1}" tabindex="-1">Previous</a>
                            </li>
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="?page=${i}">${i}</a>
                                </li>
                            </c:forEach>

                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                <a class="page-link" href="?page=${currentPage + 1}">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </main>
        <script src="resources/bootstrap-5.3.3-dist/js/sidebar.js"></script>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/script/script.js"></script>
    </body>

</html>