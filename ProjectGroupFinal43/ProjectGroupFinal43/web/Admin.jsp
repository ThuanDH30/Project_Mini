<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.Entity.Customer" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Welcome Admin</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                background-image: url('img/img1.png'); /* Replace 'your-image.jpg' with the path to your image */
                background-size: cover; /* Cover the entire viewport */
                background-position: center; /* Center the background image */
                font-family: Arial, sans-serif; /* Set a fallback font */
            }

            .container {
                width: 80%;
                max-width: 600px;
                padding: 20px;
                border-radius: 15px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                filter: invert(1);
                text-align: center;
            }

            h1 {
                font-size: 28px;
                margin-bottom: 20px;
                color: white;
                filter: invert(1);
            }

            ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
            }

            li {
                margin-bottom: 10px;
            }

            a {
                display: inline-block;
                padding: 10px 20px;
                text-decoration: none;
                color: #fff;
                background-color: #007bff;
                border-radius: 5px;
                transition: background-color 0.3s;
                filter: invert(1);
            }

            a:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <%
                Object accountObj = session.getAttribute("account");
                if (accountObj instanceof Customer) {
                Customer customer = (Customer) accountObj;
            %>
            <h1>Welcome, <%= customer.getNameCustomer() %></h1>
            <%
        } else {
            // Handle the case where the object in the session is not a Customer
            out.println("<h1>Welcome, Guest</h1>");
        }
            %>
            <ul>
                <li><a href="UserController?action=list">List All Users</a></li>
                <li><a href="ProductController?action=list">List All Products</a></li>
                <li><a href="CategoryController?action=list">List All Category</a></li>
            </ul>
        </div>
    </body>
</html>
