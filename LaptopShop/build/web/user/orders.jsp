<%-- 
    Document   : order
    Created on : Oct 13, 2024, 4:34:15 PM
    Author     : Quoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tất cả các đơn hàng</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/footer.css">
    </head>
    <body>
        <jsp:include page="include/header.jsp"/>
        <div class="container">
            <h3 class="mb-3">Đơn hàng của tôi</h3>
            <table class="table table-bordered mb-3">
                <thead>
                    <tr>
                        <th>Mã đơn hàng</th>
                        <th>Ngày mua</th>
                        <th>Ngày giao hàng</th>
                        <th>Ngày nhận hàng</th>
                        <th>Danh sách sản phẩm</th>
                        <th>Thành tiền</th>
                        <th>Trạng thái đơn hàng</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${orderList}" var="o">
                        <tr class="text-center">
                            <td>${o.id}</td>
                            <td>${o.orderDate}</td>
                            <td>${o.deliveryDate}</td>
                            <td>${o.receivedDate}</td>
                            <td>
                                <c:forEach items="${o.orderDetailList}" var="d">
                                    <p>Tên SP: ${d.product.productName}</p>
                                    <p>Số lượng: ${d.quantity}</p>
                                    <hr/>
                                </c:forEach>

                            </td>
                            <td class="price">${o.total}</td>
                            <td>${o.orderStatus}</td>
                            <td>
                                <button class="delete-order btn btn-danger" data-order-id="${o.id}" data-order-status="${o.orderStatus}">Xoá</button>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
        <jsp:include page="include/footer.jsp"/>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src = "resources/script/jquery-3.7.1.min.js"></script>
        <script src = "resources/script/script.js"></script>
        <script>
            $(document).ready(function () {
                $('.delete-order').click(function () {
                    var orderStatus = $(this).data('order-status');
                    if (orderStatus === 'Shipping') {
                        alert('Đơn hàng đã được giao cho shipper để vận chuyển, để huỷ đơn hãy từ chối nhận đơn hàng');
                        return;
                    }
                    if (window.confirm('Bạn có muốn xoá đơn hàng này ?')) {
                        var orderId = $(this).data('order-id');
                        var orderRow = $(this).closest('tr');
                        $.ajax({
                            url: 'order',
                            type: 'POST',
                            data: {
                                orderId: orderId
                            },
                            success: function (response) {
                                if (response.success) {
                                    alert('Xoá đơn hàng thành công');
                                    orderRow.hide();
                                } else {
                                    alert('Đã có lỗi xảy ra, vui lòng thử lại sau');
                                }
                            },
                            error: function () {
                                alert('Lỗi kết nối đến server, vui lòng thử lại sau');
                            }
                        });
                    }

                });
            });
        </script>
    </body>
</html>
