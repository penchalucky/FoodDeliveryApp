<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.foodApp.modules.*,java.util.List,com.foodApp.DaoImpl.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Address</title>
    <style>
       body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    overflow-x: hidden;
}

/* Navbar styles */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
    background-color: #333; /* Dark green background */
    color: white;
}

.navbar-left {
    display: flex;
    align-items: center;
}

.navbar-left .logo {
    height: 40px;
    margin-right: 10px;
}

.navbar-left .company-name {
    font-size: 24px;
    font-weight: 600;
}

.navbar-center {
    font-size: 18px;
    font-weight: 500;
    text-align: center;
    padding-top: 5px;
}

.nav-menu {
    display: flex;
    list-style-type: none;
    margin: 0;
    padding: 0;
    align-items: center;
}

.nav-menu li {
    position: relative;
    margin-left: 20px;
}

.nav-menu li a {
    color: white;
    text-decoration: none;
    font-size: 16px;
    padding: 6px 10px;
    border-radius: 5px;
    transition: background-color 0.3s ease, color 0.3s ease;
    vertical-align: middle;
}

.nav-menu li a:hover {
    background-color: #FF5722; /* Hover background color */
    color: #fff;
}

.dropdown .dropbtn {
    background: none;
    border: none;
    color: white;
    cursor: pointer;
    font-size: 16px;
    padding: 6px 10px;
    border-radius: 5px;
    transition: background-color 0.3s ease, color 0.3s ease;
    margin-top: 5px; /* Lower the profile button slightly */
}

.dropdown .dropbtn:hover {
    background-color: #FF5722; /* Hover background color */
}

.dropdown-content {
    display: none;
    position: absolute;
    right: 0;
    background-color: #004d00;
    min-width: 180px;
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    z-index: 1;
    border-radius: 5px;
    margin-top: 5px; /* Close to the button to prevent gap */
}

.dropdown-content a {
    color: white;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.dropdown-content a:hover {
    background-color: #008000; /* Hover background color */
}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: #008000; /* Hover background color */
}

/* Additional styling */
.nav-menu li:hover .dropdown-content {
    display: block;
}

.dropdown-content a {
    white-space: nowrap;
}
/* Keep the dropdown open when hovering over the button or the dropdown content */
.nav-menu li:hover .dropdown-content,
.dropdown-content:hover {
    display: block;
}

/* No need for JS toggle in this case */
.show {
    display: block;
}

 .form-container {
            background-color: white;
            padding: 40px 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 500px;
            margin: 50px auto;
        }
        .form-container label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            padding-left: 2px;
        }
        .form-container textarea {
            width: 100%;
            padding: 15px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
            resize: none;
            height: 120px;
        }
        .form-container input[type="submit"] {
            width: 100%;
            padding: 15px;
            background-color: #28a745; /* Green color */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }
        .form-container input[type="submit"]:hover {
            background-color: #e64a19; /* Dark orange on hover */
        }
        .footer {
            background-color: #333; /* Dark Orange */
            color: white;
            padding: 20px;
            margin-top: auto;
        }
        .footer .footer-content {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        .footer .footer-left, .footer .footer-center, .footer .footer-right {
            margin: 10px 0;
        }
        .footer .footer-logo {
            height: 40px;
            margin-bottom: 10px;
        }
        .footer p, .footer h3 {
            margin: 0;
        }
        .footer .social-icon {
            color: white;
            margin-right: 10px;
            text-decoration: none;
            font-size: 20px;
        }
        .footer-bottom {
            text-align: center;
            margin-top: 20px;
        }
        .footer-bottom p {
            margin: 0;
        }
        .footer-bottom a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
        }
    </style>
</head>
<body>
<nav class="navbar">
        <div class="navbar-left">
            <img src="/foodApp/images/logo.png" alt="Company Logo" class="logo">
            <span class="company-name">GRILL&CHILL</span>
        </div>
        <div class="navbar-center">
            <% User user = (User) session.getAttribute("loginUser"); %>
            <% if (user != null) { %>
                <span class="user-welcome">Welcome, <%= user.getUserName() %></span>
            <% } %>
        </div>
        <ul class="nav-menu">
            <li><a href="home.jsp"><i class="fas fa-home"></i> Home</a></li>
            <% if (user != null) { %>
                <li><a href="viewCart.jsp"><i class="fas fa-cart-shopping"></i> View Cart</a></li>
                <li><a href="ordersHistory?userId=<%= user.getUserId() %>"><i class="fas fa-history"></i> Order History</a></li>
                <li class="dropdown">
                    <button class="dropbtn">
                        <i class="fas fa-user"></i> Profile <i class="fas fa-caret-down"></i>
                    </button>
                    <div id="dropdown-content" class="dropdown-content">
                        <a href="viewProfile.jsp"><i class="fas fa-user-circle"></i> View Profile</a>
                        <a href="updateProfile.jsp"><i class="fas fa-user-edit"></i> Update Profile</a>
                        <a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </div>
                </li>
            <% } else { %>
                <li><a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                <li><a href="register.jsp"><i class="fas fa-user-plus"></i> Register</a></li>
            <% } %>
        </ul>
    </nav>


<div class="form-container">
    <form action="update">
        <label for="address">Address</label>
        <textarea id="address" name="address" placeholder="Enter your address"></textarea>
        <input type="submit" value="Save">
    </form>
</div>

<footer class="footer">
    <div class="footer-content">
        <div class="footer-left">
            <img src="/foodApp/images/logo.png" alt="Company Logo" class="footer-logo">
            <p>&copy; 2025 GRILL&CHILL. All rights reserved by Penchal.</p>
        </div>
        <div class="footer-center">
            <h3>Contact Us</h3>
            <p><i class="fas fa-map-marker-alt"></i> 123 Food Street, Tasty Town, FL 12345</p>
            <p><i class="fas fa-phone"></i> +1 (234) 567-8901</p>
            <p><i class="fas fa-envelope"></i> <a href="mailto:support@company.com">support@company.com</a></p>
        </div>
        <div class="footer-right">
            <h3>Follow Us</h3>
            <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
            <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
            <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
        </div>
    </div>
    <div class="footer-bottom">
        <p><a href="#">Terms of Service</a> | <a href="#">Privacy Policy</a></p>
    </div>
</footer>
 <script src="home.js"></script>
</body>
</html>
