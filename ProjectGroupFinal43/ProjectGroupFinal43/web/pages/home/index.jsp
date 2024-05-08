<%-- 
    Document   : index
    Created on : Mar 16, 2024, 3:12:47 PM
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
        <jsp:include page="/layout/Header.jsp"/>
        <jsp:include page="/pages/home/slide.jsp"/>

        <!-- product list start-->
        <section class="single_product_list">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="single_product_iner">
                            <div class="row align-items-center justify-content-between">
                                <div class="col-lg-6 col-sm-6">
                                    <div class="single_product_img">
                                        <img src="img/single_product1.png" class="img-fluid" alt="#"> <!--Thay ảnh product vs h=548px + w=460px-->
                                        <img src="https://img.freepik.com/free-vector/abstract-black-lines-geometric-background_677411-2754.jpg?w=1060&t=st=1709864193~exp=1709864793~hmac=5b1fb46fb28c21786a79f8cd69452586c3bee335879b169dbb528781edd5540e"
                                             alt="#" class="product_overlay img-fluid">
                                    </div>
                                </div>
                                <div class="col-lg-5 col-sm-6">
                                    <div class="single_product_content">
                                        <h5>Started from $700</h5>
                                        <h2 style="font-size: larger"> <a href="#">A 6.8-inch true-full gaming screen delivers a vivid display plus the option to complete multiple tasks simultaneously or play a competitive 2-player game at a stable 58.1 FPS with the split screen function.</a> </h2>
                                        <a href="ProductController" class="btn_3">Explore Now</a>
                                        <!-- href chuyển hướng sang trang category của loại product 1-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single_product_iner">
                            <div class="row align-items-center justify-content-between">
                                <div class="col-lg-6 col-sm-6">
                                    <div class="single_product_img">
                                        <img src="img/single_product2.jpg" class="img-fluid" alt="#"> <!--Thay ảnh product vs h=548px + w=460px-->
                                        <img src="https://img.freepik.com/free-vector/abstract-black-lines-geometric-background_677411-2754.jpg?w=1060&t=st=1709864193~exp=1709864793~hmac=5b1fb46fb28c21786a79f8cd69452586c3bee335879b169dbb528781edd5540e"
                                             alt="#" class="product_overlay img-fluid">
                                    </div>
                                </div>
                                <div class="col-lg-5 col-sm-6">
                                    <div class="single_product_content">
                                        <h5>Started from $60</h5>
                                        <h2 style="font-size: larger"> <a href="#">Designed for comfort and built for speed, PUMA activewear for men provides the ultimate in traction, grip and cushioning. Whether you’re looking for the best gym, or running partners, PUMA merges lightweight design with the latest tech to help you reach your goals.</a> </h2>
                                        <a href="ProductController" class="btn_3">Explore Now</a>
                                        <!-- href chuyển hướng sang trang category của loại product 2-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single_product_iner">
                            <div class="row align-items-center justify-content-between">
                                <div class="col-lg-6 col-sm-6">
                                    <div class="single_product_img">
                                        <img src="img/single_product3.jpg" class="img-fluid" alt="#"> <!--Thay ảnh product vs h=548px + w=460px-->
                                        <img src="https://img.freepik.com/free-vector/abstract-black-lines-geometric-background_677411-2754.jpg?w=1060&t=st=1709864193~exp=1709864793~hmac=5b1fb46fb28c21786a79f8cd69452586c3bee335879b169dbb528781edd5540e"
                                             alt="#" class="product_overlay img-fluid">
                                    </div>
                                </div>
                                <div class="col-lg-5 col-sm-6">
                                    <div class="single_product_content">
                                        <h5>Started from $150</h5>
                                        <h2 style="font-size: larger"> <a href="#">Full HD Picture Perfection - Full HD Picture Perfection gives you crystal-clear, award-winning picture quality. Contrast and brightness are achieved with Full Array LED Backlight and fine-tuned at a granular level with Active Pixel Tuning..voltage : 120 volts</a> </h2>
                                        <a href="ProductController" class="btn_3">Explore Now</a>
                                        <!-- href chuyển hướng sang trang category của loại product 3-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- product list end-->

        <!-- trending item start-->
