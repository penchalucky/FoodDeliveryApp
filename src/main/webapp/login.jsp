<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login Page</title>
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
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}


    .div1 {
      width: 100%;
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      backdrop-filter: blur(6px);
    }

    form {
      background: rgba(30, 30, 60, 0.75);
      padding: 30px;
      width: 380px;
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

    input[type="email"],
    input[type="password"] {
      padding: 12px 15px;
      margin-bottom: 20px;
      border: none;
      border-radius: 10px;
      background: rgba(255,255,255,0.1);
      color: #fff;
      font-size: 16px;
      transition: background 0.3s ease;
    }

    input[type="email"]::placeholder,
    input[type="password"]::placeholder {
      color: #ccc;
    }

    input[type="email"]:focus,
    input[type="password"]:focus {
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
    }

    input[type="submit"]:hover {
      background: linear-gradient(135deg, #ff416c, #ff4b2b);
    }

    form p {
      margin-top: 20px;
      text-align: center;
      color: #eee;
      font-size: 14px;
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
  </style>
</head>
<body>
  <div class="div1">
    <form action="login">
      <h1>Login</h1>
      <input type="email" name="email" required placeholder="Email">
      <input type="password" name="password" placeholder="Password">
      <input type="submit" value="SignIn" class="login">
      <p>Don't have an Account?<a href="register.jsp">Register</a></p>
    </form>
  </div>
</body>
</html>
