<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        body { background-color: #f4fbfb; font-family: 'Poppins', sans-serif; }
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
        input[type="text"], input[type="password"], input[type="email"] {
            width: 100%; padding: 10px; margin-bottom: 10px; border-radius: 5px; border: none;
        }
        .center-button {
            width: 100%; padding: 10px; background-color: #db6934;
            color: white; border: none; border-radius: 5px; cursor: pointer;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg sticky-top shadow-sm">
    <div class="container-fluid px-3">
        <a class="navbar-brand" href="admin_login.jsp">
            <img src="image/logo.png" alt="Logo" style="height: 65px;" />
            <span class="fw-bold text-dark ms-2">ADMIN PANEL</span>
        </a>
    </div>
</nav>

<form action="admin_register" method="post">
    <div id="register-box">
        <h3 style="color: black;">ADMIN REGISTER</h3>

        <input type="text" name="username" placeholder="Admin Username"
               required pattern="[A-Za-z\s]+"
               title="Username must contain only letters">

        <input type="email" name="email" placeholder="Admin Email" required>

        <input type="password" name="password_hash1" placeholder="Password" required minlength="6">
        <input type="password" name="password_hash2" placeholder="Confirm Password" required>

        <button class="center-button" type="submit">Register</button>

        <p style="margin-top: 15px; color: black;">
            Already an admin? <a href="admin_login.jsp" style="color: #ea2d10;">Login here</a>
        </p>
    </div>
</form>

<script>
    document.querySelector("form").addEventListener("submit", function (event) {
        let pass = document.querySelector('input[name="password_hash1"]').value;
        let cpass = document.querySelector('input[name="password_hash2"]').value;
        if (pass !== cpass) {
            event.preventDefault();
            alert("Passwords do not match!");
        }
    });
</script>
</body>
</html>
