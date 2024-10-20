<%-- 
    Document   : admin
    Created on : Sep 29, 2024, 4:17:46 PM
    Author     : Quoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí đơn hàng</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/sidebars.css">
    </head>
    <body>
        <main class="d-flex flex-nowrap">
            <jsp:include page="template/sidebar.jsp"/>
            <div class="container mt-5">
                <h3 class="mt-3">Trang quản lí đơn hàng</h3>
                <form class="container" action="order-manager" method="get">
                    <div class="row" >
                        <div class="col-md-12   ">
                            <label class="form-label" for="status">Lọc theo trạng thái</label>
                            <select class="form-select" id="status" name="status">
                                <option ${currentStatus == 'Pending' ? 'selected' : ''} value="Pending">Chờ xác nhận</option>
                                <option ${currentStatus == 'Shipping' ? 'selected' : ''} value="Shipping">Đang giao</option>
                                <option ${currentStatus == 'Completed' ? 'selected' : ''} value="Completed">Hoàn thành</option>
                                <option ${currentStatus == 'Cancelled' ? 'selected' : ''} value="Cancelled">Đã bị hủy</option>
                            </select>
                        </div>
                    </div>
                    <button class="btn btn-primary mt-3" type="submit">Tìm đơn</button>
                </form>

                <div class="container mt-3">
                    <table class="table table-stripeed">
                        <thead>
                            <tr>
                                <th>Mã</th>
                                <th>Người nhận</th>
                                <th>Trạng thái</th>
                                <th>Giá trị</th>
                                <th>Ngày đặt</th>
                                <th>Ngày giao</th>
                                <th>Ngày nhận</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${orderList}" var="o">
                                <tr>
                                    <td>${o.id}</td>
                                    <td>${o.recipientName}</td>
                                    <td>${o.orderStatus}</td>
                                    <td class="price">${o.total}</td>
                                    <td>${o.orderDate}</td>
                                    <td>${o.deliveryDate}</td>
                                    <td>${o.receivedDate}</td>
                                    <td>
                                        <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#order${o.id}">Chi tiết</button>
                                        <!-- Modal chi tiết đơn hàng -->
                                        <div class="modal fade" id="order${o.id}" tabindex="-1" aria-labelledby="label${o.id}" aria-hidden="true">
                                            <div class="modal-dialog modal-xl">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="label${o.id}">Chi tiết đơn hàng</h1>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-md-4">
                                                                    <p><strong>Thông tin người nhận:</strong></p>
                                                                    <p>Người nhận: ${o.recipientName}</p>
                                                                    <p>Địa chỉ: ${o.deliveryAddress}</p>
                                                                    <p>Số điện thoại: ${o.recipientPhone}</p>
                                                                </div>

                                                                <div class="col-md-4">
                                                                    <p><strong>Thông tin người đặt hàng: </strong></p>
                                                                    <p>Người đặt: ${o.customer.fullName}</p>
                                                                    <p>Email: ${o.customer.email}</p>
                                                                    <p>Số điện thoại: ${o.customer.phoneNumber}</p>
                                                                </div>

                                                                <div class="col-md-4">
                                                                    <p><strong>Thông tin đơn hàng: </strong></p>
                                                                    <p>Trạng thái đơn hàng: ${o.orderStatus}</p>
                                                                    <p>Ngày đặt: ${o.orderDate}</p>
                                                                    <p>Ngày giao: ${o.deliveryDate}</p>
                                                                    <p>Ngày nhận: ${o.receivedDate}</p>
                                                                </div>
                                                            </div>	
                                                            <div class="row">
                                                                <table class="table table-stripped">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>STT</th>
                                                                            <th>Tên sản phẩm</th>
                                                                            <th>Đơn giá</th>
                                                                            <th>Số lượng đặt</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <c:set value="1" var="index"/>
                                                                        <c:forEach items="${o.orderDetailList}" var="od">
                                                                            <tr>
                                                                                <td>${index}</td>
                                                                                <td>${od.product.productName}</td>
                                                                                <td class="price">${od.unitPrice}</td>
                                                                                <td>${od.quantity}</td>
                                                                            </tr>
                                                                            <c:set value="${index + 1}" var="index"/>
                                                                        </c:forEach>
                                                                        <tr class="text-center">
                                                                            <td colspan="2"><strong>Tổng</strong></td>
                                                                            <td class="price" colspan="2">${o.total}</td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <hr/>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <p>Ghi chú</p>
                                                                    <p>${o.note}</p>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <p><strong>Thông tin người giao hàng:</strong></p>
                                                                    <p>Tên: ${o.shipper.fullName}</p>
                                                                    <p>Id: ${o.shipper.id}</p>
                                                                    <p>Số điện thoại: ${o.shipper.phoneNumber}</p>
                                                                </div>
                                                            </div>	
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <button style="${currentStatus != 'Pending' ? 'display: none;' : ''}" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#assign">Phân công</button>

                                        <div class="modal fade" id="assign" tabindex="-1" aria-labelledby="assignLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h1 class="modal-title fs-5" id="assignLabel">Phân công shipper</h1>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <form id="choose-shipper" method="post" action="order-manager">
                                                        <div class="modal-body">
                                                            <input type="hidden" data-order-id = "${o.id}" class="orderId">
                                                            <label class="form-label" for="shipper-list">Chọn 1 trong các shipper dưới đây</label>
                                                            <select id="shipper-list" class="form-select">
                                                                <c:forEach items="${shipperList}" var="s">
                                                                    <option value="${s.id}">ID = ${s.id} - ${s.fullName}</option>
                                                                </c:forEach>
                                                            </select>


                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                            <button type="submit" class="btn btn-primary">Giao việc</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <button style="${(currentStatus == 'Pending' || currentStatus == 'Shipping') ? 'display: none;' : ''}" type="button" data-order-id="${o.id}" class="delete-order btn btn-danger">Xóa đơn hàng</button>

                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${currentPage - 1}" 
                               tabindex="-1">Previous</a>
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
        </main>
        <script src="resources/bootstrap-5.3.3-dist/js/sidebar.js"></script>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/script/jquery-3.7.1.min.js"></script>
        <script src="resources/script/script.js"></script>
        <script>
            $(document).ready(function () {
                $('#choose-shipper').on('submit', function (event) {
                    event.preventDefault();
                    var shipperId = $('#shipper-list').val();
                    var orderId = $(this).find('.orderId').data('order-id');
                    var data = {
                        action: 'assign',
                        shipperId: shipperId,
                        orderId: orderId
                    };

                    $.ajax({
                        url: 'order-manager',
                        type: 'POST',
                        data: data,
                        success: function (response) {
                            console.log(data);
                            if (response.success) {
                                alert('Đã chuyển đơn hàng đến shipper thành công, chuyển sang mục các đơn đang giao để theo dõi');
                                window.location.href = './order-manager?status=Shipping';
                            } else {
                                alert(response.success ? "" : "Đã có lỗi xảy ra, vui lòng thử lại sau");
                            }
                        },
                        error: function () {
                            alert("Lỗi kết nối đến server");
                        }
                    });
                });

                $('.delete-order').click(function () {
                    var currentOrderCell = $(this).closest('td').closest('tr');
                    if (window.confirm('Bạn muốn xóa đơn hàng này ?')) {
                        var orderId = $(this).data("order-id");

                        $.ajax({
                            url: 'order-manager',
                            type: 'POST',
                            data: {
                                action: 'delete',
                                orderId: orderId
                            },
                            success: function (response) {
                                if (response.success) {
                                    alert('Xóa đơn hàng thành công');
                                    currentOrderCell.hide();
                                } else {
                                    alert('Có lỗi xảy ra, vui lòng thử lại sau');
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
