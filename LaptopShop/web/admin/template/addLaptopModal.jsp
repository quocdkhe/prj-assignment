<%-- 
    Document   : productDetailModal
    Created on : Oct 3, 2024, 1:39:33 PM
    Author     : Quoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal"
        data-bs-target="#addLaptopPCModal">
    Thêm mới PC, Laptop
</button>
<form style="display:inline-block" method="post" action="product-manager" enctype="multipart/form-data">
    <input type="hidden" name="add" value="addLaptop"/>
    <!-- Modal -->
    <div class="modal fade" id="addLaptopPCModal" tabindex="-1"
         aria-labelledby="addLaptopPCModalLabel" aria-hidden="true">

        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="addLaptopPCModalLabel">Thêm mới PC, Laptop,
                        Máy đồng bộ</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-8">
                            <label class="form-label" for="productName">Tên sản phẩm</label>
                            <input class="form-control" type="text" id="productName"
                                   name="productName">
                        </div>
                        <div class="col-md-4">
                            <label class="form-label" for="price">Đơn giá</label>
                            <input class="form-control" type="number" id="price" name="price">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <label for="brand" class="form-label">Hãng sản xuất</label>
                            <select name="brand" id="brand" class="form-select">
                                <c:forEach items="${brandList}" var="b">
                                    <option value="${b.id}">${b.brandName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="cpu" class="form-label">CPU</label>
                            <input type="text" id="cpu" name="cpu" class="form-control">
                        </div>
                        <div class="col-md-3">
                            <label for="ram" class="form-label">RAM</label>
                            <input type="text" id="ram" name="ram" class="form-control">
                        </div>
                        <div class="col-md-3">
                            <label for="vga" class="form-label">VGA</label>
                            <input type="text" id="vga" name="vga" class="form-control">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <label for="hardDrive" class="form-label">Lưu trữ</label>
                            <input type="text" id="hardDrive" name="hardDrive" class="form-control">
                        </div>
                        <div class="col-md-3">
                            <label for="screen" class="form-label">Màn hình</label>
                            <input type="text" id="screen" name="screen" class="form-control">
                        </div>
                        <div class="col-md-3">
                            <label for="design" class="form-label">Thiết kế</label>
                            <input type="text" id="design" name="design" class="form-control">
                        </div>
                        <div class="col-md-3">
                            <label for="os" class="form-label">Hệ điều hành</label>
                            <input type="text" id="os" name="os" class="form-control">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <label for="info" class="form-label">Thông tin chung</label>
                            <textarea id="info" name="info" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <label for="battery" class="form-label">Dung lượng pin</label>
                            <input type="text" id="battery" name="battery" class="form-control">
                        </div>
                        <div class="col-md-4">
                            <label for="warranty" class="form-label">Bảo hành</label>
                            <input type="text" id="warranty" name="warranty" class="form-control">
                        </div>
                        <div class="col-md-4">
                            <label for="stock" class="form-label">Đơn vị kho</label>
                            <input type="number" id="stock" name="stock" class="form-control">
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="image">Hình ảnh</label>
                            <input type="file" id="image" name="image" class="form-control-file">
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                            data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Thêm</button>
                </div>
            </div>
        </div>
    </div>
</form>
