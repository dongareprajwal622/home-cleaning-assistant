<%--
  Created by IntelliJ IDEA.
  User: Prajwal
  Date: 08-09-2025
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>contact</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
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


    .dropdown-toggle::after
    {
      display: none;
    }
    .section-title-2
    {
      font-size: 60px;
      font-weight: 800;
      color: #0d1b2a;
      line-height: 1.2;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg sticky-top shadow-sm">
  <div class="container-fluid px-3 d-flex align-items-center justify-content-between">
    <a class="navbar-brand d-flex align-items-center" href="#">
      <img src="image/logo.png" alt="Logo" class="me-2" />
      <div class="fw-bold ms-1 text-dark">
        CLEAN<br />
        <small class="fw-light" style="letter-spacing: 2px;">MASTER</small>
      </div>
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <div class="navbar-toggler-icon"></div>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav me-3">
        <li class="nav-item"><a class="nav-link " href="home.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="ourservice.jsp">Our Services</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Pages
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="our_team.jsp">Our Team</a></li>
            <li><a class="dropdown-item" href="package.jsp">Pricing</a></li>
            <li><a class="dropdown-item" href="about_us.jsp">About Us</a></li>
          </ul>
        </li>
        <li class="nav-item"><a class="nav-link active" href="#">Contacts</a></li>

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

<section style="padding-top: 80px;">
  <div style="text-align: center " class="section-title-2 col-12">
    <h1>Contact</h1>
  </div> <br> <br>

  <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30573.124672650298!2d74.2047950743164!3d16.694859600000004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc1016e9ceaae61%3A0x28ef4aa877c67b8b!2sClean%20Master%20Facility%20Services!5e0!3m2!1sen!2sin!4v1755258540867!5m2!1sen!2sin"
          width="100%"
          height="550"
          style="border-radius: 10px;"
          allowfullscreen=""
          loading="lazy"
          referrerpolicy="no-referrer-when-downgrade">

  </iframe>
</section> <br> <br>

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
