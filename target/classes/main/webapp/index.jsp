<%@ page import="java.util.List" %>
<%@ page import="model.Weather_day_record" %>
<%@ page import="Service.WeatherMartService" %>

<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.Locale" %>
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
<%@ page import="model.Weather_hour_record" %>
<div class="container">

    <div class="row" >


        <div class="col-md-2 left_content pt-10" >
            <%
                List<Weather_day_record> dataList1 = (List<Weather_day_record>)request.getAttribute("weatherDataList");
                if (dataList1 == null || dataList1.isEmpty()) {
            %>
            <div>No data found</div>
            <%
            } else {%>

            <ul class="province_list">

                <% for (Weather_day_record data1 : dataList1) { %>
                <li onclick="window.location.href='WeatherController?province=<%=data1.getProvince()%>&id=<%=data1.getId()%>'">
                    <i class="fa fa-map-marker" ></i >
                    <a href = "#" class="weather_city" >
                        <%=data1.getProvince()%>
                    </a >
                </li >
                <%}
                }
                %>
            </ul >

        </div >
        <%
            // Lấy ngày và giờ hiện tại
            LocalDate currentDate = LocalDate.now();

            // Định dạng ngày
            DateTimeFormatter monthYearFormat = DateTimeFormatter.ofPattern("'Tháng' MM / yyyy", new Locale("vi"));
            DateTimeFormatter fullDateFormat = DateTimeFormatter.ofPattern("EEEE, dd / MM / yyyy", new Locale("vi"));
            DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern("HH:mm:ss");

            String formattedMonthYear = currentDate.format(monthYearFormat);
            String formattedFullDate = currentDate.format(fullDateFormat);
            String formattedTime = currentDate.atStartOfDay().format(timeFormat);
        %>
        <div class="col-md-6 center_content" >
            <div class="top_component" >
                <div class="date col-4">
                    <span class="month_and_year font-weight-bold"><%= formattedMonthYear %></span><br>
                    <span class="full_date"><%= formattedFullDate %></span><br>
<%--                    <span class="current_time">Giờ hiện tại: <%= formattedTime %></span>--%>
                </div>
                <div class="search col-8" >
                    <i class="fa fa-search text-secondary" ></i >
                    <input type = "text" class="text-secondary" placeholder = "Tìm kiếm..." >
                    <i class="fa fa-map-marker text-secondary" ></i >
                </div >
            </div >

            <div class="quick_access row mt-3" >
                <%
                    List<Weather_hour_record> dataList = (List<Weather_hour_record>)request.getAttribute("whr_byProvince");
                    if (dataList == null || dataList.isEmpty()) {
                %>
                <div>No data found</div>
                <%
                } else {
                    // Display your data here
                    for (Weather_hour_record data : dataList) { %>

                <div class="city_temp col-md-2 active" onclick="window.location.href='detail?id=<%=data.getId()%>'">
                    <span class="time" > <%=data.getTime_forcast()%> - <%=data.getDate_forcast()%> </span >
                    <span class="temp font-weight-bold" > <%=data.getTemperature()%> &deg;C
                </span >
                    <span class="city font-weight-bold" > <%=data.getDescription()%></span >
                    <span class="city" > UV:<%=data.getFeel_like()%> </span >
                </div >


        <%}
        }

        %>
                <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
                <script>
                    $(document).ready(function () {
                        // Hàm để thực hiện AJAX request và cập nhật dữ liệu trang
                        function updateWeatherData(province) {
                            $.ajax({
                                type: "POST",
                                url: "/WeatherController",
                                data: { province: province }, // Thêm tham số "province" vào dữ liệu của yêu cầu
                                dataType: "json",
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
                                        // Nếu không có dữ liệu mới, thực hiện báo cáo
                                        console.log("No new data found");
                                    }
                                },
                                error: function (error) {
                                    console.error("Error:", error);
                                }
                            });
                        }

                        // Gọi hàm cập nhật sau mỗi 3 tiếng
                        setInterval(function () {
                            // Lấy giá trị province từ dataList1
                            var province = '<%=dataList1.get(0).getProvince()%>';
                            updateWeatherData(province);
                        }, 10800);
                    });
                </script>


            </div>

            <h5 class="over_view_text">Tổng quan</h5>
            <div class="over_view_div">
                <div class="attibute_popular col-md-5">
                        <span class="attribute_txt">
                           Độ mây che phủ
                        </span>
                    <div class="value_attribute">
                        <i class="bi bi-wind"></i>
                        <span class="vl_text"><%=dataList1.get(0).getCloud_cover()%>%</span>
                    </div>
                    <div class="value_attribute">
                        <span><%=dataList1.get(0).getCloud_cover()%>%</span>
                        <span class="vl_text">Gió Tây Nam</span>
                    </div>
                </div>
                <div class="attibute_popular col-md-5">
                        <span class="attribute_txt">
                           Nhiệt độ
                        </span>
                    <div class="value_attribute">
                        <i class="bi bi-thermometer-half"></i>
                        <span class="vl_text"><%=dataList1.get(0).getTemperature()%>&deg;</span>
                    </div>
                    <div class="value_attribute">
                        <span><%=dataList1.get(0).getTemperature()%>&deg;</span>
                        <span class="vl_text">Nắng</span>
                    </div>
                </div>
                <div class="attibute_popular col-md-5">
                        <span class="attribute_txt">
                          Độ ẩm
                        </span>
                    <div class="value_attribute">
                        <i class="bi bi-brightness-high"></i>
                        <span class="vl_text"><%=dataList1.get(0).getHumidity()%></span>
                    </div>
                    <div class="value_attribute">
                        <span><%=dataList1.get(0).getHumidity()%></span>
                        <span class="vl_text">Bình thường</span>
                    </div>
                </div>
                <div class="attibute_popular col-md-5">
                        <span class="attribute_txt">
                          Lượng mưa
                        </span>
                    <div class="value_attribute">
                        <i class="bi bi-cloud-rain-heavy"></i>
                        <span class="vl_text"><%=dataList1.get(0).getAccumulation()%>cm</span>
                    </div>
                    <div class="value_attribute">
                        <span><%=dataList1.get(0).getAccumulation()%>cm</span>
                        <span class="vl_text">Không mưa</span>
                    </div>
                </div>


            </div>
        </div>
