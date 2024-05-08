<%-- 
    Document   : neupdateProduct
    Created on : Mar 15, 2024, 4:02:07 PM
    Author     : vietn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page  import="java.util.ArrayList" %>
<%@page  import="Model.Entity.Category" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
       // Lấy giá trị của idCategory từ URL
       String productId = request.getParameter("id");
        ArrayList<Category> listCategories = (ArrayList<Category>) session.getAttribute("listCategories");
       // Kiểm tra xem categoryId có tồn tại không
       if(productId != null && !productId.isEmpty()) {
        %>

        <!-- Trường input ẩn để truyền idCategory -->
        <form action="ProductController" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= productId %>">
            Input the New Name: <input type="text" name="name">
            Choose Category: 
            <select name="category">
                <c:forEach var="category" items="${listCategories}">
                    <option value="${category.getIdCategory()}">${category.getNameCategory()}</option>
                </c:forEach>
            </select>

            Input the New Price: <input type="text" name="price">
            Input the New Origin: <input type="text" name="origin">
            Input the New Detail: <input type="text" name="detail">
            <input type="submit" value="Update">
        </form>
        <% 
            } else {
        %>
        <h1>Invalid category ID</h1>
        <% 
            }
        %>
    </body>
</html>
