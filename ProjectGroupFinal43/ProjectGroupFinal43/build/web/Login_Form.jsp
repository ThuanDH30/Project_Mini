<%-- 
    Document   : Login_Form
    Created on : Feb 28, 2024, 10:51:25 PM
    Author     : Bravo
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
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
            width: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }
        .container form {
            display: flex;
            flex-direction: column;
        }
        .container form input[type="text"],
        .container form input[type="password"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 16px;
        }
        .container form input[type="submit"] {
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            font-size: 16px;
            cursor: pointer;
        }
        .container form input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .register-link {
            text-align: center;
            margin-top: 15px;
        }
        .register-link a {
            color: #007bff;
            text-decoration: none;
        }
        .register-link a:hover {
            text-decoration: underline;
        }
        .show-password-button {
            background-color: transparent;
            border: none;
            color: #007bff;
            cursor: pointer;
            outline: none;
            font-size: 14px;
            text-align: right;
            margin-top: -10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="login" method="post">
            <input type="text" name="username" placeholder="username" required><br>
    <input type="password" id="password" name="password" placeholder="password" required>
    <input type="button" id="showPassword" class="show-password-button" value="Show Password">
    <input type="checkbox" id="remember" name="remember">
    <label for="remember">Remember Me</label><br>
    <input type="submit" value="Login">
        </form>
        <div class="register-link">
            <a href="user-register.jsp">Register as User</a>
        </div>
    </div>

    <script>
        const showPasswordButton = document.getElementById("showPassword");
        const passwordField = document.getElementById("password");

        showPasswordButton.addEventListener("click", function() {
            if (passwordField.type === "password") {
                passwordField.type = "text";
                showPasswordButton.value = "Hide Password";
            } else {
                passwordField.type = "password";
                showPasswordButton.value = "Show Password";
            }
        });
    </script>
</body>
</html>