<!--        <section class="client_review" style="z-index: 0; height: 30px;">
            <div class="row justify-content-center">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section_tittle text-center">
                            <h2 style="color: black;">Trending Items</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>-->
        <section class="trending_items">
            <div class="row justify-content-center">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section_tittle text-center">
                            <h2 style="color: black;">Trending Items</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="single_product_item" style="text-align: center;">
                    <!--                            <div class="container2" style="width: 70%;">
                                                    <div class="wrapper">
                                                        <img src="https://img.freepik.com/premium-psd/gaming-computer-product-sale-advertising-social-media-banner_252779-1122.jpg"
                                                             alt="#" class="product_overlay img-fluid">
                                                        <img src="https://img.freepik.com/free-vector/abstract-black-lines-geometric-background_677411-2754.jpg?w=1060&t=st=1709864193~exp=1709864793~hmac=5b1fb46fb28c21786a79f8cd69452586c3bee335879b169dbb528781edd5540e"
                                                             alt="#" class="product_overlay img-fluid">
                                                        <img src="https://img.freepik.com/free-vector/abstract-black-lines-geometric-background_677411-2754.jpg?w=1060&t=st=1709864193~exp=1709864793~hmac=5b1fb46fb28c21786a79f8cd69452586c3bee335879b169dbb528781edd5540e"
                                                             alt="#" class="product_overlay img-fluid">
                                                        <img src="https://img.freepik.com/free-vector/abstract-black-lines-geometric-background_677411-2754.jpg?w=1060&t=st=1709864193~exp=1709864793~hmac=5b1fb46fb28c21786a79f8cd69452586c3bee335879b169dbb528781edd5540e"
                                                             alt="#" class="product_overlay img-fluid">
                                                    </div>
                                                </div> -->
                    <div class="track">
                        <div class="track-slide">
                            <div class="tracks">
                                <img src="https://img.freepik.com/premium-psd/gaming-computer-product-sale-advertising-social-media-banner_252779-1122.jpg"/>
                            </div>
                            <div class="tracks">
                                <img src="https://img.freepik.com/premium-psd/gaming-computer-product-sale-advertising-social-media-banner_252779-1122.jpg"/>
                            </div>
                            <div class="tracks">
                                <img src="https://img.freepik.com/premium-psd/gaming-computer-product-sale-advertising-social-media-banner_252779-1122.jpg"/>
                            </div>
                            <div class="tracks">
                                <img src="https://img.freepik.com/premium-psd/gaming-computer-product-sale-advertising-social-media-banner_252779-1122.jpg"/>
                            </div>
                            <div class="tracks">
                                <img src="https://img.freepik.com/premium-psd/gaming-computer-product-sale-advertising-social-media-banner_252779-1122.jpg"/>
                            </div>
                            <div class="tracks">
                                <img src="https://img.freepik.com/premium-psd/gaming-computer-product-sale-advertising-social-media-banner_252779-1122.jpg"/>
                            </div>
                            <div class="tracks">
                                <img src="https://img.freepik.com/premium-psd/gaming-computer-product-sale-advertising-social-media-banner_252779-1122.jpg"/>
                            </div>
                            <div class="tracks">
                                <img src="https://img.freepik.com/premium-psd/gaming-computer-product-sale-advertising-social-media-banner_252779-1122.jpg"/>
                            </div>
                            <div class="tracks">
                                <img src="https://img.freepik.com/premium-psd/gaming-computer-product-sale-advertising-social-media-banner_252779-1122.jpg"/>
                            </div>
                            <div class="tracks">
                                <img src="https://img.freepik.com/premium-psd/gaming-computer-product-sale-advertising-social-media-banner_252779-1122.jpg"/>
                            </div>
                        </div>
                    </div>
                    <a href="ProductController" class="btn_3">Explore Now</a>
                </div>

            </div>
        </section>

        <section class="user_review">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="mx-auto max-w-7xl py-24 sm:px-6 sm:py-32 lg:px-8">
                        <div>
                            <h2 class="sr-only">Customer Reviews</h2>

                            <div class="-my-10">
                                <div class="flex space-x-4 text-sm text-gray-500">
                                    <div class="flex-none py-10">
                                        <img src="https://images.unsplash.com/profile-1648828806223-1852f704c58aimage?bg=fff&crop=faces&dpr=1&h=150&w=150&auto=format&fit=crop&q=60&ixlib=rb-4.0.3"
                                             alt="" class="h-30 w-28 rounded-full bg-gray-100">
                                    </div>
                                    <div class="flex-1 py-10">
                                        <h3 class="font-medium text-gray-900">Emily Selman</h3>
                                        <p><time datetime="2021-07-16">July 16, 2021</time></p>

                                        <div class="mt-4 flex items-center">
                                            <!-- Active: "text-yellow-400", Default: "text-gray-300" -->
                                            <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                  clip-rule="evenodd" />
                                            </svg>
                                            <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                  clip-rule="evenodd" />
                                            </svg>
                                            <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                  clip-rule="evenodd" />
                                            </svg>
                                            <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                  clip-rule="evenodd" />
                                            </svg>
                                            <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                  clip-rule="evenodd" />
                                            </svg>
                                        </div>
                                        <p class="sr-only">5 out of 5 stars</p>

                                        <div class="prose prose-sm mt-4 max-w-none text-gray-500">
                                            <p>This icon pack is just what I need for my latest project. There's an icon for
                                                just about anything I could ever need. Love the playful look!</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex space-x-4 text-sm text-gray-500">
                                    <div class="flex-none py-10">
                                        <img src="https://images.unsplash.com/profile-fb-1661599666-081b04e75823.jpg?bg=fff&crop=faces&dpr=1&h=150&w=150&auto=format&fit=crop&q=60&ixlib=rb-4.0.3"
                                             alt="" class="h-30 w-28 rounded-full bg-gray-100">
                                    </div>
                                    <div class="flex-1 py-10 border-t border-gray-200">
                                        <h3 class="font-medium text-gray-900">Daniel Lee</h3>
                                        <p><time datetime="2021-07-12">April 7, 2021</time></p>

                                        <div class="mt-4 flex items-center">
                                            <!-- Active: "text-yellow-400", Default: "text-gray-300" -->
                                            <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                  clip-rule="evenodd" />
                                            </svg>
                                            <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                  clip-rule="evenodd" />
                                            </svg>
                                            <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                  clip-rule="evenodd" />
                                            </svg>
                                            <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                  clip-rule="evenodd" />
                                            </svg>
                                            <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                  clip-rule="evenodd" />
                                            </svg>
                                        </div>
                                        <p class="sr-only">5 out of 5 stars</p>

                                        <div class="prose prose-sm mt-4 max-w-none text-gray-500">
                                            <p>Blown away by how polished this icon pack is. Everything looks so consistent
                                                and each SVG is optimized out of the box so I can use it directly with
                                                confidence. It would take me several hours to create a single icon this
                                                good, so it's a steal at this price.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex space-x-4 text-sm text-gray-500">
                                    <div class="flex-none py-10">
                                        <img src="https://images.unsplash.com/profile-1495427732560-fe5248ad6638?bg=fff&crop=faces&dpr=1&h=150&w=150&auto=format&fit=crop&q=60&ixlib=rb-4.0.3"
                                             alt="" class="h-30 w-28 rounded-full bg-gray-100">
                                    </div>
                                    <div class="flex-1 py-10 border-t border-gray-200">
                                        <h3 class="font-medium text-gray-900">Hector Gibbons</h3>
                                        <p><time datetime="2021-07-12">February 14, 2021</time></p>

                                        <div class="mt-4 flex items-center">
                                            <!-- Active: "text-yellow-400", Default: "text-gray-300" -->
                                            <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                  clip-rule="evenodd" />
                                            </svg>
                                            <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                  clip-rule="evenodd" />
                                            </svg>
                                            <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                  clip-rule="evenodd" />
                                            </svg>
                                            <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                  clip-rule="evenodd" />
                                            </svg>
                                            <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" viewBox="0 0 20 20"
                                                 fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd"
                                                  d="M10.868 2.884c-.321-.772-1.415-.772-1.736 0l-1.83 4.401-4.753.381c-.833.067-1.171 1.107-.536 1.651l3.62 3.102-1.106 4.637c-.194.813.691 1.456 1.405 1.02L10 15.591l4.069 2.485c.713.436 1.598-.207 1.404-1.02l-1.106-4.637 3.62-3.102c.635-.544.297-1.584-.536-1.65l-4.752-.382-1.831-4.401z"
                                                  clip-rule="evenodd" />
                                            </svg>
                                        </div>
                                        <p class="sr-only">5 out of 5 stars</p>

                                        <div class="prose prose-sm mt-4 max-w-none text-gray-500">
                                            <p>Love this e-commerce site! Wide range of products, great prices, and excellent customer service. Highly recommend!</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- More reviews... -->
                            </div>
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

            ScrollTrigger.create({
                animation: gsap.from(".logo43", {
                    y: "27vh",
                    scale: 3,
                    yPercent: -55,
                }),
                scrub: true,
                trigger: ".content",
                start: "top left",
                endTrigger: ".content",
                end: "top left",
            });
        </script>
    </body>
</html>
