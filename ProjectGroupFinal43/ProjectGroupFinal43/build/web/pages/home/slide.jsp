<%-- 
    Document   : slide
    Created on : Mar 16, 2024, 3:12:54 PM
    Author     : MINH NHAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/style.css">
        <meta charset="UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="slider-container">
        <div class="slider" style="z-index: 0;">
            <div class="list">
                <div class="item active">
                    <img src="img/img_banner1.jpg">
                    <div class="content">
                        <br>
                        <a class="logo43" href="/ProjectAss/Jsp/Index.jsp"
                           style="text-decoration: none; color: rgb(255, 255, 255);font-family: 'Courier New', Courier, monospace; font-size: larger;letter-spacing: 4px;">43
                            ONLINE STORE </a>
                        <h2 style="color: rgb(0, 153, 255);">Exclusive Electronics</h2>
                        <p style="color: white; font-weight: bold;">
                            From Smart Homes to Portable Gadgets, We Have Everything You Need in Electronics!
                        </p>
                    </div>
                </div>
                <div class="item">
                    <img src="img/img_banner2.jpg">
                    <div class="content">
                        <br>
                        <a class="logo43" href="/ProjectAss/Jsp/Index.jsp"
                           style="text-decoration: none; color: rgb(255, 255, 255);font-family: 'Courier New', Courier, monospace; font-size: larger;letter-spacing: 4px;">43
                            ONLINE STORE </a>
                        <h2 style="color: rgb(139, 255, 147);">Unlimited Gaming</h2>
                        <p style="color: white; font-weight: bold;">
                            Unleash Maximum Performance with Our Range of High-End Computers and PCs!
                        </p>
                    </div>
                </div>
                <div class="item">
                    <img src="img/img_banner3.jpg">
                    <div class="content">

                        <a class="logo43" href="/ProjectAss/Jsp/Index.jsp"
                           style="text-decoration: none; color: rgb(255, 255, 255);font-family: 'Courier New', Courier, monospace; font-size: larger;letter-spacing: 4px;">43
                            ONLINE STORE </a>
                        <h2 style="color: rgb(139, 255, 147);">Special Arrival</h2>
                        <p style="color: white; font-weight: bold;">
                            Define Your Style: Find the Perfect Fashion Pieces for Every Occasion!
                        </p>
                    </div>
                </div>
                <div class="item">
                    <img src="img/img_banner4.jpg">
                    <div class="content">
                        <br>
                        <a class="logo43" href="/ProjectAss/Jsp/Index.jsp"
                           style="text-decoration: none; color: rgb(255, 255, 255);font-family: 'Courier New', Courier, monospace; font-size: larger;letter-spacing: 4px;">43
                            ONLINE STORE </a>
                        <h2 style="color: rgb(0, 153, 255);">Kitchenware</h2>
                        <p style="color: white; font-weight: bold;">
                            Cook with Confidence and Style – Explore Our Range of High-Quality Kitchenware Today!
                        </p>
                    </div>
                </div>
                <div class="item">
                    <img src="img/img_banner5.jpg">
                    <div class="content">
                        <br>
                        <a class="logo43" href="/ProjectAss/Jsp/Index.jsp"
                           style="text-decoration: none; color: rgb(255, 255, 255);font-family: 'Courier New', Courier, monospace; font-size: larger;letter-spacing: 4px;">43
                            ONLINE STORE </a>
                        <h2 style="color: rgb(0, 153, 255);">Mobile Expert</h2>
                        <p style="color: white; font-weight: bold;">
                            From Stunning Displays to Lightning-Fast Performance, Find Your Perfect Smartphone Here!
                        </p>
                    </div>
                </div>
            </div>
            <div class="arrows">
                <button id="prev">
                    < </button>
                <button id="next">></button>
            </div>
            <div class="thumbnail" style="padding-top: 7%">
                <div class="item active">
                    <img src="img/img_banner1.jpg">
                </div>
                <div class="item">
                    <img src="img/img_banner2.jpg">
                </div>
                <div class="item">
                    <img src="img/img_banner3.jpg">
                </div>
                <div class="item">
                    <img src="img/img_banner4.jpg">
                </div>
                <div class="item">
                    <img src="img/img_banner5.jpg">
                </div>
            </div>
        </div>
        </div>
        <script>
            let items = document.querySelectorAll('.slider .list .item');
            let next = document.getElementById('next');
            let prev = document.getElementById('prev');
            let thumbnails = document.querySelectorAll('.thumbnail .item');

            // config param
            let countItem = items.length;
            let itemActive = 0;
            // event next click
            next.onclick = function () {
                itemActive = itemActive + 1;
                if (itemActive >= countItem) {
                    itemActive = 0;
                }
                showSlider();
            }
            //event prev click
            prev.onclick = function () {
                itemActive = itemActive - 1;
                if (itemActive < 0) {
                    itemActive = countItem - 1;
                }
                showSlider();
            }
            // auto run slider
            let refreshInterval = setInterval(() => {
                next.click();
            }, 5000)
            function showSlider() {
                // remove item active old
                let itemActiveOld = document.querySelector('.slider .list .item.active');
                let thumbnailActiveOld = document.querySelector('.thumbnail .item.active');
                itemActiveOld.classList.remove('active');
                thumbnailActiveOld.classList.remove('active');

                // active new item
                items[itemActive].classList.add('active');
                thumbnails[itemActive].classList.add('active');

                // clear auto time run slider
                clearInterval(refreshInterval);
                refreshInterval = setInterval(() => {
                    next.click();
                }, 5000)
            }
        </script>
    </body>
</html>