<%--        Right--%>
        <%

            Weather_hour_record w = dataList.get(0);

        %>
        <div class="col-md-4 right_content">
            <p class="text-center mt-3"><%=w.getTime_forcast()%> - <%=w.getDate_forcast()%></p>
            <p class="text-center"><%=w.getProvince()%></p>
            <div class="text-center mt-5">
                <div class="d-flex flex-row justify-content-center">
                    <div class="text-center me-3">
                        <span><i class="bi bi-cloud-drizzle-fill fs-1"></i></span>
                    </div>
                    <div class="">
                        <div class="temperature">
                            <span class="value"><%=w.getTemperature()%>&deg;C</span>
                        </div>
                        <p class="text-start text-secondary"><%=w.getDescription()%></p>
                    </div>
                </div>
                <div class="px-3 mt-5">
                    <div class="col-12 row justify-content-between row mt-3 px-3">
                        <div class="col-7 text-secondary text-start"><i class="bi bi-thermometer-half"></i></span> Cảm giác nhiệt: </div>
                        <div class="col-5 text-secondary text-end"><%=w.getFeel_like()%>&deg;</div>
                    </div>
                    <hr>
                    <div class="col-12 row justify-content-between row mt-3 px-3">
                        <div class="col-7 text-secondary text-start"><i class="bi bi-cloud"></i></span> Trạng thái: </div>
                        <div class="col-5 text-secondary text-end">Nhiều mây </div>
                    </div>
                    <hr>
                    <div class="col-12 row justify-content-between row mt-3 px-3">
                        <div class="col-7 text-secondary text-start"><i class="bi bi-cloud-fog2"></i></span> Hướng gió: </div>
                        <div class="col-5 text-secondary text-end"><%=w.getWind_direction()%></div>
                    </div>
                    <hr>
                    <div class="col-12 row justify-content-between row mt-3 px-3">
                        <div class="col-7 text-secondary text-start"><i class="bi bi-wind"></i></span> Tốc độ gió: </div>
                        <div class="col-5 text-secondary text-end"><%=w.getWind_speed()%>km/h</div>
                    </div>
                    <hr>
                    <div class="col-12 row justify-content-between row mt-3 px-3">
                        <div class="col-7 text-secondary text-start"><i class="bi bi-droplet"></i></span> Độ ẩm: </div>
                        <div class="col-5 text-secondary text-end"><%=w.getHumidity()%>%</div>
                    </div>
                    <hr>
                    <div class="col-12 row justify-content-between row mt-3 px-3">
                        <div class="col-7 text-secondary text-start"><i class="bi bi-brightness-high"></i></span> Chỉ số UV: </div>
                        <div class="col-5 text-secondary text-end"><%=w.getUv_index()%></div>
                    </div>
                    <hr>
                    <div class="col-12 row justify-content-between row mt-3 px-3">
                        <div class="col-7 text-secondary text-start"><span><i class="bi bi-cloud-rain-heavy"></i></span> Lượng mưa: </div>
                        <div class="col-5 text-secondary text-end"><%=w.getAccumulation()%> cm</div>
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