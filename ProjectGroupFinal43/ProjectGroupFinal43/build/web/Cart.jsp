<%-- 
    Document   : Cart
    Created on : Mar 6, 2024, 4:38:46 PM
    Author     : vietn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="Model.Entity.BoxProduct" %>
<%@ page import="Model.Entity.Customer" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Products</title>
    </head>

    <script>
        function toggleId(id) {
            var index = selectedIds.indexOf(id);
            if (index === -1) {
                selectedIds.push(id);
            } else {
                selectedIds.splice(index, 1);
            }
        }

        function handleCheckboxChange(checkbox) {
            var id = checkbox.value;
            if (checkbox.checked) {
                toggleId(id);
            } else {
                toggleId(id);
            }
        }

        function handlePayment() {
            var selectedIds = [];
            var checkboxes = document.getElementsByName("idBoxProduct");
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    selectedIds.push(checkboxes[i].value);
                }
            }
            var selectedIdsString = selectedIds.join(",");
            window.location.href = "BoxBilllController?selectedIds=" + selectedIdsString;
        }


        function changeQuantity(amount, idProduct) {
            var quantityInput = document.getElementById("quantity_" + idProduct);
            var currentQuantity = parseInt(quantityInput.value);
            var newQuantity = currentQuantity + amount;
            if (newQuantity < 0) {
                newQuantity = 0;
            }
            quantityInput.value = newQuantity;
        }

        function updateQuantity(event, idProduct) {
            event.preventDefault();
            var newQuantity = parseInt(document.getElementById("quantity_" + idProduct).value);
            // Perform any additional tasks here if needed
        }
    </script>

    <body>
        <jsp:include page="/layout/Header.jsp"/> 

        <div style="text-align: center;font-size: xxx-large; margin-top: 5%; margin-bottom: 8%; font-weight: bold;">
            Giỏ Hàng Của Bạn
        </div>

        <%-- Lấy danh sách sản phẩm từ session --%>
        <% 
            if (session != null) {
                ArrayList<BoxProduct> productList = (ArrayList<BoxProduct>) session.getAttribute("BoxProductList");
                if (productList != null && !productList.isEmpty()) {
                    for (BoxProduct product : productList) {
        %>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 justify-content-center">
            <div class="card border-0 shadow">
                <div class="card-body">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="idBoxProduct" value="<%= product.getIdBoxProduct()%>" onclick="handleCheckboxChange(this)">
                        <label class="form-check-label font-weight-bold" style="font-family: cursive; font-size: 1.2rem;">
                            <%= product.getProduct().getName() %> - <%= product.getProduct().getDetail() %>
                        </label>
                    </div>
                    <p class="card-text" style="font-family: cursive; font-size: 1.2rem;">
                        Price: <%= product.getProduct().getPrice() %>
                    </p>
                    <form onsubmit="updateQuantity(event, <%= product.getIdBoxProduct() %>)">
                        <div class="input-group">
                            <span class="input-group-prepend">
                                <button class="btn btn-outline-secondary" type="button" onclick="changeQuantity(-1, <%= product.getIdBoxProduct() %>)">-</button>
                            </span>
                            <span class="input-group-text">Quantity:</span>
                            <input type="number" class="form-control" id="quantity_<%= product.getIdBoxProduct() %>" value="<%= product.getSl() %>">
                            <input type="hidden" id="idProduct" value="<%= product.getIdBoxProduct() %>">
                            <span class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" onclick="changeQuantity(1, <%= product.getIdBoxProduct() %>)">+</button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <% 
                    }
                } else {
        %>
    <li>No products available</li>
        <% 
                }
            } else {
        %>
    <li>Session not available</li>
        <% 
            }
        %>

    <div class="col-sm-8">
        <a href="javascript:void(0)" class="btn btn-primary"  onclick="handlePayment()">Thanh Toán</a>   
    </div>    
</ul>

<jsp:include page="/pages/home/webfeature.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
