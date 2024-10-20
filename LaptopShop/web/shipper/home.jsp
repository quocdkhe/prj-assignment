<%-- 
    Document   : home
    Created on : Oct 15, 2024, 10:47:26 AM
    Author     : Quoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang người giao hàng</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/sidebars.css">
    </head>
    <body>
        <main class="d-flex flex-nowrap">
            <jsp:include page="template/sidebar.jsp" />
            <div class="container mt-5">
                <h3 class="mt-3">Đơn hàng đang chờ giao</h3>
                <form class="container" action="delivering-manager" method="get">
                    <label class="form-label" for="status">Lọc theo trạng thái</label>
                    <select class="form-select" id="status" name="status">
                        <option ${currentStatus == 'Shipping' ? 'selected' : ''} value="Shipping">Được phân công</option>
                        <option ${currentStatus == 'Completed' ? 'selected' : ''} value="Completed">Hoàn thành</option>
                        <option ${currentStatus == 'Cancelled' ? 'selected' : ''} value="Cancelled">Đã hủy</option>
                    </select>
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
                                    <td>${o.total}</td>
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
                                                                                <td>${od.unitPrice}</td>
                                                                                <td>${od.quantity}</td>
                                                                            </tr>
                                                                            <c:set value="${index + 1}" var="index"/>
                                                                        </c:forEach>
                                                                        <tr class="text-center">
                                                                            <td colspan="2"><strong>Tổng</strong></td>
                                                                            <td colspan="2">${o.total}</td>
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

                                        <c:if test="${o.orderStatus == 'Shipping'}">
                                            <button  type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                Cập nhật
                                            </button>

                                            <!-- Modal -->
                                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-xl">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Cập nhật trạng thái đơn hàng</h1>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
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
                                                                                <td>${od.unitPrice}</td>
                                                                                <td>${od.quantity}</td>
                                                                            </tr>
                                                                            <c:set value="${index + 1}" var="index"/>
                                                                        </c:forEach>
                                                                        <tr class="text-center">
                                                                            <td colspan="2"><strong>Tổng</strong></td>
                                                                            <td colspan="2">${o.total}</td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>

                                                            <div class ="row">
                                                                <label for="note" class="form-label"><strong>Ghi chú thêm: </strong></label>
                                                                <textarea id="note" class="form-control" name="note"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">

                                                            <input type="hidden" id="data" data-order-id="${o.id}">
                                                            <button value="Completed" type="submit" class="submit-btn btn btn-primary">Giao hàng thành công</button>
                                                            <button value="Cancelled" type="submit" class="submit-btn btn btn-danger">Giao hàng thất bại</button>

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
                $('.submit-btn').click(function (event) {
                    event.preventDefault();

                    formData = {
                        status: $(this).val(),
                        orderId: $('#data').data('order-id'),
                        note: $('#note').val()
                    };
                    console.log(formData);
                    $.ajax({
                        url: 'delivering-manager',
                        type: 'POST',
                        data: formData,
                        success: function (response) {
                            alert(response.success ? 'Cập nhật trạng thái đơn hàng thành công' : 'Cập nhật trạng thái thất bại');
                            formData.status === "Completed" ? window.location.href = "delivering-manager?status=Completed" : window.location.href = "delivering-manager?status=Cancelled";
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
