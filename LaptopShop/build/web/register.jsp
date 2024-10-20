<%-- 
    Document   : register
    Created on : Sep 28, 2024, 4:42:44 PM
    Author     : Quoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <form action="register" method="post" id="signUpForm">
                                <h2 class="text-center">Đăng kí tài khoản</h2>
                                <div class="mb-3">
                                    <label for="signUpEmail" class="form-label">Email</label>
                                    <input name="signUpEmail" type="email" class="form-control" id="signUpEmail"
                                           placeholder="Email" required>
                                </div>
                                <div class="mb-3">
                                    <label for="fullName" class="form-label">Họ và tên</label>
                                    <input name="fullName" type="text" class="form-control" id="fullName"
                                           placeholder="Họ và tên" required>
                                </div>
                                <!-- Password -->
                                <div class="mb-3">
                                    <label for="signUpPassword" class="form-label">Mật khẩu</label>
                                    <input name="signUpPassword" type="password" class="form-control" id="signUpPassword" placeholder="Mật khẩu" required>
                                </div>

                                <!-- Confirm Password -->
                                <div class="mb-3">
                                    <label for="confirmPassword" class="form-label">Xác nhận mật khẩu</label>
                                    <input name="confirmPassword" type="password" class="form-control" id="confirmPassword" placeholder="Xác nhận mật khẩu" required>
                                </div>

                                <div class="mb-3">
                                    <label for="address" class="form-label">Địa chỉ</label>
                                    <input name="address" type="text" class="form-control" id="address"
                                           placeholder="Địa chỉ" required>
                                </div>
                                <div class="mb-3">
                                    <label for="phoneNumber" class="form-label">Số điện thoại</label>
                                    <input name="phoneNumber" type="tel" class="form-control" id="phoneNumber"
                                           placeholder="Số điện thoại" required>
                                </div>

                                <div class="mb-3">
                                    <p id="error-message" style="color: red;"></p>
                                </div>

                                <button type="submit" class="btn btn-primary w-100">Đăng kí</button>

                                <div class="text-center mt-3">
                                    <p>Đã có tài khoản? <a href="login" id="showLogin">Đăng nhập</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src = "resources/script/jquery-3.7.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#signUpForm').on('submit', function (event) {
                    event.preventDefault();
                    var signUpEmail = $('#signUpEmail');
                    var fullName = $('#fullName');
                    var signUpPassword = $('#signUpPassword');
                    var confirmPassword = $('#confirmPassword');
                    var address = $('#address');
                    var phoneNumber = $('#phoneNumber');
                    var formData = {
                        signUpEmail: signUpEmail.val(),
                        fullName: fullName.val(),
                        signUpPassword: signUpPassword.val(),
                        address: address.val(),
                        phoneNumber: phoneNumber.val()
                    };
                    console.log(formData);
                    if (signUpPassword.val() !== confirmPassword.val()) {
                        $('#error-message').text('Mật khẩu không khớp, vui lòng kiểm tra lại');
                        signUpPassword.text("");
                        confirmPassword.text("");
                        return;
                    }

                    $.ajax({
                        url: 'register',
                        type: 'POST',
                        data: formData,
                        success: function (response) {
                            if (response.success) {
                                alert('Đăng kí thành công, chuyển sang trang đăng nhập để đăng nhập và bắt đầu mua hàng');
                                window.location.href = "login";
                            } else {
                                $('#error-message').text(response.message);
                            }
                        },
                        error: function () {
                            alert('Lỗi kết nối đến server');
                        }
                    });
                }
                );
            });
        </script>
    </body>
</html>
