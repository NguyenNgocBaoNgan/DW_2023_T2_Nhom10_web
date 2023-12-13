<%@ page import="java.util.List" %>
<%@ page import="model.Weather_day_record" %>
<%@ page import="Service.WeatherMartService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Weather</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Roboto:wght@100;300;400;500;700&display=swap"
            rel="stylesheet">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="icon" href="css/weather_web_icon.jpg" type="image/x-icon" />
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css"
          integrity="sha512-oAvZuuYVzkcTc2dH5z1ZJup5OmSQ000qlfRvuoTTiyTBjwX1faoyearj8KdMq0LgsBTHMrRuMek7s+CxF8yE+w=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>

<%@ page import="java.util.List" %>
<%@ page import="model.Weather_day_record" %>
<div class="container">

    <!-- Check if the user is still on the web page and make AJAX calls if needed -->
    <script>
        // Add your AJAX calls here
    </script>

    <div class="row" >

        <div class="col-md-2 left_content pt-10" >
            <ul class="province_list" >
                <li class="active" >
                    <i class="fa fa-map-marker" ></i >
                    <a href = "#" class="weather_city" >
                        TP.Hồ Chí Minh
                    </a >
                </li >
                <li >
                    <i class="fa fa-map-marker" ></i >
                    <a href = "#" class="weather_city" >
                        Thừa Thiên Huế
                    </a >
                </li >
                <li >
                    <i class="fa fa-map-marker" ></i >
                    <a href = "#" class="weather_city" >
                        Đồng Nai
                        </a >
                </li >
                <li >
                    <i class="fa fa-map-marker" ></i >
                    <a href = "#" class="weather_city" >
                        Vũng Tàu
                        </a >
                </li >
                <li >
                    <i class="fa fa-map-marker" ></i >
                    <a href = "#" class="weather_city" >
                        Đà Nẵng
                        </a >
                </li >
                <li >
                    <i class="fa fa-map-marker" ></i >
                    <a href = "#" class="weather_city" >
                        Quảng Nam
                        </a >
                </li >
                <li >
                    <i class="fa fa-map-marker" ></i >
                    <a href = "#" class="weather_city" >
                        Quảng Trị
                        </a >
                </li >
                <li >
                    <i class="fa fa-map-marker" ></i >
                    <a href = "#" class="weather_city" >
                        Bắc Ninh
                        </a >
                </li >
                <li >
                    <i class="fa fa-map-marker" ></i >
                    <a href = "#" class="weather_city" >
                        Bắc Kạn
                        </a >
                </li >
                <li >
                    <i class="fa fa-map-marker" ></i >
                    <a href = "#" class="weather_city" >
                        Bình Dương
                        </a >
                </li >
                <li >
                    <i class="fa fa-map-marker" ></i >
                    <a href = "#" class="weather_city" >
                        Tây Ninh
                        </a >
                </li >
                <li >
                    <i class="fa fa-map-marker" ></i >
                    <a href = "#" class="weather_city" >
                        Phú Yên
                        </a >
                </li >
                <li >
                    <i class="fa fa-map-marker" ></i >
                    <a href = "#" class="weather_city" >
                        Quảng Ngãi
                        </a >
                </li >
                <li >
                    <i class="fa fa-map-marker" ></i >
                    <a href = "#" class="weather_city" >
                        Long An
                        </a >
                </li >
                <li >
                    <i class="fa fa-map-marker" ></i >
                    <a href = "#" class="weather_city" >
                        Tiền Giang
                        </a >
                </li >
                <li >
                    <i class="fa fa-arrow-down" ></i >
                    <a href = "#" class="weather_city" >
                        Xem thêm
                        </a >
                </li >


            </ul >
        </div >
        <div class="col-md-6 center_content" >
            <div class="top_component" >
                <div class="date col-4" >
                    <span class="month_and_year font-weight-bold" > Tháng 10 / 2023 </span > <br >
                    <span class="full_date" > Thứ bảy, 20 / 10 / 2023 </span >
                </div >
                <div class="search col-8" >
                    <i class="fa fa-search text-secondary" ></i >
                    <input type = "text" class="text-secondary" placeholder = "Tìm kiếm..." >
                    <i class="fa fa-map-marker text-secondary" ></i >
                </div >
            </div >
            <div class="quick_access row mt-3" >
                <%
                    List<Weather_day_record> dataList = (List<Weather_day_record>)request.getAttribute("weatherDataList");
                    if (dataList == null || dataList.isEmpty()) {
                %>
                <div>No data found</div>
                <%
                    } else {
                        // Display your data here
                        for (Weather_day_record data : dataList) { %>

                <div class="city_temp col-md-2 active" onclick="window.location.href='detail?id=<%=data.getId()%>'">
                    <span class="time" > <%=data.getTime_record()%> - <%=data.getDate_record()%> </span >
                    <span class="temp font-weight-bold" > <%=data.getTemperature()%> &deg;C
                </span >
                    <span class="city font-weight-bold" > <%=data.getDescription()%></span >
                    <span class="city" > UV:<%=data.getFeel_like()%> </span >
                </div >
<

        <%}
        }

        %>
                <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
                <script>
                    $(document).ready(function () {
                        // Hàm để thực hiện AJAX request và cập nhật dữ liệu trang
                        function updateWeatherData() {
                            $.ajax({
                                type: "POST",
                                url: "/WeatherController", // Đặt URL của servlet hoặc controller của bạn ở đây
                                dataType: "json", // Kì vọng dữ liệu JSON từ máy chủ
                                success: function (data) {
                                    // Kiểm tra xem có dữ liệu mới hay không
                                    if (data.length > 0) {
                                        // Hiển thị dữ liệu mới
                                        $(".quick_access").empty(); // Xóa nội dung cũ

                                        $.each(data, function (index, newData) {
                                            // Xây dựng HTML cho mỗi phần tử dữ liệu mới
                                            var newElement = $("<div class='city_temp col-md-2 active' onclick='window.location.href=\"detail?id=" + newData.id + "\"'>" +
                                                "<span class='time'>" + newData.time_record + " - " + newData.date_record + "</span>" +
                                                "<span class='temp font-weight-bold'>" + newData.temperature + " &deg;C</span>" +
                                                "<span class='city font-weight-bold'>" + newData.description + "</span>" +
                                                "<span class='city'>UV:" + newData.feel_like + "</span>" +
                                                "</div>");

                                            // Thêm phần tử mới vào .quick_access
                                            $(".quick_access").append(newElement);
                                        });
                                    } else {
                                        // Nếu không có dữ liệu mới, có thể thực hiện các xử lý khác hoặc báo cáo
                                        console.log("No new data found");
                                    }
                                },
                                error: function (error) {
                                    console.error("Error:", error);
                                }
                            });
                        }

                        // Gọi hàm cập nhật sau mỗi 5 giây
                        setInterval(updateWeatherData, 5000);
                    });
                </script>

                
            </div>

            <h5 class="over_view_text">Tổng quan</h5>
            <div class="over_view_div">
                <div class="attibute_popular col-md-5">
                        <span class="attribute_txt">
                           Tốc độ gió
                        </span>
                    <div class="value_attribute">
                        <i class="bi bi-wind"></i>
                        <span class="vl_text">+ 12 Km/h</span>
                    </div>
                    <div class="value_attribute">
                        <span>+ 12 Km/h</span>
                        <span class="vl_text">Gió Tây Nam</span>
                    </div>
                </div>
                <div class="attibute_popular col-md-5">
                        <span class="attribute_txt">
                           Nhiệt độ
                        </span>
                    <div class="value_attribute">
                        <i class="bi bi-thermometer-half"></i>
                        <span class="vl_text">33&deg;</span>
                    </div>
                    <div class="value_attribute">
                        <span>33&deg;</span>
                        <span class="vl_text">Nắng</span>
                    </div>
                </div>
                <div class="attibute_popular col-md-5">
                        <span class="attribute_txt">
                          Chỉ số UV
                        </span>
                    <div class="value_attribute">
                        <i class="bi bi-brightness-high"></i>
                        <span class="vl_text">0/11</span>
                    </div>
                    <div class="value_attribute">
                        <span>0/11</span>
                        <span class="vl_text">Bình thường</span>
                    </div>
                </div>
                <div class="attibute_popular col-md-5">
                        <span class="attribute_txt">
                          Lượng mưa
                        </span>
                    <div class="value_attribute">
                        <i class="bi bi-cloud-rain-heavy"></i>
                        <span class="vl_text">+ 12 Km/h</span>
                    </div>
                    <div class="value_attribute">
                        <span>0 cm</span>
                        <span class="vl_text">Không mưa</span>
                    </div>
                </div>


            </div>
        </div>
