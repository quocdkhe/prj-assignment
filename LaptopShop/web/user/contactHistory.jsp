<%-- 
    Document   : contactHistory
    Created on : Oct 17, 2024, 10:52:17 PM
    Author     : Quoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lịch sử liên hệ</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/footer.css">
    </head>
    <body>
        <jsp:include page="include/header.jsp"/>
        <div class="container">
            <h3 class="mb-3">Lịch sử liên hệ</h3>
            <table class="mb-3 table table-stripped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nội dung feedback</th>
                        <th>Ngày tạo</th>
                        <th>Nội dung trả lời</th>
                        <th>Trạng thái</th>
                        <th>Ngày trả lời</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${contactList}" var="c">
                        <tr>
                            <td>${c.id}</td>
                            <td>${c.contactContent}</td>
                            <td>${c.contactDate}</td>
                            <td>${c.replyContent}</td>
                            <td>${c.status}</td>
                            <td>${c.replyDate}</td>
                            <td><button data-contact-id="${c.id}" class="btn btn-danger delete-btn">Xoá</button></td>
                        </tr> 
                    </c:forEach>

                </tbody>
            </table>
        </div>
        <jsp:include page="include/footer.jsp"/>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src = "resources/script/jquery-3.7.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.delete-btn').click(function () {
                    if (window.confirm('Xoá feedback này ?')) {
                        var contactId = $(this).data("contact-id");
                        var thisCell = $(this).closest('tr');
                        $.ajax({
                            url: 'contact-history',
                            type: 'POST',
                            data: {
                                contactId: contactId
                            },
                            success: function (response) {
                                if (response.success) {
                                    alert(response.message);
                                    thisCell.hide();
                                } else {
                                    alert('Đã có lỗi xảy ra, vui lòng thử lại sau');
                                }
                            },
                            error: function () {
                                alert("Đã có lỗi khi kết nối đến server, vui lòng thử lại sau");
                            }
                        });
                    }
                });
            });
        </script>
    </body>
</html>
