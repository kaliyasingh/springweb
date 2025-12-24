<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.nio.charset.StandardCharsets" %>

<%
    // Database Configuration
    String DB_URL = "jdbc:mysql://localhost:3306/ips26mca";
    String DB_USER = "root";
    String DB_PASSWORD = "root";
    
    String message = "";
    String messageType = "";
    
    // Process form submission
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");
        String terms = request.getParameter("terms");
        
        // Server-side validation
        boolean isValid = true;
        StringBuilder errors = new StringBuilder();
        
        if (fullname == null || fullname.trim().length() < 2) {
            errors.append("Full name is required. ");
            isValid = false;
        }
        
        if (email == null || !email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
            errors.append("Valid email is required. ");
            isValid = false;
        }
        
        if (phone == null || !phone.replaceAll("\\D", "").matches("^[0-9]{10}$")) {
            errors.append("Valid 10-digit phone number is required. ");
            isValid = false;
        }
        
        if (username == null || username.length() < 3) {
            errors.append("Username must be at least 3 characters. ");
            isValid = false;
        }
        
        if (password == null || password.length() < 8) {
            errors.append("Password must be at least 8 characters. ");
            isValid = false;
        }
        
        if (!password.equals(confirmPassword)) {
            errors.append("Passwords do not match. ");
            isValid = false;
        }
        
        if (terms == null) {
            errors.append("You must agree to terms and conditions. ");
            isValid = false;
        }
        
        if (isValid) {
            Connection conn = null;
            PreparedStatement checkStmt = null;
            PreparedStatement insertStmt = null;
            ResultSet rs = null;
            
            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                // Establish connection
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                
                // Check if username or email already exists
                String checkQuery = "SELECT * FROM users WHERE username = ? OR email = ?";
                checkStmt = conn.prepareStatement(checkQuery);
                checkStmt.setString(1, username);
                checkStmt.setString(2, email);
                rs = checkStmt.executeQuery();
                
                if (rs.next()) {
                    message = "Username or email already exists!";
                    messageType = "error";
                } else {
                    // Hash password using SHA-256
                    MessageDigest digest = MessageDigest.getInstance("SHA-256");
                    byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
                    StringBuilder hexString = new StringBuilder();
                    for (byte b : hash) {
                        String hex = Integer.toHexString(0xff & b);
                        if (hex.length() == 1) hexString.append('0');
                        hexString.append(hex);
                    }
                    String hashedPassword = hexString.toString();
                    
                    // Insert new user
                    String insertQuery = "INSERT INTO users (fullname, email, phone, username, password, created_at) VALUES (?, ?, ?, ?, ?, NOW())";
                    insertStmt = conn.prepareStatement(insertQuery);
                    insertStmt.setString(1, fullname);
                    insertStmt.setString(2, email);
                    insertStmt.setString(3, phone);
                    insertStmt.setString(4, username);
                    insertStmt.setString(5, hashedPassword);
                    
                    int rowsAffected = insertStmt.executeUpdate();
                    
                    if (rowsAffected > 0) {
                        message = "success";
                        messageType = "success";
                    } else {
                        message = "Registration failed. Please try again.";
                        messageType = "error";
                    }
                }
            } catch (ClassNotFoundException e) {
                message = "Database driver not found: " + e.getMessage();
                messageType = "error";
            } catch (SQLException e) {
                message = "Database error: " + e.getMessage();
                messageType = "error";
            } catch (Exception e) {
                message = "Error: " + e.getMessage();
                messageType = "error";
            } finally {
                // Close resources
                try {
                    if (rs != null) rs.close();
                    if (checkStmt != null) checkStmt.close();
                    if (insertStmt != null) insertStmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            message = errors.toString();
            messageType = "error";
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Premium Realty</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .register-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            width: 100%;
            max-width: 450px;
            animation: slideUp 0.5s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .register-header {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            padding: 40px 30px;
            text-align: center;
            color: white;
        }

        .logo {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .logo-premium {
            color: white;
        }

        .logo-realty {
            color: #f4b942;
        }

        .register-subtitle {
            font-size: 14px;
            opacity: 0.9;
        }

        .register-form {
            padding: 40px 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
            font-size: 14px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="tel"] {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            font-size: 15px;
            transition: all 0.3s ease;
            background: #f8f9fa;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        input[type="tel"]:focus {
            outline: none;
            border-color: #2a5298;
            background: white;
        }

        .error-message {
            color: #d32f2f;
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }

        .error-message.show {
            display: block;
        }

        .alert {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 6px;
            font-size: 14px;
        }

        .alert-error {
            background-color: #ffebee;
            color: #c62828;
            border: 1px solid #ef5350;
        }

        input.error {
            border-color: #d32f2f;
        }

        .password-strength {
            height: 4px;
            background: #e0e0e0;
            border-radius: 2px;
            margin-top: 8px;
            overflow: hidden;
        }

        .password-strength-bar {
            height: 100%;
            width: 0%;
            transition: all 0.3s ease;
            border-radius: 2px;
        }

        .password-strength-bar.weak {
            width: 33%;
            background: #d32f2f;
        }

        .password-strength-bar.medium {
            width: 66%;
            background: #f4b942;
        }

        .password-strength-bar.strong {
            width: 100%;
            background: #4caf50;
        }

        .terms-checkbox {
            display: flex;
            align-items: flex-start;
            gap: 8px;
            margin-bottom: 25px;
            font-size: 13px;
            color: #666;
        }

        .terms-checkbox input[type="checkbox"] {
            margin-top: 2px;
            width: 16px;
            height: 16px;
            cursor: pointer;
        }

        .terms-checkbox a {
            color: #2a5298;
            text-decoration: none;
        }

        .terms-checkbox a:hover {
            text-decoration: underline;
        }

        .register-button {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #f4b942 0%, #d99f2a 100%);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .register-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(244, 185, 66, 0.4);
        }

        .register-button:active {
            transform: translateY(0);
        }

        .login-link {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: #666;
        }

        .login-link a {
            color: #2a5298;
            text-decoration: none;
            font-weight: 600;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .success-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .success-modal.show {
            display: flex;
        }

        .success-content {
            background: white;
            padding: 40px;
            border-radius: 12px;
            text-align: center;
            max-width: 400px;
            animation: slideUp 0.3s ease-out;
        }

        .success-icon {
            width: 60px;
            height: 60px;
            background: #4caf50;
            border-radius: 50%;
            margin: 0 auto 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            color: white;
        }

        .success-content h2 {
            color: #333;
            margin-bottom: 10px;
        }

        .success-content p {
            color: #666;
            margin-bottom: 25px;
        }

        .redirect-timer {
            color: #2a5298;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-header">
            <div class="logo">
                <span class="logo-premium">Premium</span>
                <span class="logo-realty">Realty</span>
            </div>
            <p class="register-subtitle">Create your account</p>
        </div>
        
        <form class="register-form" method="POST" onsubmit="return validateForm()">
            <% if (!"".equals(message) && "error".equals(messageType)) { %>
                <div class="alert alert-error">
                    <%= message %>
                </div>
            <% } %>

            <div class="form-group">
                <label for="fullname">Full Name</label>
                <input type="text" id="fullname" name="fullname" placeholder="Enter your full name" required>
                <div class="error-message" id="fullname-error">Please enter your full name</div>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
                <div class="error-message" id="email-error">Please enter a valid email</div>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>
                <div class="error-message" id="phone-error">Please enter a valid phone number</div>
            </div>
            
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Choose a username" required>
                <div class="error-message" id="username-error">Username must be at least 3 characters</div>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Create a password" required>
                <div class="password-strength">
                    <div class="password-strength-bar" id="strength-bar"></div>
                </div>
                <div class="error-message" id="password-error">Password must be at least 8 characters</div>
            </div>

            <div class="form-group">
                <label for="confirm-password">Confirm Password</label>
                <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm your password" required>
                <div class="error-message" id="confirm-error">Passwords do not match</div>
            </div>

            <div class="terms-checkbox">
                <input type="checkbox" id="terms" name="terms" required>
                <label for="terms">I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a></label>
            </div>
            
            <button type="submit" class="register-button">Create Account</button>
            
            <div class="login-link">
                Already have an account? <a href="login.jsp">Sign In</a>
            </div>
        </form>
    </div>

    <div class="success-modal" id="successModal">
        <div class="success-content">
            <div class="success-icon">✓</div>
            <h2>Registration Successful!</h2>
            <p>Your account has been created successfully.</p>
            <p>Redirecting to login page in <span class="redirect-timer" id="timer">3</span> seconds...</p>
        </div>
    </div>

    <% if ("success".equals(message)) { %>
        <script>
            window.onload = function() {
                showSuccessModal();
            }
        </script>
    <% } %>

    <script>
        // Password strength checker
        const passwordInput = document.getElementById('password');
        const strengthBar = document.getElementById('strength-bar');

        passwordInput.addEventListener('input', function() {
            const password = this.value;
            let strength = 0;

            if (password.length >= 8) strength++;
            if (password.match(/[a-z]/) && password.match(/[A-Z]/)) strength++;
            if (password.match(/[0-9]/)) strength++;
            if (password.match(/[^a-zA-Z0-9]/)) strength++;

            strengthBar.className = 'password-strength-bar';
            if (strength === 1 || strength === 2) {
                strengthBar.classList.add('weak');
            } else if (strength === 3) {
                strengthBar.classList.add('medium');
            } else if (strength === 4) {
                strengthBar.classList.add('strong');
            }
        });

        // Client-side form validation
        function validateForm() {
            let isValid = true;

            // Full name validation
            const fullname = document.getElementById('fullname');
            if (fullname.value.trim().length < 2) {
                showError('fullname');
                isValid = false;
            } else {
                hideError('fullname');
            }

            // Email validation
            const email = document.getElementById('email');
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email.value)) {
                showError('email');
                isValid = false;
            } else {
                hideError('email');
            }

            // Phone validation
            const phone = document.getElementById('phone');
            const phoneRegex = /^[0-9]{10}$/;
            if (!phoneRegex.test(phone.value.replace(/\D/g, ''))) {
                showError('phone');
                isValid = false;
            } else {
                hideError('phone');
            }

            // Username validation
            const username = document.getElementById('username');
            if (username.value.length < 3) {
                showError('username');
                isValid = false;
            } else {
                hideError('username');
            }

            // Password validation
            const password = document.getElementById('password');
            if (password.value.length < 8) {
                showError('password');
                isValid = false;
            } else {
                hideError('password');
            }

            // Confirm password validation
            const confirmPassword = document.getElementById('confirm-password');
            if (password.value !== confirmPassword.value) {
                showError('confirm');
                isValid = false;
            } else {
                hideError('confirm');
            }

            return isValid;
        }

        function showError(field) {
            const input = document.getElementById(field === 'confirm' ? 'confirm-password' : field);
            const error = document.getElementById(field + '-error');
            input.classList.add('error');
            error.classList.add('show');
        }

        function hideError(field) {
            const input = document.getElementById(field === 'confirm' ? 'confirm-password' : field);
            const error = document.getElementById(field + '-error');
            input.classList.remove('error');
            error.classList.remove('show');
        }

        function showSuccessModal() {
            const modal = document.getElementById('successModal');
            modal.classList.add('show');

            let timeLeft = 3;
            const timerElement = document.getElementById('timer');

            const countdown = setInterval(() => {
                timeLeft--;
                timerElement.textContent = timeLeft;

                if (timeLeft <= 0) {
                    clearInterval(countdown);
                    window.location.href = 'login.jsp';
                }
            }, 1000);
        }

        // Add animation to input fields
        const inputs = document.querySelectorAll('input[type="text"], input[type="email"], input[type="password"], input[type="tel"]');
        inputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.style.transform = 'scale(1.02)';
                this.parentElement.style.transition = 'transform 0.3s ease';
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.style.transform = 'scale(1)';
            });
        });
    </script>
</body>
</html>