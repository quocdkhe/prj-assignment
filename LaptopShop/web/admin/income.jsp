<%-- 
    Document   : income
    Created on : Sep 30, 2024, 11:32:14 AM
    Author     : Quoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/bootstrap-5.3.3-dist/css/sidebars.css">
    <body>

        <main class="d-flex flex-nowrap">
            <jsp:include page="template/sidebar.jsp" />
            <div class="container mt-5">
                <h3>Thống kê</h3>
                <canvas id="salesChart" width="400" height="200"></canvas>
            </div>
        </main>

        <script src="resources/bootstrap-5.3.3-dist/js/sidebar.js"></script>
        <script src="resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
        <script src = "resources/script/jquery-3.7.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            $(document).ready(function () {
                // Gọi AJAX để lấy dữ liệu từ server
                $.ajax({
                    url: 'get-statistics-data', // URL để lấy dữ liệu
                    method: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        // Tạo nhãn và dữ liệu cho biểu đồ
                        var labels = [];
                        var sales = [];

                        // Duyệt qua dữ liệu nhận được
                        $.each(data, function (month_year, total) {
                            labels.push(month_year);
                            sales.push(total);
                            console.log(month_year + " : " + total);
                        });

                        // Vẽ biểu đồ
                        drawChart(labels, sales);
                    },
                    error: function (xhr, status, error) {
                        console.error('Đã xảy ra lỗi: ', error);
                    }
                });
            });

            // Hàm vẽ biểu đồ
            function drawChart(labels, sales) {
                var ctx = document.getElementById('salesChart').getContext('2d');
                var chart = new Chart(ctx, {
                    type: 'bar', // Kiểu biểu đồ
                    data: {
                        labels: labels, // Nhãn là tháng/năm
                        datasets: [{
                                label: 'Doanh số bán hàng theo tháng',
                                data: sales, // Dữ liệu doanh số
                                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                borderColor: 'rgba(54, 162, 235, 1)',
                                borderWidth: 1
                            }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    callback: function (value) {
                                        return value + ' triệu đồng';
                                    }
                                }
                            }
                        }
                    }
                });
            }
        </script>
    </body>
</html>
