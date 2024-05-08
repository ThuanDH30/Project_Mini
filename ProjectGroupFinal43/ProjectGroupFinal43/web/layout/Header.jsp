<%-- 
    Document   : Header
    Created on : Mar 6, 2024, 4:28:55 PM
    Author     : vietn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.Entity.Customer" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Marck+Script&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <title>Document</title>
        <style>
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {
                background-color: #f1f1f1;
            }

            .dropdown:hover .dropdown-content {
                display: block;
                opacity: 1;
            }
        </style>
       
    </head>

    <body>
        <header style="background-color: rgb(51, 51, 51); height: 5%; z-index: 1;margin-left: 0; margin-right: 0; ">
            <div style="text-align: center;">
                <hr style="width: 100%; height: 1px; border: none; background-color: black; margin: 0;">
            </div>
            <hr>
            <div class="row" style="width: 100%">
                <div class="col-sm-8 ">
                    <div class="row">
                        <div class="col-sm-5 " style="text-align: left;">
                            <a class="logo43" href="index.jsp"
                               style="text-decoration: none; color: whitesmoke;font-weight: bolder;font-family: 'Courier New', Courier, monospace; font-size: larger;letter-spacing: 4px;">43
                                ONLINE STORE </a>
                        </div>
                        <div class=" col-sm-7 " style="padding-top: 5px;">
                            <div class="row" style="text-align: left;">
                                <div class="col-sm-3 dropdown">
                                    <a href="ProductController" style="text-decoration: none; color: white; font-size: small;"
                                       onmouseover=" this.style.textDecoration = 'underline'"
                                       onmouseout=" this.style.textDecoration = 'none'">SẢN PHẨM</a>
                                    <div class="dropdown-content">
                                        <a href="#">Mục 1</a>
                                        <a href="#">Mục 2</a>
                                        <a href="#">Mục 3</a>
                                    </div>
                                </div>
                                <div class="col-sm-3 dropdown">
                                    <a href="#" style="text-decoration: none; color: white; font-size: small;"
                                       onmouseover=" this.style.textDecoration = 'underline'"
                                       onmouseout=" this.style.textDecoration = 'none'">THƯƠNG HIỆU</a>
                                    <div class="dropdown-content">
                                        <a href="#">Thương hiệu 1</a>
                                        <a href="#">Thương hiệu 2</a>
                                        <a href="#">Thương hiệu 3</a>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <a href="GioiThieu.jsp" style="text-decoration: none; color: white; font-size: small;"
                                       onmouseover=" this.style.textDecoration = 'underline'"
                                       onmouseout=" this.style.textDecoration = 'none'">GIỚI
                                        THIỆU</a>
                                </div>
                                <div class="col-sm-3">
                                    <a href="LienHe.jsp" style="text-decoration: none; color: white; font-size: small;"
                                       onmouseover=" this.style.textDecoration = 'underline'"
                                       onmouseout=" this.style.textDecoration = 'none'">LIÊN HỆ</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="row" style="align-items: center;">
                            <%
                                HttpSession sessionObj = request.getSession(false);
                                if(sessionObj != null && sessionObj.getAttribute("account") != null && ((Customer)sessionObj.getAttribute("account")).getRole_ID() == 2) { 
                            %>
                            <div class="col">
                                <a href="update-user.jsp?id<%= ((Customer)session.getAttribute("account")).getIdCustomer() %>" style="color: white;">
                                    <%= ((Customer)session.getAttribute("account")).getNameCustomer() %>
                                </a>
                            </div>
                            <div class="col">
                                <a href="LogoutController" style="text-decoration: none; color: white; font-size: small; display:grid">
                                    <i class="fa-solid fa-sign-out"></i>Đăng xuất
                                </a>

                            </div>
                            <% } else { %>
                            <div class="col">
                                <a href="Login_Form.jsp" style="text-decoration: none; color: white; font-size: small;"
                                   onmouseover="this.style.textDecoration = 'underline'"
                                   onmouseout="this.style.textDecoration = 'none'">
                                    <i class="fa-solid fa-user"></i>LOGIN/SIGN UP
                                </a>
                            </div>
                            <% } %>
                        <div class="col">
                            <a href="BoxProductController"
                               style="text-decoration: none;display:grid; color: white; font-size: small;"
                               onmouseover=" this.style.textDecoration = 'underline'"
                               onmouseout=" this.style.textDecoration = 'none'"><i class="fa-solid fa-cart-shopping"></i>GIỎ
                                HÀNG</a>
                        </div>
                        <div class="col">
                        <a href="#"
                            style="font-family: 'Courier New', Courier, monospace; text-decoration: none; color: white;display:inline-grid; font-size: small;"
                            onmouseover=" this.style.textDecoration='underline'"
                            onmouseout=" this.style.textDecoration='none'"><i class="fa-solid fa-phone"></i>
                            HotLine: 0901162097
                        </a>
                    </div>
                    </div>
                </div>
            </div>
            
        </header>
    </body>

</html>
