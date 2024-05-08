<%-- 
    Document   : update-user
    Created on : Mar 2, 2024, 6:55:49 PM
    Author     : Bravo
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page  import="Model.Entity.Customer" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 400px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"] {
            padding: 10px;
            margin: 5px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="submit"] {
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update User</h1>
        <form action="UserController" method="get">
            <input type="hidden" name="action" value="edit1">
            <input type="hidden" id="id" name="id" value="${customer.idCustomer}">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${customer.nameCustomer}"><br>
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" value="${customer.emailCustomer}"><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="${customer.passWordCustomer}"><br>
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" value="${customer.numPhoneCustomer}"><br>
            <label for="age">Age:</label>
            <input type="text" id="age" name="age" value="${customer.ageCustomer}"><br>
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="${customer.addressCustomer}"><br>
            <label for="cccd">CCCD:</label>
            <input type="text" id="cccd" name="cccd" value="${customer.cccdCustomer}"><br><br>
            <input type="submit" value="Update">
        </form>
    </div>
</body>

</html>

