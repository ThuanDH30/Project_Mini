<%-- 
    Document   : addNewCategory
    Created on : Mar 15, 2024, 2:35:07 PM
    Author     : vietn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="CategoryController" method="post">
            <input type="hidden" name="action" value="addNew">
            Input Name Category: <input type="text" name="nameNewCategory">
            <button type="submit">Submit</button>
        </form>
    </body>
</html>
