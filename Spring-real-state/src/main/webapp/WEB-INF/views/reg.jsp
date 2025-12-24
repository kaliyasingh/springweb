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

        .signup-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            width: 100%;
            max-width: 500px;
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

        .signup-header {
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

        .signup-subtitle {
            font-size: 14px;
            opacity: 0.9;
        }

        .signup-form {
            padding: 40px 30px;
        }

        .form-row {
            display: flex;
            gap: 15px;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 25px;
            flex: 1;
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

        .password-strength {
            margin-top: 8px;
            height: 4px;
            background: #e0e0e0;
            border-radius: 2px;
            overflow: hidden;
            display: none;
        }

        .password-strength-bar {
            height: 100%;
            width: 0;
            transition: all 0.3s ease;
            border-radius: 2px;
        }

        .strength-weak { background: #ff4444; width: 33%; }
        .strength-medium { background: #ffaa00; width: 66%; }
        .strength-strong { background: #00c851; width: 100%; }

        .terms-agreement {
            margin-bottom: 25px;
            font-size: 14px;
            display: flex;
            align-items: flex-start;
            gap: 10px;
        }

        .terms-agreement input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
            margin-top: 2px;
            flex-shrink: 0;
        }

        .terms-agreement label {
            margin: 0;
            font-weight: 400;
            color: #666;
        }

        .terms-agreement a {
            color: #2a5298;
            text-decoration: none;
        }

        .terms-agreement a:hover {
            text-decoration: underline;
        }

        .signup-button {
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

        .signup-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(244, 185, 66, 0.4);
        }

        .signup-button:active {
            transform: translateY(0);
        }

        .signup-button:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
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

        .error-message {
            color: #ff4444;
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }

        .success-message {
            background: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            display: none;
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <div class="signup-header">
            <div class="logo">
                <span class="logo-premium">Premium</span>
                <span class="logo-realty">Realty</span>
            </div>
            <p class="signup-subtitle">Create your account</p>
        </div>
        
        <form class="signup-form" onsubmit="handleSignup(event)">
            <div class="success-message" id="successMessage">
                Account created successfully! Welcome to Premium Realty.
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="firstName">First Name *</label>
                    <input type="text" id="firstName" name="firstName" placeholder="John" required>
                </div>
                
                <div class="form-group">
                    <label for="lastName">Last Name *</label>
                    <input type="text" id="lastName" name="lastName" placeholder="Doe" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="email">Email Address *</label>
                <input type="email" id="email" name="email" placeholder="john.doe@example.com" required>
                <div class="error-message" id="emailError">Please enter a valid email address</div>
            </div>
            
            <div class="form-group">
                <label for="phone">Phone Number *</label>
                <input type="tel" id="phone" name="phone" placeholder="(555) 123-4567" required>
            </div>
            
            <div class="form-group">
                <label for="username">Username *</label>
                <input type="text" id="username" name="username" placeholder="Choose a username" required minlength="4">
                <div class="error-message" id="usernameError">Username must be at least 4 characters</div>
            </div>
            
            <div class="form-group">
                <label for="password">Password *</label>
                <input type="password" id="password" name="password" placeholder="Create a strong password" required minlength="8">
                <div class="password-strength" id="passwordStrength">
                    <div class="password-strength-bar" id="strengthBar"></div>
                </div>
                <div class="error-message" id="passwordError">Password must be at least 8 characters</div>
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Confirm Password *</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Re-enter your password" required>
                <div class="error-message" id="confirmError">Passwords do not match</div>
            </div>
            
            <div class="terms-agreement">
                <input type="checkbox" id="terms" name="terms" required>
                <label for="terms">
                    I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>
                </label>
            </div>
            
            <button type="submit" class="signup-button" id="signupButton">Create Account</button>
            
            <div class="login-link">
                Already have an account? <a href="#">Sign In</a>
            </div>
        </form>
    </div>

    <script>
        const passwordInput = document.getElementById('password');
        const confirmPasswordInput = document.getElementById('confirmPassword');
        const strengthIndicator = document.getElementById('passwordStrength');
        const strengthBar = document.getElementById('strengthBar');
        const emailInput = document.getElementById('email');
        const usernameInput = document.getElementById('username');

        // Password strength checker
        passwordInput.addEventListener('input', function() {
            const password = this.value;
            strengthIndicator.style.display = password ? 'block' : 'none';
            
            let strength = 0;
            if (password.length >= 8) strength++;
            if (password.match(/[a-z]/) && password.match(/[A-Z]/)) strength++;
            if (password.match(/[0-9]/)) strength++;
            if (password.match(/[^a-zA-Z0-9]/)) strength++;
            
            strengthBar.className = 'password-strength-bar';
            if (strength <= 2) {
                strengthBar.classList.add('strength-weak');
            } else if (strength === 3) {
                strengthBar.classList.add('strength-medium');
            } else {
                strengthBar.classList.add('strength-strong');
            }
        });

        // Real-time password match validation
        confirmPasswordInput.addEventListener('input', function() {
            const confirmError = document.getElementById('confirmError');
            if (this.value && this.value !== passwordInput.value) {
                confirmError.style.display = 'block';
                this.style.borderColor = '#ff4444';
            } else {
                confirmError.style.display = 'none';
                this.style.borderColor = '#e0e0e0';
            }
        });

        // Form submission handler
        function handleSignup(event) {
            event.preventDefault();
            
            const form = event.target;
            const password = passwordInput.value;
            const confirmPassword = confirmPasswordInput.value;
            
            // Validate passwords match
            if (password !== confirmPassword) {
                document.getElementById('confirmError').style.display = 'block';
                confirmPasswordInput.focus();
                return;
            }
            
            // Collect form data
            const formData = {
                firstName: form.firstName.value,
                lastName: form.lastName.value,
                email: form.email.value,
                phone: form.phone.value,
                username: form.username.value,
                timestamp: new Date().toISOString()
            };
            
            // Show success message
            const successMessage = document.getElementById('successMessage');
            successMessage.style.display = 'block';
            
            // Scroll to top to show success message
            document.querySelector('.signup-container').scrollTop = 0;
            
            // In a real application, this would send data to a server
            console.log('Registration data:', formData);
            
            // Reset form after 2 seconds
            setTimeout(() => {
                form.reset();
                successMessage.style.display = 'none';
                strengthIndicator.style.display = 'none';
            }, 3000);
        }

        // Add animation to input fields
        const inputs = document.querySelectorAll('input[type="text"], input[type="email"], input[type="password"], input[type="tel"]');
        inputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.style.transform = 'scale(1.01)';
                this.parentElement.style.transition = 'transform 0.3s ease';
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.style.transform = 'scale(1)';
            });
        });
    </script>
</body>
</html>