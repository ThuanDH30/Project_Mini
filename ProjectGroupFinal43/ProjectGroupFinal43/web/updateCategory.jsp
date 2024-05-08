<%-- 
    Document   : updateCategory
    Created on : Mar 15, 2024, 1:58:22 PM
    Author     : vietn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        // Lấy giá trị của idCategory từ URL
        String categoryId = request.getParameter("id");
        
        // Kiểm tra xem categoryId có tồn tại không
        if(categoryId != null && !categoryId.isEmpty()) {
    %>
      
            <!-- Trường input ẩn để truyền idCategory -->
            <form action="CategoryController" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= categoryId %>">
                Input the New Name: <input type="text" name="name">
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
