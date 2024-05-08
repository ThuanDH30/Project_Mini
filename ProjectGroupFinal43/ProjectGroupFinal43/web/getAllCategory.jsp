<%-- 
    Document   : getAllCategory
    Created on : Mar 15, 2024, 1:45:20 PM
    Author     : vietn
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page  import="Model.Entity.Category" %>
<%@page  import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>All Categories</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                background-image: url('img/img1.png');
                background-size: cover;
                background-position: center;
                font-family: Arial, sans-serif;
            }
            .category-table {
                margin-top: 20px;
            }

            .category-table table {
                width: 100%;
                border-collapse: collapse;
            }

            .category-table th, .category-table td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            .category-table th {
                background-color: #f2f2f2;
            }

            .category-table tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .category-table tbody tr:hover {
                background-color: #f2f2f2;
            }

            .category-table a {
                text-decoration: none;
                color: blue;
            }

            .category-table a:hover {
                text-decoration: underline;
                color: #0056b3;
            }

            .add-new-category-btn {
                margin-top: 10px; /* Khoảng cách giữa nút và bảng */
            }

            .add-new-category-btn a {
                display: inline-block;
                padding: 10px 20px; /* Điều chỉnh độ rộng và chiều cao của nút */
                background-color: #007bff; /* Màu nền của nút */
                color: #fff; /* Màu chữ của nút */
                text-decoration: none; /* Loại bỏ gạch chân của liên kết */
                border-radius: 5px; /* Kết hợp các góc */
                transition: background-color 0.3s ease; /* Hiệu ứng khi di chuột vào nút */
            }

            .add-new-category-btn a:hover {
                background-color: #0056b3; /* Màu nền khi di chuột vào nút */
            }
        </style>
    </head>
    <body>
        <h1>All Categories</h1>
        <div class="category-table">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="category" items="${categoryList}">
                        <tr>
                            <td><c:out value="${category.getIdCategory()}" /></td>
                            <td><c:out value="${category.getNameCategory()}" /></td>
                            <td>
                                <a href="updateCategory.jsp?id=<c:out value='${category.getIdCategory()}' />">Update</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty categoryList}">
                        <tr>
                            <td colspan="3">No categories found</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

    </body>
</html>
