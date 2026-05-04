<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f4fbfb; font-family: 'Poppins', sans-serif; }
        #login-box {
            background-color: rgba(255, 255, 255, 0.3);
            padding: 38px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.5);
            width: 400px;
            text-align: center;
            position: absolute;
            top: 25%;
            left: 50%;
            transform: translateX(-50%);
        }
        input[type="text"], input[type="password"] {
            width: 100%; padding: 10px; margin-bottom: 10px; border-radius: 5px; border: none;
        }
        .center-button {
            width: 100%; padding: 10px; background-color: #db6934;
            color: white; border: none; border-radius: 5px; cursor: pointer;
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
    </style>
</head>
<body>

<!-- Fixed Navbar -->
<nav class="navbar navbar-expand-lg sticky-top shadow-sm">
    <div class="container-fluid px-3 d-flex align-items-center justify-content-between">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <img src="image/logo.png" alt="Logo" class="me-2" />
            <div class="fw-bold ms-1 text-dark">
                HOME<br />
                <small class="fw-light" style="letter-spacing: 2px;">ASSISTANT</small>
            </div>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav me-3">
                <li class="nav-item"><a class="nav-link active" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contacts</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Login Form -->
<form action="admin_login" method="post">
    <div id="login-box">
        <h3 style="color: black;">ADMIN LOGIN</h3>

        <input type="text" name="username" placeholder="Admin Username" required>
        <input type="password" name="password" placeholder="Password" required>

        <button class="center-button" type="submit">Login</button>

<%--        <p style="margin-top: 15px; color: black;">--%>
<%--            Not registered? <a href="admin_register.jsp" style="color: #ea2d10;">Register</a>--%>
<%--        </p>--%>
    </div>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
