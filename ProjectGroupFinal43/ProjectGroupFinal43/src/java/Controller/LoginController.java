/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Constant.Constant;
import Model.Entity.Customer;
import Model.Service.UserService;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            response.sendRedirect(request.getContextPath() + "/waiting");
            return;
        }
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("customerIdStr")) { // Thay đổi tên cookie thành "Idcustomer"
                    session = request.getSession(true);
                    session.setAttribute("customerIdStr", cookie.getValue()); // Đặt giá trị vào thuộc tính "username"
                    response.sendRedirect(request.getContextPath() + "/waiting");
                    return;
                }

            }
        }
        request.getRequestDispatcher("Login_Form.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean isRememerMer = false;
        String remember = request.getParameter("remember");
        if ("on".equals(remember)) {
            isRememerMer = true;
        }
        String alertMsg = "";
        if (username.isEmpty() || password.isEmpty()) {
            alertMsg = "Username and password can't be empty";
            request.setAttribute("alert", alertMsg);
            request.getRequestDispatcher("Login_Form.jsp").forward(request, response);
            return;
        }
        UserService se = new UserService();
        Customer service = se.login(username, password);
        if (service != null) {
            int idCustomer = service.getIdCustomer(); // Lấy idCustomer từ đối tượng Customer
            HttpSession session = request.getSession(true);
            session.setAttribute("account", service);

            if (service.getRole_ID() == 1) {
                response.sendRedirect("Admin.jsp");
            } else if (service.getRole_ID() == 2) {
                response.sendRedirect("index.jsp");
            }

            if (isRememerMer) {
                saveRememberMe(response, idCustomer); // Truyền idCustomer vào phương thức saveRememberMe
            }
        } else {
            alertMsg = "Username or password isn't correct";
            request.setAttribute("alert", alertMsg);
            request.getRequestDispatcher("Login_Form.jsp").forward(request, response);
        }

    }
    

    private void saveRememberMe(HttpServletResponse response, int idCustomer) {
        String customerIdStr = String.valueOf(idCustomer);
        Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, customerIdStr);
        cookie.setMaxAge(30 * 60);
        response.addCookie(cookie);
    }

}
