<%-- 
    Document   : denied
    Created on : Oct 19, 2024, 8:15:52 AM
    Author     : Quoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Truy cập bị từ chối</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/footer.css">
    </head>
    <body>
        <jsp:include page="user/include/header.jsp"/>
        <div class="container mt-5">
            <h3>Bạn không có quyền truy cập vào trang này</h3>
            <p>Xin lỗi vì sự bất tiện, nhấn vào nút dưới đây để quay lại trang chủ: </p>
            <a href="user-home" class="btn btn-primary">Quay về trang chủ</a>
        </div>
        <jsp:include page="user/include/footer.jsp"/>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
