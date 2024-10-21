<%-- 
    Document   : cart
    Created on : Oct 17, 2024, 9:45:06 AM
    Author     : Quoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí giỏ hàng</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/footer.css">
    </head>
    <body>
        <jsp:include page="include/header.jsp"/>
        <div class="container">
            <h3 class="mb-3">Giỏ hàng</h3>
            <table class="mb-3 table table-stripped">
                <thead>
                    <tr>
                        <th><input id="check-all" type="checkbox" class="form-check-input"></th>
                        <th>Tên sản phẩm</th>
                        <th>Đơn giá</th>
                        <th>Số lượng</th>
                        <th>Tổng</th>
                        <th></th>
                    </tr>

                </thead>
                <tbody>
                    <c:forEach items="${cart}" var="item">
                        <tr>
                            <td><input type="checkbox" data-product-id="${item.product.id}" class="checkbox form-check-input" ${item.isSelected == 1 ? 'checked' : ''}></td>
                            <td>${item.product.productName}</td>
                            <td class="price unit-price">${item.product.price}</td>
                            <td><input data-item-id="${item.id}" data-product-id ="${item.product.id}" data-unit-price="${item.product.price}" style="width:65px;" type="number" class="form-control quantity" value="${item.quantity}"></td>
                            <td class="sum-price">${item.product.price * item.quantity}</td>
                            <td><button class="btn btn-danger delete-btn" data-item-id="${item.id}">Xoá</button></td>
                        </tr>
                        <c:set value="${index+1}" var="index"/>
                    </c:forEach>
                    <tr class="text-center">
                        <td colspan="3">
                            <a href="./search-product?categorySelect=1" class="btn btn-primary">Mua thêm sản phẩm khác</a>
                            <a href="./checkout" class="btn btn-success">Thanh toán</a>
                        </td>
                        <td colspan="2">
                            <strong>Thành tiền: </strong><span id="total-price"></span>
                        </td>
                    </tr>
                </tbody>
            </table>

        </div>
        <jsp:include page="include/footer.jsp"/>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src = "resources/script/jquery-3.7.1.min.js"></script>
        <script src = "resources/script/script.js"></script>
        <script>
            $(document).ready(function () {

                function formatPrice(price) {
                    return price.toLocaleString('vi-VN') + ' VNĐ';
                }

                function calculatePrices() {
                    let totalPrice = 0;
                    // Loop through each quantity input field
                    $('.quantity').each(function () {
                        // Get the unit price stored in a data attribute
                        let unitPrice = $(this).data("unit-price");
                        let quantity = $(this).val();
                        let isSelected = $(this).closest('tr').find('.checkbox').prop('checked');

                        // Calculate the sum price
                        let sumPrice = unitPrice * quantity;
                        // Update the sum-price cell for this row
                        $(this).closest('tr').find('.sum-price').text(formatPrice(sumPrice));

                        // Add the sum price to the total price
                        if (isSelected === true) {
                            totalPrice += sumPrice;
                            console.log("I have added: " + sumPrice);
                        }
                    });
                    // Update the total price in the UI
                    $('#total-price').text(totalPrice.toLocaleString('vi-VN') + ' VNĐ');
                }

                calculatePrices();
                /**
                 * 
                 * @param {type} cell is the delete button
                 * @returns {undefined}
                 */
                function deleteAnOrder(cell) {
                    $.ajax({
                        url: 'update-cart',
                        type: 'POST',
                        data: {
                            action: 'delete',
                            itemId: $(cell).data("item-id")
                        },
                        success: function (response) {
                            if (response.success) {
                                cell.closest('tr').remove();
                                calculatePrices();
                            } else {
                                alert('Lỗi');
                            }
                            console.log($('.quantity').length);
                        },
                        error: function () {
                            alert('Lỗi kết nối đến server, vui lòng thử lại sau');
                        }
                    });
                }


                $('#check-all').change(function () {
                    var checkAll = $(this).prop('checked'); // Get the checked state of the "Check All" checkbox
                    $('.checkbox').each(function () {
                        $(this).prop('checked', checkAll).trigger('change'); // Set the checked state for each checkbox and trigger 'change'
                    });
                });

                $('.checkbox').change(function () {

                    var isSelected = $(this).prop('checked') === true ? '1' : '0';
                    var productId = $(this).data('product-id');

                    $.ajax({
                        url: 'update-cart',
                        type: 'POST',
                        data: {
                            action: 'change-selected',
                            isSelected: isSelected,
                            productId: productId
                        },
                        success: function (response) {
                            if (response.success) {
                                console.log('change selected, fired !');
                            }
                        },
                        error: function () {
                            alert('Đã có lỗi xảy ra');
                        }
                    });
                    // Check if all checkboxes are selected
                    if ($('.checkbox:checked').length === $('.checkbox').length) {
                        $('#check-all').prop('checked', true); // If all are checked, check the "Check All" checkbox
                    } else {
                        $('#check-all').prop('checked', false); // If not all are checked, uncheck the "Check All" checkbox
                    }
                    calculatePrices();
                });


                $('.quantity').change(function () {
                    var productId = $(this).data("product-id");
                    var quantity = $(this).val();
                    var quantityCell = $(this);
                    if (quantity === '0') {
                        if (window.confirm('Bạn có muốn xoá mục này ? ')) {
                            deleteAnOrder(quantityCell);
                        } else {
                            quantityCell.val('1');
                        }
                        return;
                    }
                    calculatePrices(); //Sau khi người dùng thay đổi thông tin quantity, 
                    //chúng ta cần phải tính lại tổng giá tiền
                    // Phần dưới để tương tác với database
                    $.ajax({
                        url: 'update-cart',
                        type: 'POST',
                        data: {
                            action: 'change-quantity',
                            productId: productId,
                            quantity: quantity
                        },
                        success: function (response) {
                            if (response.success) {
//                                console.log('done');
                            } else {
                                quantityCell.val(response.stockUnits);
                                alert(response.message);
                            }
                        },
                        error: function () {
                            alert('Lỗi kết nối đến server, vui lòng thử lại sau.');
                        }
                    });
                });

                $('.delete-btn').click(function () {
                    var thisCell = $(this);
                    if (window.confirm('Bạn có muốn xoá mục này ?')) {
                        deleteAnOrder(thisCell);
                    }
                });
            });
        </script>
    </body>
</html>