<%--        Right--%>
        <div class="col-md-4 right_content">
            <p class="text-center mt-3">19:00 - 20/11</p>
            <p class="text-center">Thành phố Hồ Chí Minh</p>
            <div class="text-center mt-5">
                <div class="d-flex flex-row justify-content-center">
                    <div class="text-center me-3">
                        <span><i class="bi bi-cloud-drizzle-fill fs-1"></i></span>
                    </div>
                    <div class="">
                        <div class="temperature">
                            <span class="value">25&deg;C</span>
                        </div>
                        <p class="text-start text-secondary">Trời mưa</p>
                    </div>
                </div>
                <div class="px-3 mt-5">
                    <div class="col-12 row justify-content-between row mt-3 px-3">
                        <div class="col-7 text-secondary text-start"><i class="bi bi-thermometer-half"></i></span> Cảm giác nhiệt: </div>
                        <div class="col-5 text-secondary text-end">33&deg;</div>
                    </div>
                    <hr>
                    <div class="col-12 row justify-content-between row mt-3 px-3">
                        <div class="col-7 text-secondary text-start"><i class="bi bi-cloud"></i></span> Trạng thái: </div>
                        <div class="col-5 text-secondary text-end">Nhiều mây</div>
                    </div>
                    <hr>
                    <div class="col-12 row justify-content-between row mt-3 px-3">
                        <div class="col-7 text-secondary text-start"><i class="bi bi-cloud-fog2"></i></span> Hướng gió: </div>
                        <div class="col-5 text-secondary text-end">TTB</div>
                    </div>
                    <hr>
                    <div class="col-12 row justify-content-between row mt-3 px-3">
                        <div class="col-7 text-secondary text-start"><i class="bi bi-wind"></i></span> Tốc độ gió: </div>
                        <div class="col-5 text-secondary text-end">2km/h</div>
                    </div>
                    <hr>
                    <div class="col-12 row justify-content-between row mt-3 px-3">
                        <div class="col-7 text-secondary text-start"><i class="bi bi-droplet"></i></span> Độ ẩm: </div>
                        <div class="col-5 text-secondary text-end">93%</div>
                    </div>
                    <hr>
                    <div class="col-12 row justify-content-between row mt-3 px-3">
                        <div class="col-7 text-secondary text-start"><i class="bi bi-brightness-high"></i></span> Chỉ số UV: </div>
                        <div class="col-5 text-secondary text-end">0/11</div>
                    </div>
                    <hr>
                    <div class="col-12 row justify-content-between row mt-3 px-3">
                        <div class="col-7 text-secondary text-start"><span><i class="bi bi-cloud-rain-heavy"></i></span> Lượng mưa: </div>
                        <div class="col-5 text-secondary text-end">0 cm</div>
                    </div>
                    <hr>
                </div>

            </div>
        </div>
    </div>


</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>