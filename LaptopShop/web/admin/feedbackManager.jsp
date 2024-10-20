<%-- 
    Document   : feedbackManager
    Created on : Oct 18, 2024, 8:29:49 AM
    Author     : Quoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí feedback</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/sidebars.css">
    </head>
    <body>
        <main class="d-flex flex-nowrap">
            <jsp:include page="template/sidebar.jsp" />
            <div class="container mt-5">
                <h3>Quản lí feedback</h3>
                <br>
                <div class="container">
                    <label class="form-label" for="status-select">Lọc theo trạng thái</label>
                    <select class="form-select" id="status-select">
                        <option value="Pending" ${selectedStatus == 'Pending' ? 'selected' : ''}>Đang chờ trả lời</option>
                        <option value="Replied" ${selectedStatus == 'Replied' ? 'selected' : ''}>Đã trả lời</option>
                    </select>
                </div>

                <div class="container mt-3">
                    <table class="table table-stripped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên người gửi</th>
                                <th>Email</th>
                                <th>Nội dung</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${feedbackList}" var="c">

                                <tr>
                                    <td>${c.id}</td>
                                    <td>${c.senderUser.fullName}</td>
                                    <td>${c.senderUser.email}</td>
                                    <td>${c.contactContent}</td>
                                    <td>
                                        <c:if test="${c.status == 'Pending'}">
                                            <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#reply${c.id}">Trả lời</button>
                                            <div class="modal fade" id="reply${c.id}" tabindex="-1" aria-labelledby="label${c.id}" aria-hidden="true">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5" id="label${c.id}">Modal title</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <form class="replyForm" method="post" action="feedback-manager">
                                                            <div class="modal-body">
                                                                <p><strong>Tên người gửi: </strong> ${c.senderUser.fullName}</p>
                                                                <p><strong>Email liên hệ: </strong>${c.senderUser.email}</p>
                                                                <p><strong>Thời gian gửi: </strong>${c.contactDate}</p>
                                                                <p><strong>Nội dung: </strong><br/>${c.contactContent}</p>
                                                                <hr/>
                                                                <label for="replyTo${c.id}">Nội dung trả lời: </label>
                                                                <textarea id="replyTo${c.id}" class="form-control reply-content"></textarea>
                                                                <input type="hidden" class="feedback-id" value="${c.id}"/>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>


                                        <c:if test="${c.status == 'Replied'}">
                                            <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#detail${c.id}">Chi tiết</button>
                                            <div class="modal fade" id="detail${c.id}" tabindex="-1" aria-labelledby="label${c.id}" aria-hidden="true">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5" id="label${c.id}">Chi tiết feedback</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p><strong>Tên người gửi: </strong>${c.senderUser.fullName}</p>
                                                            <p><strong>Email liên hệ: </strong>${c.senderUser.email}</p>
                                                            <p><strong>Thời gian gửi: </strong>${c.contactDate}</p>
                                                            <p><strong>Nội dung: </strong><br/>${c.contactContent}</p>
                                                            <hr/>
                                                            <p><strong>Tên người trả lời: </strong>${c.responderUser.fullName}</p>
                                                            <p><strong>Thời gian trả lời: </strong>${c.replyDate}</p>
                                                            <p><strong>Nội dung trả lời: </strong><br/>${c.replyContent}</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- Làm phân trang -->
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${currentPage - 1}&status=${selectedStatus}" tabindex="-1">Previous</a>
                        </li>
                        <c:forEach var="i" begin="1" end="${totalPages}">
                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                <a class="page-link" href="?page=${i}&status=${selectedStatus}">${i}</a>
                            </li>
                        </c:forEach>

                        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${currentPage + 1}&status=${selectedStatus}">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>


        </main>
        <script src="resources/bootstrap-5.3.3-dist/js/sidebar.js"></script>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src = "resources/script/jquery-3.7.1.min.js"></script>
        <script>
            $(document).ready(function () {

                $('#status-select').change(function () {
                    var status = $(this).val();
                    console.log(status);
                    window.location.href = "feedback-manager?status=" + status;
                });

                $('.replyForm').on('submit', function (event) {
                    event.preventDefault();
                    var feedbackId = $(this).find('.feedback-id').val();
                    var replyContent = $(this).find('.reply-content').val();
                    var formData = {
                        feedbackId: feedbackId,
                        replyContent: replyContent
                    };
                    $.ajax({
                        url: 'feedback-manager',
                        type: 'POST',
                        data: formData,
                        success: function (response) {
                            if (response.success) {
                                alert(response.message);
                                window.location.href = "feedback-manager?status=Replied";
                            } else {
                                alert('Đã có lỗi xảy ra, vui lòng thử lại sau');
                            }
                        },
                        error: function () {
                            alert('Lỗi kết nối đến server, vui lòng thử lại sau');
                        }
                    })
                });
            });
        </script>
    </body>
</html>
