<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Registration Page</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    @charset "UTF-8";

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: url('/FoodApp/images/login.jpeg') no-repeat center center/cover;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .div1 {
      width: 100%;
      min-height: 100vh;
      padding: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
      backdrop-filter: blur(6px);
    }

    form {
      background: rgba(30, 30, 60, 0.75);
      padding: 30px;
      width: 100%;
      max-width: 450px;
      border-radius: 20px;
      box-shadow: 0 8px 32px rgba(0,0,0,0.4);
      border: 1px solid rgba(255,255,255,0.1);
      display: flex;
      flex-direction: column;
      transition: transform 0.3s ease;
    }

    form:hover {
      transform: scale(1.02);
    }

    form h1 {
      color: #ffffff;
      text-align: center;
      margin-bottom: 25px;
      font-weight: 600;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"] {
      padding: 12px 15px;
      margin-bottom: 20px;
      border: none;
      border-radius: 10px;
      background: rgba(255,255,255,0.1);
      color: #fff;
      font-size: 16px;
      transition: background 0.3s ease;
    }

    input[type="text"]::placeholder,
    input[type="password"]::placeholder,
    input[type="email"]::placeholder {
      color: #ccc;
    }

    input[type="text"]:focus,
    input[type="password"]:focus,
    input[type="email"]:focus {
      background: rgba(255,255,255,0.2);
      outline: none;
    }

    input[type="submit"] {
      padding: 12px;
      background: linear-gradient(135deg, #6a11cb, #2575fc);
      border: none;
      color: white;
      font-weight: bold;
      font-size: 16px;
      border-radius: 10px;
      cursor: pointer;
      transition: background 0.3s ease;
      margin-top: 10px;
    }

    input[type="submit"]:hover {
      background: linear-gradient(135deg, #ff416c, #ff4b2b);
    }

    .anim {
      color: #eee;
      font-size: 14px;
      margin-bottom: 20px;
      display: flex;
      align-items: center;
    }

    .checkbox {
      margin-right: 10px;
      transform: scale(1.3);
      accent-color: #66ffcc;
    }

    form a {
      color: #66ffcc;
      text-decoration: none;
      font-weight: 500;
      margin-left: 5px;
    }

    form a:hover {
      text-decoration: underline;
    }

    form p {
      margin-top: 20px;
      text-align: center;
      color: #eee;
      font-size: 14px;
    }
  </style>
</head>
<body>
  <div class="div1">
    <form action="register">
      <h1>Registration</h1>
      <input type="text" name="userName" required="required" placeholder="UserName">
      <input type="password" name="password" required="required" placeholder="Password">
      <input type="password" name="cpassword" required="required" placeholder="Confirm Password">
      <input type="email" name="email" required="required" placeholder="Email">
      <input type="text" name="phoneNumber" required="required" placeholder="PhoneNumber">
      <input type="text" name="address" required="required" placeholder="Address">
      <label class="anim">
        <input type="checkbox" class="checkbox" required="required">
        <span>I Agree To The <a href="">Terms & Conditions</a></span>
      </label>
      <input type="submit" value="SignUp">
      <p>Already Have an Account? <a href="login.jsp">Login</a></p>
    </form>
  </div>
</body>
</html>
