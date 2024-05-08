<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"],
        textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 5px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="submit"] {
            width: 100%;
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
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>User Registration</h2>
        <form id="registrationForm" action="UserController" method="post">
            <input type="hidden" name="action" value="insert">
            <label>Name:</label>
            <input type="text" name="name" required>
            <label>Email:</label>
            <input type="email" name="email" required>
            <span id="emailError" class="error"></span>
            <label>Password:</label>
            <input type="password" name="password" required>
            <span id="passwordError" class="error"></span>
            <label>Phone Number:</label>
            <input type="text" name="phoneNumber" required>
            <span id="phoneError" class="error"></span>
            <label>Age:</label>
            <input type="text" name="age" required>
            <label>Address:</label>
            <textarea name="address" rows="4" required></textarea>
            <label>CCCD:</label>
            <input type="text" name="cccd" required>
            <span id="cccdError" class="error"></span>
            <input type="submit" value="Register">
        </form>
    </div>
    <script src="validation.js"></script>
</body>
</html>
