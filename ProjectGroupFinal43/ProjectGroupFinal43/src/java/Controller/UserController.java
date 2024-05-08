/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Entity.Customer;
import Model.Entity.GioHang;

import Model.Repository.GioHangRepository;
import Model.Repository.UserRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author Bravo
 */
public class UserController extends HttpServlet {

     UserRepository userDao = new UserRepository();

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "list":
                    listCustomers(request, response);
                    break;
                case "delete":
                    deleteCustomer(request, response);
                    break;
                case "edit":
                    updateCustomer(request, response);
                    break;
                case "edit1":
                    updateCustomer1(request, response);
                    break;
                // Add more cases for other actions if needed
            }
        }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {

                case "insert":
                    insertCustomer(request, response);
                    break;
                // Add more cases for other actions if needed
            }
        }
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Extract form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phoneNumber");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        String cccd = request.getParameter("cccd");

        // Set default value for role
        int role = 2; // Mặc định role là 2

        // Create a Customer object with the provided information
        Customer newCustomer = new Customer();
        newCustomer.setNameCustomer(name);
        newCustomer.setEmailCustomer(email);
        newCustomer.setPassWordCustomer(password);
        newCustomer.setNumPhoneCustomer(phoneNumber);
        newCustomer.setAgeCustomer(age);
        newCustomer.setAddressCustomer(address);
        newCustomer.setCccdCustomer(cccd);
        newCustomer.setRole_ID(role);

        // Call the DAO method to insert the new customer
        userDao.addCustomer(newCustomer);
        int newCustomerId = newCustomer.getIdCustomer();

        // Create a new cart for the newly created customer with the same ID
        GioHang newCart = new GioHang();
        newCart.setIdGioHang(newCustomerId);  // Set the ID of the new cart
        GioHangRepository gh = new GioHangRepository();
        // Call the DAO method to insert the new cart
        gh.addNew(newCart);
        // Redirect back to the customer list page
        response.sendRedirect("Login_Form.jsp");
    }

   private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Extract form parameters
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phoneNumber = request.getParameter("phoneNumber");
    String ageString = request.getParameter("age");
    String address = request.getParameter("address");
    String cccd = request.getParameter("cccd");
    int customerId = 0;

    // Kiểm tra nếu id có tồn tại và không rỗng
    if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
        customerId = Integer.parseInt(request.getParameter("id"));
    }

    // Kiểm tra trường age có giá trị không
    int age = 0; // Giá trị mặc định
    if (ageString != null && !ageString.isEmpty()) {
        age = Integer.parseInt(ageString);
    }

    // Role ID cứng là 2
    int role = 2;

    // Tạo đối tượng Customer với thông tin cập nhật
    Customer updatedCustomer = new Customer(customerId, name, email, password, phoneNumber, age, address, cccd, role);

    // Gọi phương thức DAO để cập nhật thông tin khách hàng
    userDao.updateCustomer(updatedCustomer);

    // Chuyển hướng lại trang cập nhật thông tin khách hàng
    request.getRequestDispatcher("update-user.jsp").forward(request, response);
}

    private void updateCustomer1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Extract form parameters
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phoneNumber = request.getParameter("phoneNumber");
    String ageString = request.getParameter("age");
    int age = 0;
    if (ageString != null && !ageString.isEmpty()) {
        age = Integer.parseInt(ageString);
    }
    String address = request.getParameter("address");
    String cccd = request.getParameter("cccd");
    int role = 2; // Mặc định role là 2
    String customerIdString = request.getParameter("id");
    int customerId = 0;
    if (customerIdString != null && !customerIdString.isEmpty()) {
        customerId = Integer.parseInt(customerIdString);
    }

    // Create a Customer object with the updated information
    Customer updatedCustomer = new Customer(customerId, name, email, password, phoneNumber, age, address, cccd, role);

    // Call the DAO method to update the customer
    userDao.updateCustomer(updatedCustomer);

    // Redirect back to the customer list page
//    request.getRequestDispatcher("update-user.jsp").forward(request, response);
    response.sendRedirect("Admin.jsp");
}


    private void listCustomers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = userDao.getAllCustomers();
        request.setAttribute("customers", customers); // Set the attribute name correctly
        request.getRequestDispatcher("customer-list.jsp").forward(request, response);
    }

//    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int customerId = Integer.parseInt(request.getParameter("id"));
//        Customer customer = userDao.get(customerId);
//        request.setAttribute("customer", customer);
//        request.getRequestDispatcher("update-user.jsp").forward(request, response);
//    }
    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerId = Integer.parseInt(request.getParameter("id"));
        userDao.deleteCustomer(customerId);
        response.sendRedirect("UserController?action=list");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
