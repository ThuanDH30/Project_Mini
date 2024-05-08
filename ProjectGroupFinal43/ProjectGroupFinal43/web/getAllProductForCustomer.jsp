<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page  import="Model.Entity.Product" %>
<%@page  import="java.util.ArrayList" %>
<%@page  import="Model.Entity.Category" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="/layout/Header.jsp"/>

        <section class="breadcrumb_part" style="height: 150px;
                 display: flex;
                 align-items: center;
                 justify-content: center;
                 background-color: white;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb_iner" style="text-align: center;">
                            <h1 style="font-size: 50px;
                                line-height: 1.2;
                                color: black;
                                font-weight: 500;
                                text-transform: capitalize;">product list</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- breadcrumb part end-->

        <!-- product list part start-->
        <section class="product_list section_padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="product_sidebar">
                            <div class="single_sedebar" style="background-color: #7a7a7a;
                                 border-radius: 50px;
                                 border: 1px solid #F4EDF2;
                                 padding: 13px 25px;
                                 width: 100%;
                                 line-height: 22px;">
                                <form action="ProductController" method="post" style="background-color: white;
                                      border-radius: 50px;
                                      border: 1px solid #F4EDF2;
                                      padding: 1.5% 2.5%;
                                      width: 100%;
                                      line-height: 30px;">
                                    <i class="fa-solid fa-magnifying-glass" style="position: absolute; top: 50%; transform: translateY(-50%); right: 35px;"></i>
                                    <input type="hidden" name="action" value="search">
                                    <input type="text" name="search" style="width: 90%;box-sizing: border-box;" placeholder="Search keyword">

                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="product_list">
                            <div class="container-fluid">
                                <div class="row">
                                    <c:forEach var="product" items="${productList}">
                                        <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                                            <div class="product-card p-3 border rounded shadow-sm">
                                                <div class="product-info">
                                                    <div class="product-image">
                                                        <!-- Display product image here if available -->
                                                    </div>
                                                    <div class="product-details">
                                                        <div class="name">Name: <c:out value="${product.getName()}" /></div>
                                                        <div class="category">Category: <c:out value="${product.getCategory().getNameCategory()}" /></div>
                                                        <div class="price">Price: <c:out value="${product.getPrice()}" /></div>
                                                        <div class="origin">Origin: <c:out value="${product.getOrigin()}" /></div>
                                                        <div class="detail">Detail: <c:out value="${product.getDetail()}" /></div>
                                                        <form action="BoxProductController" method="post">
                                                            <input type="hidden" name="idProduct" value="${product.getId()}">
                                                            <input type="hidden" name="action" value="addNew">
                                                            <button type="submit" class="btn btn-primary mt-3">Add to cart</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

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
