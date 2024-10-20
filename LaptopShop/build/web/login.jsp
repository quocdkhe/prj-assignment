<%-- Document : login Created on : Sep 28, 2024, 11:21:02 AM Author : Quoc --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
    </head>

    <body>
        <div class="container">
            <div class="row justify-content-center mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <!-- Login Form -->
                            <form action="login" method="post" id="loginForm">
                                <h2 class="text-center">Đăng nhập</h2>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input name="email" type="email" class="form-control" id="email"
                                           placeholder="Email" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Mật khẩu</label>
                                    <input name="password" type="password" class="form-control"
                                           id="password" placeholder="Mật khẩu" required>
                                </div>
                                <div class="mb-3 form-check">
                                    <input type="checkbox" class="form-check-input" id="rememberMe">
                                    <label name="rememberMe" class="form-check-label" for="rememberMe">Ghi nhớ
                                        đăng nhập</label>
                                </div>
                                <div class="mb-3">
                                    <p id="error-message" style="color:red;"></p>
                                </div>
                                <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
                                <div class="text-center mt-3">
                                    <p>Chưa có tài khoản ? <a href="register" id="showSignUp">Đăng kí</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/script/jquery-3.7.1.min.js"></script>
        <script>
            $(document).ready(() => {
                $('#loginForm').on('submit', (event) => {
                    event.preventDefault();

                    //Get data from form 
                    var formData = {
                        email: $('#email').val(),
                        password: $('#password').val()
                    };


                    $.ajax({
                        url: 'login',
                        type: 'POST',
                        data: formData,
                        success: function (response) {
                            console.log("I'm in success function");
                            if (response.success) {
                                window.location.href = './home';
                            } else {
                                $('#error-message').text("Sai email hoặc mật khẩu, vui lòng thử lại");
                            }
                        },
                        error: function () {
                            alert('An error occurred');
                        }
                    });
                });
            });
        </script>
    </body>

</html>