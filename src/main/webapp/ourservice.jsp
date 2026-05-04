<%--
  Created by IntelliJ IDEA.
  User: Prajwal
  Date: 08-09-2025
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ourservice</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

  <style>
    body
    {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background-color: #f4fbfb;
    }

    .navbar
    {
      background-color: #f4fbfb;
      padding: 8px 0;
    }

    .navbar-brand img
    {
      height: 65px;
      width: auto;
    }

    .navbar-nav .nav-link
    {
      padding: 6px 14px;
      font-size: 16px;
      color: #0d2a10;
      position: relative;
    }

    .navbar-nav .nav-link.active::after
    {
      content: '';
      position: absolute;
      bottom: 0;
      left: 14px;
      width: 70%;
      height: 2px;
      background-color: #0d1b2a;
    }

    .navbar-nav .nav-link:hover
    {
      color: #d64717;
    }

    .icon-btn
    {
      font-size: 20px;
      color: #0d1b2a;
      background: none;
      border: none;
      padding: 6px 10px;
      margin-left: 8px;
    }

    .icon-btn:hover
    {
      color: #20c997;
    }

    .btn-success
    {
      background-color: #20c997;
      border: none;
    }

    .btn-success:hover
    {
      background-color: #1bb389;
    }
    .navbar .container-fluid
    {
      padding-left: 50px;
      padding-right: 50px;
    }

    .section-title-2
    {
      font-size: 60px;
      font-weight: 800;
      color: #0d1b2a;
      line-height: 1.2;
    }

    .section-subtitle-2
    {
      font-size: 20px;
      font-weight: 700;
      color: #555;
      text-transform: uppercase;
    }
    .dropdown-toggle::after
    {
      display: none;
    }

  </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg sticky-top shadow-sm">
  <div class="container-fluid px-3 d-flex align-items-center justify-content-between">

    <a class="navbar-brand d-flex align-items-center" href="#">
      <img src="image/logo.png" alt="Logo" class="me-2">
      <div class="fw-bold ms-1 text-dark">CLEAN<br>
        <small class="fw-light" style="letter-spacing: 2px;">MASTER</small>
      </div>
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <div class="navbar-toggler-icon"></div>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav me-3">
        <li class="nav-item"><a class="nav-link " href="home.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link active" href="#">Our Services</a></li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
            Pages
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="our_team.jsp">Our Team</a></li>
            <li><a class="dropdown-item" href="package.jsp">Pricing</a></li>
            <li><a class="dropdown-item" href="about_us.jsp">About Us</a></li>
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


      <%-- LOGIN / LOGOUT --%>
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



<h2 class="fw-bold display-5 " style="text-align: center; padding-top: 150px; padding-bottom: 70px;">Our service</h2>

<section>
  <div class="container">
    <div class="row align-items-center">
      <div class="col-5">
        <div style=" padding: 10px;" >
          <h3 class="section-subtitle-2"> we offer</h3>
          <h1 class="section-title-2">Service for any <br> occasion</h1>
        </div>
      </div>
      <div class="col-3 flex-column align-items-center">
        <img src="image/laundry.png" alt="Laundry Icon" width="64" height="64" />
        <h3 style="margin-top: 10px;">Laundry</h3>
      </div>

      <div class="col-3 flex-column align-items-center">
        <img src="image/sweeping.png" alt="sweeping Icon" width="64" height="64" />
        <h3 style="margin-top: 10px;">Sweeping</h3>
      </div>
    </div> <br> <br> <br>
    <div class="row align-items-center">
      <div class="col-3 flex-column align-items-center">
        <img src="image/washing.png" alt="washing Icon" width="64" height="64" />
        <h3 style="margin-top: 10px;">Washing</h3>
      </div>
      <div class="col-3 flex-column align-items-center">
        <img src="image/dusting.png" alt="washing Icon" width="64" height="64" />
        <h3 style="margin-top: 10px;">Dusting</h3>
      </div>
      <div class="col-3 flex-column align-items-center">
        <img src="image/sponge.png" alt="Washing Icon" width="64" height="64" />
        <h3 style="margin-top: 10px;">Sponging</h3>
      </div>
      <div class="col-3 flex-column align-items-center">
        <img src="image/bed.png" alt="washing Icon" width="64" height="64" />
        <h3 style="margin-top: 10px;">Bed cleaning</h3>
      </div>
    </div>

  </div>

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

</body>
</html>
