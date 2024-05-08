<%-- 
    Document   : addNewProduct
    Created on : Mar 15, 2024, 4:51:42 PM
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
      
            ArrayList<Category> listCategories = (ArrayList<Category>) session.getAttribute("listCategories");
      // Kiểm tra xem categoryId có tồn tại không
      
        %>

        <!-- Trường input ẩn để truyền idCategory -->
        <form action="ProductController" method="post">
            <input type="hidden" name="action" value="addNew">

            Input Name: <input type="text" name="name">
            Choose Category: 
            <select name="category">
                <c:forEach var="category" items="${listCategories}">
                    <option value="${category.getIdCategory()}">${category.getNameCategory()}</option>
                </c:forEach>
            </select>

            Input Price: <input type="text" name="price">
            Input Origin: <input type="text" name="origin">
            Input Detail: <input type="text" name="detail">
            Input Quantity <input type="text" name="quantity">
            <input type="submit" value="Submit">
        </form>

    </body>
</html>
