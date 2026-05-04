<%--
  Created by IntelliJ IDEA.
  User: Prajwal
  Date: 08-09-2025
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&display=swap" rel="stylesheet" />
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

        .main-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 80px);
            padding: 20px;
        }

        /* Login box styling */
        #login-box {
            background-color: rgba(255, 255, 255, 0.3);
            padding: 36px 40px 44px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.6);
            width: 400px;
            max-width: 95vw;
            text-align: center;
            color: black;
            user-select: none;
        }

        #login-box h2 {
            margin-bottom: 28px;
            font-weight: 700;
            font-size: 2.2rem;
            letter-spacing: 1.5px;
        }

        /* Inputs */
        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 14px 16px;
            margin-bottom: 18px;
            border-radius: 8px;
            border: none;
            font-size: 1rem;
            box-shadow: inset 0 0 6px rgba(0,0,0,0.15);
            transition: box-shadow 0.25s ease;
        }
        input:focus {
            outline: none;
            box-shadow: inset 0 0 8px #db6934;
        }

        /* Show password toggle */
        .show-pass-container {
            text-align: left;
            margin-bottom: 18px;
            user-select: none;
            font-size: 0.9rem;
            color: black;
            display: flex;
            align-items: center;
            gap: 6px;
            cursor: pointer;
        }
        .show-pass-container input[type="checkbox"] {
            cursor: pointer;
        }

        .center-button {
            width: 100%;
            padding: 14px 0;
            background-color: #6ec24d;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
            user-select: none;
        }
        .center-button:hover {
            background-color: #5bb23f;
        }

        #login-box p.register-text {
            font-size: 0.95rem;
            margin-top: 14px;
            color: black;
            user-select: none;
        }
        #login-box p.register-text a {
            font-weight: 600;
            color: #db6934;
            text-decoration: none;
            cursor: pointer;
            transition: color 0.25s ease;
        }
        #login-box p.register-text a:hover {
            color: #c45a2d;
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            #login-box {
                padding: 30px 25px 38px 25px;
            }
            #login-box h2 {
                font-size: 1.8rem;
            }
        }
        .dropdown-toggle::after {
            display: none;
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

<div class="main-container">
    <form action="login" method="post">
        <div id="login-box">
            <h2>LOGIN HERE</h2>

            <input
                    type="email"
                    id="gmail"
                    name="gmail"
                    placeholder="Enter your Gmail"
                    autocomplete="username"
                    aria-label="Gmail"
                    required
            />

            <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter your Password"
                    autocomplete="current-password"
                    aria-label="Password"
                    required
            />

            <label class="show-pass-container" for="showPassCheckbox">
                <input
                        type="checkbox"
                        id="showPassCheckbox"
                        onclick="togglePassword()"
                        aria-label="Show password"
                />
                Show Password
            </label>

            <button type="submit" class="center-button">Login</button>

            <p class="register-text">
                Don't have an account? <a href="reg.jsp">Register here</a>
            </p>
        </div>
    </form>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Force Gmail field to lowercase
    document.getElementById("gmail").addEventListener("input", function () {
        this.value = this.value.toLowerCase();
    });

    // Show/Hide password toggle
    function togglePassword() {
        let passField = document.getElementById("password");
        passField.type = passField.type === "password" ? "text" : "password";
    }
</script>

</body>
</html>
