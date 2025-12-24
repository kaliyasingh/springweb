<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login - Premium Realty</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 20px;
}

.login-container {
	background: white;
	padding: 2.5rem;
	border-radius: 12px;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.12);
	width: 100%;
	max-width: 420px;
	border: 1px solid rgba(255, 255, 255, 0.1);
}

.logo-section {
	text-align: center;
	margin-bottom: 2rem;
}

.logo {
	width: 50px;
	height: 50px;
	background: #20d8b4;
	border-radius: 50%;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 1rem;
	color: white;
	font-size: 20px;
	font-weight: bold;
}

.brand-name {
	color: #2c3e50;
	font-size: 1.6rem;
	font-weight: 600;
	margin-bottom: 0.5rem;
}

.brand-subtitle {
	color: #7f8c8d;
	font-size: 0.9rem;
}

.form-title {
	text-align: center;
	color: #2c3e50;
	font-size: 1.3rem;
	font-weight: 500;
	margin-bottom: 2rem;
	padding-bottom: 0.5rem;
	border-bottom: 2px solid #20d8b4;
}

.form-group {
	margin-bottom: 1.5rem;
}

.form-group label {
	display: block;
	margin-bottom: 0.5rem;
	color: #2c3e50;
	font-weight: 500;
	font-size: 0.95rem;
}

.form-group input {
	width: 100%;
	padding: 0.9rem 1rem;
	border: 2px solid #e9ecef;
	border-radius: 8px;
	font-size: 1rem;
	transition: border-color 0.3s ease;
	background: #f8f9fa;
}

.form-group input:focus {
	outline: none;
	border-color: #20d8b4;
	background: white;
}

.login-btn {
	width: 100%;
	background: #20d8b4;
	color: white;
	padding: 1rem;
	border: none;
	border-radius: 8px;
	font-size: 1rem;
	font-weight: 600;
	cursor: pointer;
	transition: background-color 0.3s ease;
	margin-bottom: 1rem;
}

.login-btn:hover {
	background: #1dd1a1;
}

.login-btn:active {
	transform: translateY(1px);
}

.forgot-password {
	text-align: center;
}

.forgot-password a {
	color: #20d8b4;
	text-decoration: none;
	font-size: 0.9rem;
	transition: color 0.3s ease;
}

.forgot-password a:hover {
	color: #1dd1a1;
	text-decoration: underline;
}

.message {
	padding: 0.8rem;
	border-radius: 6px;
	margin-bottom: 1rem;
	text-align: center;
	font-size: 0.9rem;
	display: none;
}

.error-message {
	background-color: #fee;
	color: #c33;
	border: 1px solid #fcc;
}

.success-message {
	background-color: #efe;
	color: #363;
	border: 1px solid #cfc;
}

.footer-note {
	text-align: center;
	margin-top: 1.5rem;
	padding-top: 1rem;
	border-top: 1px solid #e9ecef;
	color: #7f8c8d;
	font-size: 0.8rem;
}

@media ( max-width : 480px) {
	.login-container {
		padding: 2rem 1.5rem;
		margin: 1rem;
	}
	.brand-name {
		font-size: 1.4rem;
	}
}

.input-wrapper {
	position: relative;
}

.show-password {
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
	background: none;
	border: none;
	color: #7f8c8d;
	cursor: pointer;
	font-size: 0.8rem;
}

.show-password:hover {
	color: #20d8b4;
}
</style>
</head>
<body>
	<div class="login-container">
		<div class="logo-section">
			<div class="logo">PR</div>
			<h1 class="brand-name">Premium Realty</h1>
			<p class="brand-subtitle">Property Management System</p>
		</div>

		<h2 class="form-title">Admin Login</h2>
		 
       <%
       String msg = (String)request.getAttribute("msg");
       if (msg!=null){
    	   %>
    	   <div class="error-message message" style="display:block;">
       <%=msg %>
      </div>
      <%
       }
       %>

		<div class="error-message message" id="errorMessage"></div>
		<div class="success-message message" id="successMessage"></div>

		<form id="loginForm" action="checkadmin" method="post">
			<div class="form-group">
				<label for="username">Username or Email</label> <input type="text"
					id="username" name="username" required
					placeholder="Enter your username">
			</div>

			<div class="form-group">
				<label for="password">Password</label>
				<div class="input-wrapper">
					<input type="password" id="password" name="password" required
						placeholder="Enter your password">
					<button type="button" class="show-password"
						onclick="togglePassword()">Show</button>
				</div>
			</div>

			<button type="submit" class="login-btn">Sign In</button>
		</form>

<script>
document.getElementById('loginForm').addEventListener('submit', function(e) {
    // Basic client-side validation
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();
    
    hideMessages(); // hide previous messages

    if (username === '') {
        showError('Please enter your username.');
        document.getElementById('username').focus();
        e.preventDefault(); // stop form submission
        return;
    }

    if (password === '') {
        showError('Please enter your password.');
        document.getElementById('password').focus();
        e.preventDefault(); // stop form submission
        return;
    }
});

// Toggle password visibility
function togglePassword() {
    const passwordField = document.getElementById('password');
    const toggleBtn = document.querySelector('.show-password');

    if (passwordField.type === 'password') {
        passwordField.type = 'text';
        toggleBtn.textContent = 'Hide';
    } else {
        passwordField.type = 'password';
        toggleBtn.textContent = 'Show';
    }
}

// Show/hide messages
function showError(message) {
    const errorDiv = document.getElementById('errorMessage');
    errorDiv.textContent = message;
    errorDiv.style.display = 'block';
}

function hideMessages() {
    document.getElementById('errorMessage').style.display = 'none';
}
</script>

</body>
</html>