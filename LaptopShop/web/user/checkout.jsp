<%-- 
    Document   : checkout
    Created on : Oct 13, 2024, 8:58:49 AM
    Author     : Quoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/footer.css">
    </head>
    <body>
        <jsp:include page="include/header.jsp"/>

        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <h3 class="mb-4">Thông tin đặt hàng</h3>
                    <form id="order-form" method="post">
                        <!-- Tên người nhận -->
                        <div class="mb-3">
                            <label for="recipientName" class="form-label">Tên người nhận</label>
                            <input type="text" class="form-control" id="name" placeholder="Nhập tên người nhận">
                        </div>

                        <!-- Địa chỉ nhận hàng -->
                        <div class="mb-3">
                            <label for="deliveryAddress" class="form-label">Địa chỉ nhận hàng</label>
                            <input type="text" class="form-control" id="address" placeholder="Nhập địa chỉ nhận hàng">
                        </div>

                        <!-- Số điện thoại người nhận -->
                        <div class="mb-3">
                            <label for="recipientPhone" class="form-label">Số điện thoại người nhận</label>
                            <input type="tel" class="form-control" id="phone" placeholder="Nhập số điện thoại">
                        </div>

                        <!-- Lưu ý dành cho người giao hàng -->
                        <div class="mb-3">
                            <label for="note" class="form-label">Lưu ý dành cho người giao hàng</label>
                            <textarea class="form-control" id="note" rows="3" placeholder="Nhập lưu ý (nếu có)"></textarea>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary">Tiến hành đặt hàng</button>
                    </form>
                </div>

                <div class="col-md-5 order-md-last">
                    <h4 class="d-flex justify-content-between align-items-center mb-4">
                        <span >Giỏ hàng</span>
                        <span class="badge bg-primary rounded-pill">${cart.size()}</span>
                    </h4>

                    <ul class="list-group mb-3">
                        <c:forEach items="${cart}" var="c">
                            <li class="list-group-item d-flex justify-content-between lh-sm">
                                <div>
                                    <h6 class="my-0">${c.product.productName}</h6>
                                    <small class="text-muted">Số lượng: ${c.quantity}</small>
                                </div>
                                <span class="text-muted price item-price" data-item-price = "${c.product.price * c.quantity}">
                                    ${c.product.price * c.quantity}
                                </span>
                            </li> 
                        </c:forEach>


                        <li class="list-group-item d-flex justify-content-between">
                            <span>Tổng: </span>
                            <strong value ="" id = "sum" class="price"></strong>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <jsp:include page="include/footer.jsp"/>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src = "resources/script/jquery-3.7.1.min.js"></script>
        <script src = "resources/script/script.js"></script>
        <script>
            $(document).ready(() => {

                function calculateSum() {
                    let total = 0;
                    $('.item-price').each(function () {
                        console.log($(this).data("item-price"));
                        let itemPrice = $(this).data("item-price");
                        total += itemPrice;
                    });
                    $('#sum').val(total);
                    $('#sum').text(total.toLocaleString('vi-VN') + ' VNĐ');
                }

                calculateSum();
                $('#order-form').on('submit', (event) => {
                    event.preventDefault();

                    //Get data from form 
                    var orderInformation = {
                        name: $('#name').val(),
                        address: $('#address').val(),
                        phone: $('#phone').val(),
                        note: $('#note').val(),
                        totalPrice: $('#sum').val()
                    };


                    $.ajax({
                        url: 'checkout',
                        type: 'POST',
                        data: orderInformation,
                        success: function (response) {
                            if (response.success) {
                                alert("Đặt hàng thành công, cảm ơn quý khách.");
                                window.location.href = "./arigatou";
                            } else {
                                alert("Đặt hàng không thành công");
                            }
                        },
                        error: function () {
                            alert('Có lỗi xảy ra, vui lòng thử lại sau');
                        }

                    });
                });
            });
        </script>
    </body>
</html>
