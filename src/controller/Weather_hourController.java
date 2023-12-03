package controller;

import model.Weather_hour_record;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Weather_hourController", value = "/Weather_hourController")
public class Weather_hourController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Weather_hour_record whr = .getProductById(id);
//        List<Review> reviewList = ReviewService.getAllReviewByIdp(String.valueOf(product.getId()));
//        request.setAttribute("reviewList", reviewList);
        request.setAttribute("product", product);
        request.getRequestDispatcher("detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
