<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page  import="Model.Entity.Product" %>
<%@page  import="java.util.ArrayList" %>
<%@page  import="Model.Entity.Category" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>All Products</title>
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

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            th, td {
                padding: 12px;
                border: 1px solid #e0e0e0;
                text-align: left;
                font-family: Arial, sans-serif;
            }

            th {
                background-color: #f5f5f5;
                font-weight: bold;
            }

            tr{
                background-color: white;
            }

            .action-links a {
                text-decoration: none;
                padding: 8px 16px;
                background-color: #007bff;
                color: #fff;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .action-links a:hover {
                background-color: #0056b3;
            }

            .table-container:hover td {
                transition: background-color 0.3s;
            }

            .table-container:hover tr:nth-child(odd) td {
                background-color: #f0f0f0;
            }

            .table-container:hover tr:nth-child(even) td {
                background-color: #e0e0e0;
            }

            .table-container tr:hover td {
                background-color: #f8f9fa;
            }

            .fade-in {
                animation: fadeIn 0.5s ease;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
        </style>
    </head>
    <body>
       <h1>All Products</h1>
<%
// Tạo danh sách (ví dụ: listCategories)
ArrayList<Category> listCategories = (ArrayList<Category>)request.getAttribute("categoryList");
// Thêm các phần tử vào danh sách

// Lưu danh sách vào session
session.setAttribute("listCategories", listCategories);
%>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Category</th>
        <th>Price</th>
        <th>Origin</th>
        <th>Detail</th>
        <th>Action</th>
    </tr>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td><c:out value="${product.getId()}" /></td>
            <td><c:out value="${product.getName()}" /></td>
            <td><c:out value="${product.getCategory().getNameCategory()}" /></td>
            <td><c:out value="${product.getPrice()}" /></td>
            <td><c:out value="${product.getOrigin()}" /></td>
            <td><c:out value="${product.getDetail()}" /></td>
            <td>
                <a href="updateProduct.jsp?id=<c:out value='${product.getId()}' />">Update</a>
            </td>
        </tr>
    </c:forEach>
</table>
<div class="row" style="display: grid;">
    <button><a href="addNewProduct.jsp">Add New</a></button>
</div>

    </body>
</html>
