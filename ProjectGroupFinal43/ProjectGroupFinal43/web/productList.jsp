<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page  import="Model.Entity.Product" %>
<%@page  import="java.util.ArrayList" %>
<%@page  import="Model.Entity.Category" %>
<!DOCTYPE html>
<html>
    <head>
        <title>43 Online Store</title>
        <link rel="icon" href="img/favicon.png">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/all.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Marck+Script&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <meta charset="UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                                    <input type="hidden" name="action" value="search">
                                    <input type="text" name="search" style="width: 90%;box-sizing: border-box;" placeholder="Search keyword"><i class="fa-solid fa-magnifying-glass"></i>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="product_list">
                            <form action="ProductController" method="get">
                                <input type="hidden" name="action" value="list">
                                <div class="container">
                                    <c:forEach var="product" items="${productList}">
                                        <div class="col-lg-4 col-md-6 col-sm-12 mb-4">
                                            <div class="product-card p-3">
                                                <div class="product-info">
                                                    <div class="name">Name: <c:out value="${product.getName()}" /></div>
                                                    <div class="category">Category: <c:out value="${product.getCategory().getNameCategory()}" /></div>
                                                    <div class="price">Price: <c:out value="${product.getPrice()}" /></div>
                                                    <div class="origin">Origin: <c:out value="${product.getOrigin()}" /></div>
                                                    <div class="detail">Detail: <c:out value="${product.getDetail()}" /></div>
                                                    <form action="BoxProductController" method="post">
                                                        <input type="hidden" name="idProduct" value="${product.getId()}">
                                                        <input type="hidden" name="action" value="addNew">
                                                        <button type="submit">Add to cart</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="/pages/home/webfeature.jsp"/>
        <jsp:include page="/layout/footer.jsp"/>

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
        <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/ScrollTrigger.min.js"></script>
        <script>
            thumbnails.forEach((thumbnail, index) => {
                thumbnail.addEventListener('click', () => {
                    itemActive = index;
                    showSlider();
                })
            })
            document.addEventListener('scroll', () => {
                const header = document.querySelector('header');
                if (window.screenY > 0) {
                    header.classList.add('scrolled');
                } else {
                    header.classList.remove('scrolled');
                }
            })
        </script>
    </body>
</html>
