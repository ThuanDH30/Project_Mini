/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Entity.Bill;
import Model.Entity.BoxBill;
import Model.Entity.BoxProduct;
import Model.Entity.Product;
import Model.Service.BillService;
import Model.Service.BoxBillService;
import Model.Service.BoxProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author vietn
 */
public class BoxBilllController extends HttpServlet {

    String selectedIds = "";

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
            out.println("<title>Servlet BoxBilllController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BoxBilllController at " + request.getContextPath() + "</h1>");
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
        selectedIds = request.getParameter("selectedIds");

        if (selectedIds != null && !selectedIds.isEmpty()) {
            getAll(request, response, selectedIds);
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

        switch (action) {
            case "thanhToan":
                thanhToan(request, response, selectedIds);
                break;
            case "huy":
                 request.getRequestDispatcher("index.jsp").forward(request, response);
                 break;
            default:
                throw new AssertionError();

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

    private void getAll(HttpServletRequest request, HttpServletResponse response, String selectedIds) throws ServletException, IOException {
        String[] idsArray = selectedIds.split(",");
        ArrayList<Product> boList = new ArrayList<>();
        BoxProductService b = new BoxProductService();

        for (String id : idsArray) {
            BoxProduct boP = b.getBoxProductByIDBox(Integer.parseInt(id));
            boList.add(new Product(boP.getProduct().getId(), boP.getProduct().getName(), boP.getProduct().getCategory(), boP.getProduct().getPrice(), boP.getProduct().getOrigin(), boP.getProduct().getDetail(), boP.getSl()));
        }
        request.setAttribute("listThanhToan", boList);
        request.getRequestDispatcher("ThanhToan.jsp").forward(request, response);

    }

    private void thanhToan(HttpServletRequest request, HttpServletResponse response, String selectedIds) throws ServletException, IOException {
        String[] idsArray = selectedIds.split(",");
        ArrayList<BoxProduct> boxProduct = new ArrayList<>();
        BoxProductService b = new BoxProductService();
        LocalDate ngay = LocalDate.now();
        BillService billService = new BillService();
        BoxProduct box = b.getBoxProductByIDBox(Integer.parseInt(idsArray[0]));
        Bill newBill = new Bill(0, box.getGioHang().getCustomer(), String.valueOf(ngay));
        billService.insertBill(newBill);
        for (Bill bill : billService.getBillByIdCustomer(box.getGioHang().getCustomer().getIdCustomer())) {
            if (bill.getDate().equals(String.valueOf(ngay)) && bill.getCustomer().getIdCustomer() == box.getGioHang().getCustomer().getIdCustomer()) {
                newBill = bill;
            }
        }
        BoxBillService boxBillService = new BoxBillService();
        for (String id : idsArray) {
            BoxProduct boP = b.getBoxProductByIDBox(Integer.parseInt(id));
            boxBillService.insertBoxBill(new BoxBill(0, newBill, boP.getProduct(), boP.getSl(), boP.getProduct().getPrice() * boP.getSl()));
            boxProduct.add(boP);
        }
        for (BoxProduct boxProduct1 : boxProduct) {
            b.delete(boxProduct1.getIdBoxProduct());
        }
        request.getRequestDispatcher("success.jsp").forward(request, response);
    }

}
