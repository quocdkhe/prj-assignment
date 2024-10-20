<%-- 
    Document   : arigatou
    Created on : Oct 17, 2024, 5:19:11 PM
    Author     : Quoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đặt hàng thành công</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/footer.css">
    </head>
    <body>
        <jsp:include page="include/header.jsp"/>

        <div class="container text-center mt-5">
            <<img src="resources/images/arigatou.png" alt="alt"/>
            <h1 class="display-4 text-success">Cảm ơn bạn đã đặt hàng!</h1>
            <p class="lead mt-4">Chúng tôi rất vui được phục vụ bạn. Đơn hàng của bạn đã được tiếp nhận và sẽ sớm được xử lý. Một email xác nhận đã được gửi đến hộp thư của bạn.</p>
            <p class="lead">Trong trường hợp cần hỗ trợ, bạn có thể liên hệ với chúng tôi qua số điện thoại hoặc email được liệt kê trên website. Chúng tôi luôn sẵn sàng giúp đỡ bạn!</p>
            <p class="mt-3">Chúc bạn có một trải nghiệm mua sắm tuyệt vời và hy vọng sẽ được phục vụ bạn lần nữa trong tương lai! Bạn có thể theo dõi đơn hàng của mình bằng cách ấn vào nút dưới đây, hoặc quay về trang chủ</p>

            <a href="./order" class="btn btn-info btn-lg mt-4">Theo dõi đơn hàng</a>
            <a href="./user-home" class="btn btn-primary btn-lg mt-4">Quay lại trang chủ</a>
        </div>

        <jsp:include page="include/footer.jsp"/>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
