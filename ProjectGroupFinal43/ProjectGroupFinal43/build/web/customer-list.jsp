<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Entity.Customer" %>
<%@ page import="Controller.UserController" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Customer List</title>
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
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Age</th>
                <th>Address</th>
                <th>CCCD</th>
                <th>Role ID</th>
                <th>Action</th>
            </tr>
            <% for (Customer customer : (List<Customer>)request.getAttribute("customers")) { %>
            <tr>
                <td><%= customer.getIdCustomer() %></td>
                <td><%= customer.getNameCustomer() %></td>
                <td><%= customer.getEmailCustomer() %></td>
                <td><%= customer.getNumPhoneCustomer() %></td>
                <td><%= customer.getAgeCustomer() %></td>
                <td><%= customer.getAddressCustomer() %></td>
                <td><%= customer.getCccdCustomer() %></td>
                <td><%= customer.getRole_ID() %></td>
                <td class="action-links">
                    <a href="UserController?action=edit&id=<%= customer.getIdCustomer() %>">Update</a>
                    <a href="UserController?action=delete&id=<%= customer.getIdCustomer() %>">Delete</a>
                </td>
            </tr>
            <% } %>
        </table>
    </body>
</html>
