<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page  import="Model.Entity.Product" %>
<%@page  import="java.util.ArrayList" %>
<%@page  import="Model.Entity.Category" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Search Results</title>
        <style>
            .product-list {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                grid-gap: 20px;
            }

            .product-card {
                border: 1px solid #ccc;
                padding: 10px;
            }

            .product-info {
                display: flex;
                flex-direction: column;
            }

            .product-info > div {
                margin-bottom: 5px;
            }

        </style>
    </head>
    <body>
        <jsp:include page="/layout/Header.jsp"/>

        <h1 style="text-align: center">Search Results</h1>
        <div class="container">
            <div class="row">
                <c:forEach var="product" items="${searchProduct}">
                    <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                        <div class="card product-card">
                            <div class="card-body">
                                <h5 class="card-title name">Name: <c:out value="${product.getName()}" /></h5>
                                <p class="card-text category">Category: <c:out value="${product.getCategory().getNameCategory()}" /></p>
                                <p class="card-text price">Price: <c:out value="${product.getPrice()}" /></p>
                                <p class="card-text origin">Origin: <c:out value="${product.getOrigin()}" /></p>
                                <p class="card-text detail">Detail: <c:out value="${product.getDetail()}" /></p>
                                <form action="BoxProductController" method="post">
                                    <input type="hidden" name="idProduct" value="${product.getId()}">
                                    <input type="hidden" name="action" value="addNew">
                                    <button type="submit" class="btn btn-primary btn-sm">Add to Cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>


        <div id="statusMessage" class="alert" role="alert" style="display: none;"></div>

        <script>
            // Lấy giá trị boolean từ request attribute
            var myBooleanVariable = <%= request.getAttribute("myBoo") %>;

            // Lấy thẻ div để hiển thị cảnh báo
            var statusMessage = document.getElementById("statusMessage");

            // Kiểm tra giá trị của biến boolean và hiển thị cảnh báo tương ứng
            if (myBooleanVariable) {
                // Nếu thêm thành công, hiển thị hộp thông báo thành công
                statusMessage.innerText = "Product added successfully!";
                statusMessage.classList.add("alert-success");
            } else {
                // Nếu thêm thất bại, hiển thị hộp thông báo lỗi
//                statusMessage.innerText = "Failed to add product!";
//                statusMessage.classList.add("alert-danger");
            }

            // Hiển thị hộp thông báo
            statusMessage.style.display = "block";
        </script>
        <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/jquery.counterup.min.js"></script>
        <script src="js/waypoints.min.js"></script>
        <script src="js/contact.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/jquery.form.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/mail-script.js"></script>

        <jsp:include page="/pages/home/webfeature.jsp"/>
        <jsp:include page="/layout/footer.jsp"/>
    </body>
</html>
