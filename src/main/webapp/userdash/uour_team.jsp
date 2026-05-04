<%--
  Created by IntelliJ IDEA.
  User: Prajwal
  Date: 09-09-2025
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>uour_team</title>
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


    .employee-card {
      border: none;
      border-radius: 15px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      transition: transform 0.2s;
    }
    .employee-card:hover {
      transform: translateY(-5px);
    }
    .employee-card img {
      border-top-left-radius: 15px;
      border-top-right-radius: 15px;
      height: 240px;
      object-fit: cover;
    }
    .rating {
      color: #ffc107;
      font-size: 1.1rem;
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
        <li class="nav-item"><a class="nav-link active" href="uhome.jsp">Home</a></li>
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


<h2 class="fw-bold display-5 " style="text-align: center; padding-top: 100px; padding-bottom: 30px;">Meet our team</h2>

<div class="container py-5">

  <div class="row g-4">

    <div class="col-md-4">
      <div class="card employee-card">
        <img src="../image/emp1.png" alt="Emily Walker">
        <div class="card-body text-center">
          <h5 class="card-title mb-0">Emily Walker</h5>
          <small class="text-muted d-block mb-2">Cleaning Specialist</small>
          <div class="rating">★ ★ ★ ★ ★</div>
          <p class="mb-1"><strong>Experience:</strong> 3 Years</p>
          <p class="mb-3"><strong>Specialty:</strong> House Cleaning</p>
        </div>
      </div>
    </div>

    <!-- Employee Card -->
    <div class="col-md-4">
      <div class="card employee-card">
        <img src="../image/emp3.png" alt="Dana Green">
        <div class="card-body text-center">
          <h5 class="card-title mb-0">Dana Green</h5>
          <small class="text-muted d-block mb-2">Cleaner</small>
          <div class="rating">★★★★☆</div>
          <p class="mb-1"><strong>Experience:</strong> 2 Years</p>
          <p class="mb-3"><strong>Specialty:</strong> Deep Cleaning</p>
        </div>
      </div>
    </div>


    <div class="col-md-4">
      <div class="card employee-card">
        <img src="../image/emp2.png" alt="peter parkar">
        <div class="card-body text-center">
          <h5 class="card-title mb-0">peter parkar</h5>
          <small class="text-muted d-block mb-2"> Office Cleaner</small>
          <div class="rating">★★★★☆</div>
          <p class="mb-1"><strong>Experience:</strong> 4 Years</p>
          <p class="mb-3"><strong>Specialty:</strong> Office Cleaning</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card employee-card">
        <img src="../image/emp4.png" alt="Joe Jones">
        <div class="card-body text-center">
          <h5 class="card-title mb-0">Joe Jones</h5>
          <small class="text-muted d-block mb-2">House Cleaner</small>
          <div class="rating">★★★★★</div>
          <p class="mb-1"><strong>Experience:</strong> 4 Years</p>
          <p class="mb-3"><strong>Specialty:</strong> House Cleaning</p>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card employee-card">
        <img src="../image/emp5.png" alt="Emma frost">
        <div class="card-body text-center">
          <h5 class="card-title mb-0">Emma frost</h5>
          <small class="text-muted d-block mb-2">House Cleaner</small>
          <div class="rating">★★★★☆</div>
          <p class="mb-1"><strong>Experience:</strong> 1.5 Years</p>
          <p class="mb-3"><strong>Specialty:</strong> House Cleaning</p>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card employee-card">
        <img src="../image/emp6.png" alt="Joe Jones">
        <div class="card-body text-center">
          <h5 class="card-title mb-0">Adom stark</h5>
          <small class="text-muted d-block mb-2">Office Cleaner</small>
          <div class="rating">★★★★★</div>
          <p class="mb-1"><strong>Experience:</strong> 6 Years</p>
          <p class="mb-3"><strong>Specialty:</strong> Office Cleaning</p>
        </div>
      </div>
    </div>


  </div>

</div>
</div>
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
