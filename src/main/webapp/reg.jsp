<%--
  Created by IntelliJ IDEA.
  User: Prajwal
  Date: 08-09-2025
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <title>Genshin Register</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&display=swap" rel="stylesheet">

  <style>
    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background-color: #f4fbfb;
      color: black;
    }
    .navbar {
      background-color: #f4fbfb;
      padding: 8px 0;
      box-shadow: 0 2px 6px rgb(0 0 0 / 0.1);
      position: sticky;
      top: 0;
      z-index: 1030;
    }

    .navbar-brand img {
      height: 65px;
      width: auto;
    }

    .navbar-nav .nav-link {
      padding: 6px 14px;
      font-size: 16px;
      color: #0d2a10;
      position: relative;
    }

    .navbar-nav .nav-link.active::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 14px;
      width: 70%;
      height: 2px;
      background-color: #0d1b2a;
    }

    .navbar-nav .nav-link:hover {
      color: #d64717;
    }

    .icon-btn {
      font-size: 20px;
      color: #0d1b2a;
      background: none;
      border: none;
      padding: 6px 10px;
      margin-left: 8px;
      cursor: pointer;
    }

    .icon-btn:hover {
      color: #20c997;
    }

    .btn-success {
      background-color: #20c997;
      border: none;
    }

    .btn-success:hover {
      background-color: #1bb389;
    }

    .navbar .container-fluid {
      padding-left: 50px;
      padding-right: 50px;
    }

    .logo {
      position: absolute;
      top: 10%;
      left: 40%;
      width: 250px;
    }

    #register-box {
      background-color: rgba(255, 255, 255, 0.3);
      padding: 38px;
      border-radius: 10px;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.5);
      width: 450px;
      text-align: center;
      position: absolute;
      top: 22%;
      left: 34%;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"],
    input[type="tel"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      border-radius: 5px;
      border: none;
    }

    .center-button {
      width: 100%;
      padding: 10px;
      background-color: #db6934;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    a {
      color: white;
      text-decoration: underline;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg sticky-top shadow-sm">
  <div class="container-fluid px-3 d-flex align-items-center justify-content-between">
    <a class="navbar-brand d-flex align-items-center" href="#">
      <img src="image/logo.png" alt="Logo" class="me-2" />
      <div class="fw-bold ms-1 text-dark">
        HOME<br />
        <small class="fw-light" style="letter-spacing: 2px;">ASSISTANT</small>
      </div>
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <div class="navbar-toggler-icon"></div>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav me-3">
        <li class="nav-item"><a class="nav-link active" href="home.jsp">Home</a></li>

        <li class="nav-item"><a class="nav-link" href="contact.jsp">Contacts</a></li>
      </ul>
    </div>
  </div>
</nav>


<form action="register" method="post">
  <div id="register-box">
    <h3 style="color: black;">REGISTER HERE</h3>

    <!-- Username (only letters allowed) -->
    <input type="text" name="username" id="field1" placeholder="Username"
           required pattern="[A-Za-z\s]+"
           title="Username must contain only letters">

    <!-- Email (browser shows inline validation automatically) -->
    <input type="email" name="email" id="field2" placeholder="Email" required>

    <!-- Phone (exactly 10 digits) -->
    <input type="tel" name="mobile" id="field3" placeholder="Phone Number"
           required pattern="[0-9]{10}" maxlength="10"
           title="Phone number must be 10 digits">

    <!-- Password -->
    <input type="password" name="password_hash1" id="field4" placeholder="Password"
           required minlength="6" title="Password must be at least 6 characters">

    <!-- Confirm Password -->
    <input type="password" name="password_hash2" id="field5" placeholder="Confirm Password" required>

    <br>
    <button class="center-button" type="submit">Register</button>

    <p style="margin-top: 15px; color: black;">
      Already have an account? <a href="login.jsp" style="color: #ea2d10;">Login here</a>
    </p>
  </div>
</form>

<script>
  document.querySelector("form").addEventListener("submit", function (event) {
    let pass = document.getElementById("field4").value;
    let cpass = document.getElementById("field5").value;

    if (pass !== cpass) {
      event.preventDefault();
      document.getElementById("field5").setCustomValidity("Passwords do not match");
      document.getElementById("field5").reportValidity();
    } else {
      document.getElementById("field5").setCustomValidity(""); // reset message
    }
  });
</script>


</body>
</html>
