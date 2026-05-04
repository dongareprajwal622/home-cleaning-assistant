<%--
  Created by IntelliJ IDEA.
  User: Prajwal
  Date: 09-09-2025
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>userhome</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />

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

    .hero-section
    {
      padding: 80px 0;
    }

    .hero-title
    {
      font-size: 60px;
      font-weight: 800;
      color: #0d1b2a;
      line-height: 1.2;
    }

    .highlight
    {
      color: #6ec24d;
      position: relative;
    }

    .btn-custom
    {
      background: #6dc4c3;
      color: white;
      border-radius: 25px;
      padding: 10px 25px;
      font-weight: 600;
      border: none;
    }

    .btn-custom:hover
    {
      background: #5ab2b1;
    }

    .badge-box
    {
      background: white;
      padding: 15px 20px;
      border-radius: 15px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
      display: inline-flex;
      align-items: center;
      gap: 10px;
      font-weight: 600;
      margin-top: 20px;
    }
    .rating-box
    {
      background: #b52a1f;
      color: white;
      padding: 15px 20px;
      border-radius: 10px;
      font-weight: 600;
      position: absolute;
      top: 40px;
      right: 40px;
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      font-size: 20px;
    }

    .hero-img img {
      border-radius: 50%;
      width: 420px;
      height: 420px;
      object-fit: cover;
    }

    @media (max-width: 768px) {
      .hero-title {
        font-size: 2.4rem;
      }
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
<nav class="navbar navbar-expand-lg sticky-top shadow-sm">
  <div class="container-fluid px-3 d-flex align-items-center justify-content-between">

    <a class="navbar-brand d-flex align-items-center" href="#">
      <img src="../image/logo.png" alt="Logo" class="me-2">
      <div class="fw-bold ms-1 text-dark">CLEAN<br>
        <small class="fw-light" style="letter-spacing: 2px;">MASTER</small>
      </div>
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <div class="navbar-toggler-icon"></div>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav me-3">
        <li class="nav-item"><a class="nav-link active" href="">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="uourservice.jsp">Our Services</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Pages
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="uour_team.jsp">Our Team</a></li>
            <li><a class="dropdown-item" href="upackage.jsp">Pricing</a></li>
            <li><a class="dropdown-item" href="#">About Us</a></li>
          </ul>
        </li>
        <li class="nav-item"><a class="nav-link" href="../contact.jsp">Contacts</a></li>
      </ul>

      <button class="icon-btn"><i class="bi bi-search"></i></button>
      <a href="../login.jsp" class="btn btn-success ms-3">Logout</a>
    </div>
  </div>
</nav>

<section class="hero-section container">
  <div class="row align-items-center">
    <div class="col-md-6 hero-text">
      <p class="text-uppercase fw-bold text-muted small">Freshness & Cleanliness</p>
      <h1 class="hero-title">
        We perform fast and <span class="highlight">quality</span> cleaning!
      </h1>
      <a href="uourservice.jsp" class="btn btn-custom mt-3">View All Services</a>
      <div style="padding-left: 650px;">
        <div class="badge-box">
          <img src="https://cdn-icons-png.flaticon.com/512/2891/2891539.png" width="24" alt="">
          5 Years of Experience
        </div>
      </div>
    </div>
    <div class="col-md-6 text-center">
      <div class="hero-img position-relative">
        <img src="../image/cleanlady.png" alt="Cleaning Lady">
        <div class="rating-box">
          ⭐ 4.9 <br>
          500+ Reviews
        </div>
      </div>
    </div>
  </div>
</section>

<section>
  <div class="container">

    <div style="text-align: center; padding: 80px;" class="col-12">
      <h3 class="section-subtitle-2">What we offer</h3>
      <h1 class="section-title-2">Our process in <span class="highlight">Three</span> step</h1>
    </div>

    <div class="row align-items-center">
      <div class="col-md-6">
        <p class="text-uppercase fw-bold text-dark fw-medium mb-2"> Step 1 <hr></p>
        <h2 class="fw-bold display-5">Creating a task list  and <br> planning</h2>
      </div>

      <div class="col-md-6 text-center">
        <img src="../image/cleaning.png"
             alt="Cleaning Lady"
             style="width: 500px; height: 320px; object-fit: cover; border-radius: 20px;">
      </div>
    </div> <br> <br> <br>

    <div class="row align-items-center">

      <div class="col-md-5 text-center">
        <img src="../image/cleaning2.png"
             alt="Cleaning Lady"
             style="width: 500px; height: 320px; object-fit: cover; border-radius: 20px;">
      </div>
      <div class="col-md-7">
        <p class="text-uppercase fw-bold text-dark fw-medium mb-2"> Step 2 <hr></p>
        <h2 class="fw-bold display-5">The main clean and disinfection</h2>
      </div>
    </div> <br> <br>

    <div class="row align-items-center">
      <div class="col-md-6">
        <p class="text-uppercase fw-bold text-dark fw-medium mb-2"> Step 3 <hr></p>
        <h2 class="fw-bold display-5">Final touches & item placement </h2>
      </div>

      <div class="col-md-6 text-center">
        <img src="../image/cleaning3.png"
             alt="Cleaning Lady"
             style="width: 500px; height: 320px; object-fit: cover; border-radius: 20px;">
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
