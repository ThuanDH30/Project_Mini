<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Introduction</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <script>
        // JavaScript để thêm hiệu ứng
        document.addEventListener("DOMContentLoaded", function () {
            var header = document.querySelector("h1");
            header.style.transition = "transform 0.5s ease";

            header.addEventListener("mouseenter", function () {
                this.style.transform = "scale(1.1)";
            });

            header.addEventListener("mouseleave", function () {
                this.style.transform = "scale(1)";
            });
        });

    </script>

    <style>
        /* Reset CSS */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    margin-bottom: 20px;
    color: #333;
}

h2 {
    margin-top: 30px;
    color: #666;
}

ul {
    list-style-type: none;
}

li {
    padding: 8px 0;
}

p {
    line-height: 1.6;
}


    </style>
    
    <body>
        <div class="container">
            <h1>Giới thiệu về Nhóm 43</h1>
            <p>Chào mừng bạn đến với trang giới thiệu về nhóm 43!</p>
            <h2>Thành viên:</h2>
            <ul>
                <li>Nguyễn Đức Việt (DE170616)</li>
                <li>Võ Trung Lộc</li>
                <li>Võ Trần Đăng Khoa</li>
                <li>Đinh Huỳnh Thuận</li>
                <li>Nguyễn Minh Nhật</li>
            </ul>
            <p>Chúng tôi đến từ Đại học FPT và đây là dự án tâm huyết của nhóm!</p>
        </div>
        <script src="script.js"></script>
    </body>
</html>
