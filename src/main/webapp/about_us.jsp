<%--
  Created by IntelliJ IDEA.
  User: Prajwal
  Date: 12-09-2025
  Time: 07:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background-color: #f9fafc;
        }
        .navbar {
            background-color: #f4fbfb;
            padding: 8px 0;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        .navbar-brand img { height: 65px; width: auto; }
        .navbar-nav .nav-link { padding: 6px 14px; font-size: 16px; color: #0d2a10; }
        .navbar-nav .nav-link:hover { color: #d64717; }
        .icon-btn { font-size: 20px; color: #0d1b2a; background: none; border: none; padding: 6px 10px; margin-left: 8px; }
        .icon-btn:hover { color: #20c997; }
        .btn-success { background-color: #20c997; border: none; }
        .btn-success:hover { background-color: #1bb389; }

        .dropdown-toggle::after
        {
            display: none;
        }

        .hero {
            background-color: #fff;
            padding: 80px 20px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            gap: 30px;
        }
        .hero-text {
            flex: 1 1 400px;
            max-width: 500px;
        }
        .hero-text h1 {
            font-size: 2.8rem;
            font-weight: 700;
            color: #ff6600;
        }
        .hero-text p {
            font-size: 1.1rem;
            margin: 20px 0;
            color: #444;
        }
        .hero img {
            max-width: 500px;
            border-radius: 15px;
        }

        .info-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin: 50px auto;
            max-width: 1000px;
        }
        .info-card {
            background: white;
            padding: 20px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            transition: transform 0.2s ease;
        }
        .info-card:hover {
            transform: translateY(-5px);
        }
        .info-card h4 {
            color: #ff6600;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .company-info {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            gap: 30px;
            background: #fff;
            padding: 60px 20px;
            max-width: 1100px;
            margin: auto;
        }
        .company-info img {
            max-width: 450px;
            border-radius: 12px;
        }
        .company-info-text {
            flex: 1 1 400px;
            max-width: 500px;
        }
        .company-info-text h2 {
            color: #ff6600;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .what-we-do {
            background: #f1f3f6;
            padding: 60px 20px;
            text-align: center;
        }
        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            max-width: 900px;
            margin: 30px auto;
        }
        .service {
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
        }

        .stats {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            background: white;
            padding: 40px 20px;
            margin: 50px 0;
        }
        .stat {
            text-align: center;
            flex: 1 1 200px;
        }
        .stat h3 {
            color: #ff6600;
            font-weight: 700;
            font-size: 2rem;
        }


    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container-fluid px-3">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <img src="image/logo.png" alt="Logo" class="me-2">
            <div class="fw-bold ms-1 text-dark">
                CLEAN<br>
                <small class="fw-light" style="letter-spacing: 2px;">MASTER</small>
            </div>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav me-3">
                <li class="nav-item"><a class="nav-link " href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="ourservice.jsp">Our Services</a></li>
                <li class="nav-item dropdown ">
                    <a class="nav-link  dropdown-toggle" href="#" data-bs-toggle="dropdown">Pages</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="our_team.jsp">Our Team</a></li>
                        <li><a class="dropdown-item" href="package.jsp">Pricing</a></li>
                        <li><a class="dropdown-item active " href="#">About Us</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contacts</a></li>

                <%
                    String user = (String) session.getAttribute("username");
                    if (user != null) {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="my_bookings.jsp">My Bookings</a>
                </li>
                <% } %>
            </ul>


            <%
                if (user == null) {
            %>
            <a href="login.jsp" class="btn btn-success ms-3">Login</a>
            <%
            } else {
            %>
            <span class="ms-3 fw-bold text-dark">Hi, <%= user %></span>
            <a href="LogoutServlet" class="btn btn-danger ms-3">Logout</a>
            <%
                }
            %>
        </div>
    </div>
</nav>

<section class="hero">
    <div class="hero-text">
        <h1>About Our Company</h1>
        <p>We are committed to providing top-quality home cleaning services that save you time and give you a sparkling clean living space. Our mission is to bring comfort and cleanliness to every home we serve.</p>
        <a href="contact.jsp" class="btn btn-primary">Contact Us</a>
    </div>
    <img src="image/teamwork.png" alt="Team at Work">
</section>

<section class="info-cards">
    <div class="info-card">
        <h4>Our Mission</h4>
        <p>Making home cleaning simple, affordable, and hassle-free for everyone.</p>
    </div>
    <div class="info-card">
        <h4>Our Vision</h4>
        <p>To become the most trusted cleaning platform nationwide.</p>
    </div>
    <div class="info-card">
        <h4>Why Choose Us</h4>
        <p>Professional cleaners, flexible schedules, and guaranteed results.</p>
    </div>
</section>

<section class="company-info">
    <img src="https://images.unsplash.com/photo-1521737604893-d14cc237f11d" alt="Company Meeting">
    <div class="company-info-text">
        <h2>Our Story</h2>
        <p>Founded in 2024, we started with a small team and one goal: to make home cleaning a smooth experience for everyone. Today, we serve hundreds of happy customers with customized cleaning solutions, a friendly team, and reliable service quality.</p>
    </div>
</section>

<section class="what-we-do">
    <h2>What We Offer</h2>
    <div class="services-grid">
        <div class="service"><strong>✔ Regular Cleaning</strong></div>
        <div class="service"><strong>✔ Deep Cleaning</strong></div>
        <div class="service"><strong>✔ Move-In/Out Cleaning</strong></div>
        <div class="service"><strong>✔ Office Cleaning</strong></div>
        <div class="service"><strong>✔ Customized Packages</strong></div>
    </div>
</section>

<section class="stats">
    <div class="stat">
        <h3>500+</h3>
        <p>Happy Customers</p>
    </div>
    <div class="stat">
        <h3>50+</h3>
        <p>Trusted Professionals</p>
    </div>
    <div class="stat">
        <h3>5+</h3>
        <p>Years Experience</p>
    </div>
</section>
<section style="background-color: #0d1b2a; border-radius: 5px;">

    <div class="container " style="color: white; padding: 30px;">
        <div>
            <div class="col-5">
                <h2 class="fw-bold display-5 ">The best cleaning in <br> your city.</h2>

            </div>
        </div>

        <div class="container " style="color: white; padding: 30px;">
            <div class="row align-items-start">
                <div class="col-6">
                    <h4 class="fw-bold display-7 ">Address</h4> <hr>

                    <h5>Clean Master Facility Services, Hiremath Heights, 6th Ln
                        Poorvarang, Rajarampuri, Kolhapur, Maharashtra 416008
                    </h5>
                </div>
                <div class="col-1"></div>
                <div class="col-5">
                    <h4 class="fw-bold display-7 ">Contact us</h4> <hr>
                    <h5> 9699432733 , 9876543210</h5>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
