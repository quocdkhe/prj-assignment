<%-- 
    Document   : contact
    Created on : Sep 30, 2024, 8:54:32 AM
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

        <div class="container mt-5">
            <h2 class="text-center mb-4">Liên hệ với chúng tôi</h2>
            <form id="contact" action ="contact" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Địa chỉ email của bạn</label>
                    <input value="${email}" name="email" type="email" class="form-control" id="email" placeholder="Nhập email của bạn" required>
                </div>
                <div class="mb-3">
                    <label for="message" class="form-label">Nội dung liên hệ</label>
                    <textarea name="content" class="form-control" id="message" rows="5" placeholder="Nhập nội dung liên hệ" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Gửi</button>
            </form>
        </div>

        <jsp:include page="include/footer.jsp"/>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src = "resources/script/jquery-3.7.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#contact').on('submit', function (event) {
                    event.preventDefault();

                    var data = {
                        email: $('#email').val(),
                        content: $('#message').val()
                    }

                    $.ajax({
                        url: 'contact',
                        type: 'POST',
                        data: data,
                        success: function (response) {
                            if (response.success) {
                                alert(response.message);
                                window.location.href = "./user-home";
                            } else {
                                alert('Đã có lỗi xảy ra, vui lòng thử lại sau');
                            }
                        },
                        error: function () {
                            alert('Lỗi kết nối đến server, vui lòng thử lại sau');
                        }
                    });
                });
            });
        </script>
    </body>
</html>

