<%-- 
    Document   : footer
    Created on : Sep 29, 2024, 3:00:34 PM
    Author     : Quoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<br/>
<div class="b-example-divider"></div>
<div class="container mt-3">
    <footer class="py-5">
        <div class="row">
            <div class="col-md-6 col-md-2 mb-3">
                <img src="resources/images/da-thong-bao-bo-cong-thuong.png" alt="alt"/>
            </div>

            <div class="col-md-5 offset-md-1 mb-3">
                <form>
                    <h5>Hãy cho chúng tôi biết bạn nghĩ gì về chất lượng dịch vụ</h5> 
                    <p>Nhập email dưới đây để gửi feedback cho chúng tôi</p>
                    <div class="d-flex flex-column flex-sm-row w-100 gap-2">
                        <label for="email" class="visually-hidden">Nhập địa chỉ email</label>
                        <input id="email" type="text" class="form-control" placeholder="Địa chỉ email của bạn">
                        <button id="send-feedback" class="btn btn-primary" type="button">Gửi</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="d-flex flex-column flex-sm-row justify-content-between py-4 my-4 border-top">
            <p>&copy; 2024 LaptopShop, Inc. quocdk-dhfpt. All rights reserved.</p>
            <ul class="list-unstyled d-flex">
                <li class="ms-3"><a class="link-body-emphasis" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#twitter"/></svg></a></li>
                <li class="ms-3"><a class="link-body-emphasis" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#instagram"/></svg></a></li>
                <li class="ms-3"><a class="link-body-emphasis" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#facebook"/></svg></a></li>
            </ul>
        </div>
    </footer>
</div>

