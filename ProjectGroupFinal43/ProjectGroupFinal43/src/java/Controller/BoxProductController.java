/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Entity.BoxProduct;
import Model.Entity.Customer;
import Model.Entity.GioHang;

import Model.Service.BoxProductService;
import Model.Service.GioHangService;
import Model.Service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author vietn
 */
public class BoxProductController extends HttpServlet {

    BoxProductService boxProductService = new BoxProductService();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BoxProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BoxProductController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            Customer customer = (Customer) session.getAttribute("account");
            getAll(customer, request, response, session);
        } else {
            request.getRequestDispatcher("Login_Form.jsp").forward(request, response);
        }

    }

    public void getAll(Customer customer, HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {
        ArrayList<BoxProduct> boxList = boxProductService.getBoxProductById(customer.getIdCustomer());
        session.setAttribute("BoxProductList", boxList);
        request.getRequestDispatcher("/Cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        switch (action) {
            case "addNew":
                addNew(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void addNew(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id = request.getParameter("idProduct");
    ProductService products = new ProductService();
    HttpSession session = request.getSession(false);
    boolean additionSuccess = false; 

    if (session != null && session.getAttribute("account") != null) {
        Customer customer = (Customer) session.getAttribute("account");
        GioHangService ghs = new GioHangService();
        GioHang gh = ghs.getGioHangByIdCus(customer.getIdCustomer());
        if (boxProductService.addNew(new BoxProduct(0, gh, products.getProductById(Integer.parseInt(id)), 1))) {
            additionSuccess = true; 
        }
    }
    request.setAttribute("myBoo", additionSuccess);
    if (additionSuccess) {
        request.getRequestDispatcher("getAllProductForCustomer.jsp").forward(request, response);
    } else {
        request.getRequestDispatcher("Login_Form.jsp").forward(request, response);
    }
}


}
