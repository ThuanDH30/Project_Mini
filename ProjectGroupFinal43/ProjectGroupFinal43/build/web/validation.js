/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// Function to validate email format
function validateEmail(email) {
    var regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(email);
}

// Function to validate password format
function validatePassword(password) {
    var regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,}$/;
    return regex.test(password);
}

// Function to validate phone number format
function validatePhoneNumber(phoneNumber) {
    var regex = /^\d{10}$/;
    return regex.test(phoneNumber);
}

// Function to validate CCCD format
function validateCCCD(cccd) {
    var regex = /^\d{12}$/;
    return regex.test(cccd);
}

// Function to handle form submission
document.getElementById("registrationForm").addEventListener("submit", function(event) {
    var email = document.getElementsByName("email")[0].value;
    var password = document.getElementsByName("password")[0].value;
    var phoneNumber = document.getElementsByName("phoneNumber")[0].value;
    var cccd = document.getElementsByName("cccd")[0].value;

    var emailError = document.getElementById("emailError");
    var passwordError = document.getElementById("passwordError");
    var phoneError = document.getElementById("phoneError");
    var cccdError = document.getElementById("cccdError");

    // Clear previous error messages
    emailError.innerText = "";
    passwordError.innerText = "";
    phoneError.innerText = "";
    cccdError.innerText = "";

    // Validate email
    if (!validateEmail(email)) {
        emailError.innerText = "Invalid email format";
        event.preventDefault(); //
    }

    // Validate password
    if (!validatePassword(password)) {
        passwordError.innerText = "Password must contain at least 8 characters, including uppercase, lowercase, numbers, and special characters";
        event.preventDefault(); // 
    }

    // Validate phone number
    if (!validatePhoneNumber(phoneNumber)) {
        phoneError.innerText = "Invalid phone number format (10 digits)";
        event.preventDefault(); //
    }

    // Validate CCCD
    if (!validateCCCD(cccd)) {
        cccdError.innerText = "Invalid CCCD format (12 digits)";
        event.preventDefault(); //
    }
});
