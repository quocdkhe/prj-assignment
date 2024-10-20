<%-- 
    Document   : adminManager
    Created on : Oct 1, 2024, 3:11:55 PM
    Author     : Quoc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin cá nhân</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/sidebars.css">
    <body>
        <main class="d-flex flex-nowrap">
            <jsp:include page="template/sidebar.jsp"/>
            <div class="container mt-5">
                <h3>Quản lí thông tin cá nhân</h3>
                <c:set value="${sessionScope.user}" var="admin"/>
                <div class = "container">
                    <table>
                        <tbody>
                            <tr>
                                <td><strong>Mã người dùng:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
                                <td>${user.id}</td>
                            </tr>
                            <tr>
                                <td><strong>Họ và tên:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
                                <td>${user.fullName}</td>
                            </tr>
                            <tr>
                                <td><strong>Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
                                <td>${user.email}</td>
                            </tr>  
                            <tr>
                                <td><strong>Địa chỉ:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
                                <td>${user.address}</td>
                            </tr>
                            <tr>
                                <td><strong>Số điện thoại:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
                                <td>${user.phoneNumber}</td>
                            </tr> 
                            <tr>
                                <td><strong>Vai trò:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
                                <td>${user.role.roleName}</td>
                            </tr> 
                        </tbody>
                    </table>
                    <br>
                    <form method="post" action="admin-manager">
                        <input name="changeInfo" value="changeInfo" type="hidden">
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModal">
                            Sửa thông tin cá nhân
                        </button>

                        <!-- Modal sửa thông tin cá nhân -->
                        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="editModalLabel">Sửa thông tin cá nhân</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <label for="fullname" class="form-label">Họ và tên</label>
                                        <input value="${user.fullName}" type="text" class="form-control" id="fullname" name="fullname" placeholder="Nhập họ và tên" required>

                                        <label for="email" class="form-label">Email</label>
                                        <input value="${user.email}" type="email" class="form-control" id="email" name="email" placeholder="Nhập email" required>

                                        <label for="address" class="form-label">Địa chỉ</label>
                                        <input value="${user.address}" type="text" class="form-control" id="address" name="address" placeholder="Nhập địa chỉ" required>

                                        <label for="phone" class="form-label">Số điện thoại</label>
                                        <input value="${user.phoneNumber}" type="tel" class="form-control" id="phone" name="phone" placeholder="Nhập số điện thoại" required>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                        <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>   
                    <br>

                    <form method="post" action="admin-manager" onsubmit="return validatePassword()">
                        <input name="changePwd" value="changePwd" type="hidden">
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#changePwdModal">
                            Đổi mật khẩu
                        </button>

                        <!-- Modal đổi mật khẩu-->
                        <div class="modal fade" id="changePwdModal" tabindex="-1" aria-labelledby="changePwdModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="changePwdModalLabel">Đổi mật khẩu</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <label for="password" class="form-label">Mật khẩu</label>
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu" required>

                                        <label for="confirmPassword" class="form-label">Xác nhận mật khẩu</label>
                                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Xác nhận mật khẩu" required>

                                        <p id="errorMessage" class="text-danger" style="display:none;">Mật khẩu không khớp!</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                        <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>


            </div>
        </main>
        <script src="resources/bootstrap-5.3.3-dist/js/sidebar.js"></script>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/script/script.js"></script>
    </body>
</html>
