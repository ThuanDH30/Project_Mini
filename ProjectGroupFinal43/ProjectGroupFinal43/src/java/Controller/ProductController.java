/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Entity.Category;
import Model.Entity.Customer;
import Model.Entity.Product;
import Model.Service.CategoryService;
import Model.Service.ProductService;
import jakarta.servlet.RequestDispatcher;
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
public class ProductController extends HttpServlet {

    ArrayList<Product> productList = new ArrayList<>();

    ProductService productService = new ProductService();
    CategoryService categoryService = new CategoryService();

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
            out.println("<title>Servlet ProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            Customer customer = (Customer) session.getAttribute("account");
            if(customer.getRole_ID() == 1){
                getAll(request, response);
            } else{
                getAllForCustomer(request, response);
            }
        } else {
            request.getRequestDispatcher("Login_Form.jsp").forward(request, response);
        }
    }

    public void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        productList.clear();
        ArrayList<Product> productss = productService.getAllProducts();
        for (Product allProduct : productss) {
            if (allProduct.getQuantity() != 0) {
                productList.add(allProduct);
            }
        }
        System.out.println("Size of productList: " + productList.size());
        request.setAttribute("productList", productList);
        request.setAttribute("categoryList", categoryService.getAllCategories());
        RequestDispatcher dispatcher = request.getRequestDispatcher("getAllProduct.jsp");
        dispatcher.forward(request, response);
    }

    public void getAllForCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        productList.clear();
        ArrayList<Product> productss = productService.getAllProducts();
        for (Product allProduct : productss) {
            if (allProduct.getQuantity() != 0) {
                productList.add(allProduct);
            }
        }
        System.out.println("Size of productList: " + productList.size());
        request.setAttribute("productList", productList);
        request.setAttribute("categoryList", categoryService.getAllCategories());
        RequestDispatcher dispatcher = request.getRequestDispatcher("getAllProductForCustomer.jsp");
        dispatcher.forward(request, response);
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
        System.out.println(action);
        if (action != null) {
            switch (action) {
                case "update":
                    update(request, response);
                    break;
                case "addNew":
                    addNew(request, response);
                    break;
                case "search":
                    search(request, response);
                    break;

                default:
                    throw new IllegalArgumentException("Invalid action: " + action);
            }
        } else {
            throw new IllegalArgumentException("Action parameter is missing");
        }
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

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String cateName = request.getParameter("category");
        String price = request.getParameter("price");
        String origin = request.getParameter("origin");
        String detail = request.getParameter("detail");
        Category c = new Category();
        for (Category allCategory : categoryService.getAllCategories()) {
            if (allCategory.getNameCategory().equals(cateName)) {
                c = allCategory;
            }
        }
        Product p = new Product(Integer.parseInt(id), name, c, Double.parseDouble(price), origin, detail, productService.getProductById(Integer.parseInt(id)).getQuantity());
        productService.updateProduct(p);
        getAll(request, response);

    }

    private void addNew(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String cateName = request.getParameter("category");
        String price = request.getParameter("price");
        String origin = request.getParameter("origin");
        String detail = request.getParameter("detail");
        String quantity = request.getParameter("quantity");
        Category c = new Category();
        for (Category allCategory : categoryService.getAllCategories()) {
            if (allCategory.getNameCategory().equals(cateName)) {
                c = allCategory;
            }
        }
        Product p = new Product(0, name, c, Double.parseDouble(price), origin, detail, Integer.parseInt(quantity));
        productService.insertProduct(p);
        getAll(request, response);
    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");

        ArrayList<Product> searchProduct = new ArrayList<>();
        searchProduct = productService.performSearch(search);
        request.setAttribute("searchProduct", searchProduct);

        RequestDispatcher dispatcher = request.getRequestDispatcher("searchProduct.jsp");
        dispatcher.forward(request, response);
    }

}
