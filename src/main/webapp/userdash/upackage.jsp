<%--
  Created by IntelliJ IDEA.
  User: Prajwal
  Date: 09-09-2025
  Time: 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>upackage</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&display=swap" rel="stylesheet" />

  <!-- Bootstrap Icons CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />

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

    h3 {
      font-weight: 700;
      color: #2c3e50;
      margin-bottom: 3rem;
      text-align: center;
      letter-spacing: 1px;
      text-shadow: 1px 1px 3px rgba(0,0,0,0.1);
    }

    .package-card {
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 4px 15px rgba(44, 62, 80, 0.1);
      padding: 2rem 1.8rem 2.5rem;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      display: flex;
      flex-direction: column;
      height: 100%;
      position: relative;
      border-top: 6px solid transparent;
    }
    .package-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 12px 30px rgba(44, 62, 80, 0.15);
      border-top-color: #ff6600;
    }
    .package-icon {
      font-size: 2.8rem;
      color: #ff6600;
      margin-bottom: 1rem;
      align-self: center;
      transition: color 0.3s ease;
    }
    .package-card:hover .package-icon {
      color: #db6934;
    }

    .card-title {
      font-weight: 700;
      color: #ff6600;
      font-size: 1.5rem;
      margin-bottom: 0.5rem;
      text-align: center;
    }

    .price {
      font-size: 1.5rem;
      font-weight: 700;
      color: #28a745;
      margin-bottom: 1rem;
      text-align: center;
      font-family: 'Courier New', Courier, monospace;
    }

    .card-text {
      font-size: 1rem;
      text-align: center;
      margin-bottom: 1.3rem;
      color: #555;
      flex-grow: 0;
    }

    ul {
      padding-left: 1.3rem;
      margin-bottom: 1.8rem;
      color: #555;
      flex-grow: 1;
      list-style-type: disc;
    }

    a.btn-primary {
      background: linear-gradient(135deg, #db6934, #ff7f32);
      border: none;
      font-weight: 600;
      border-radius: 8px;
      padding: 0.55rem 1.6rem;
      font-size: 1.1rem;
      align-self: center;
      box-shadow: 0 6px 15px rgba(219, 105, 52, 0.3);
      transition: background 0.3s ease, box-shadow 0.3s ease;
      text-shadow: 0 1px 2px rgba(0,0,0,0.15);
      text-decoration: none;
    }
    a.btn-primary:hover {
      background: linear-gradient(135deg, #c45a2d, #e86a2d);
      box-shadow: 0 10px 25px rgba(196, 90, 45, 0.5);
      text-decoration: none;
    }
    @media (max-width: 767px) {
      ul {
        padding-left: 1rem;
      }
      .card-text {
        font-size: 0.95rem;
      }
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
      <div class="d-flex align-items-center">
        <ul class="navbar-nav mb-2 mb-lg-0 d-flex">
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

        <button class="icon-btn ms-3"><i class="bi bi-search"></i></button>
        <a href="../login.jsp" class="btn btn-success ms-2">Logout</a>
      </div>
    </div>

  </div>
</nav>
<div class="container">

  <h3 style="padding-top: 60px;">Our Cleaning Packages</h3>
  <div class="row g-4">
    <div class="col-md-4">
      <div class="package-card h-100 d-flex flex-column">
        <i class="bi bi-person package-icon"></i>
        <h5 class="card-title">Single Employee - Hourly</h5>
        <p class="price">₹300/hour</p>
        <p class="card-text">Ideal for small cleaning tasks or light dusting. Minimum 2 hours.</p>
        <ul>
          <li>Dusting & sweeping</li>
          <li>Bathroom cleaning</li>
          <li>Kitchen wipe down</li>
        </ul>
        <a href="../booking.jsp" class="btn btn-primary mt-auto book-btn">Book Now</a>
      </div>
    </div>


    <div class="col-md-4">
      <div class="package-card h-100 d-flex flex-column">
        <i class="bi bi-people package-icon"></i>
        <h5 class="card-title">2 Employees - Half Day</h5>
        <p class="price">₹2,000</p>
        <p class="card-text">Perfect for faster cleaning of 2–3 rooms within 4 hours.</p>
        <ul>
          <li>Full room cleaning</li>
          <li>Vacuum & mopping</li>
          <li>Bathroom deep clean</li>
        </ul>
        <a href="#" class="btn btn-primary mt-auto book-btn">Book Now</a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="package-card h-100 d-flex flex-column">
        <i class="bi bi-building package-icon"></i>
        <h5 class="card-title">3 Employees - Full Day</h5>
        <p class="price">₹5,500</p>
        <p class="card-text">Best for large houses or office floors. Complete 8-hour service.</p>
        <ul>
          <li>Entire house cleaning</li>
          <li>Furniture polishing</li>
          <li>Window & curtain cleaning</li>
        </ul>
        <a href="#" class="btn btn-primary mt-auto book-btn">Book Now</a>
      </div>
    </div>

    <div class="col-md-4">
      <div class="package-card h-100 d-flex flex-column">
        <i class="bi bi-bucket-fill package-icon"></i>
        <h5 class="card-title">Deep Cleaning</h5>
        <p class="price">₹3,000</p>
        <p class="card-text">Includes stain removal, furniture moving, and kitchen deep clean.</p>
        <ul>
          <li>Kitchen & bathroom scrubbing</li>
          <li>Carpet shampoo</li>
          <li>Appliance cleaning</li>
        </ul>
        <a href="#" class="btn btn-primary mt-auto book-btn">Book Now</a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="package-card h-100 d-flex flex-column">
        <i class="bi bi-arrow-repeat package-icon"></i>
        <h5 class="card-title">Move-In/Move-Out</h5>
        <p class="price">₹4,500</p>
        <p class="card-text">Ideal for newly rented or sold houses. 2–3 employee team.</p>
        <ul>
          <li>Deep cleaning of all rooms</li>
          <li>Wall & floor wash</li>
          <li>Trash removal</li>
        </ul>
        <a href="#" class="btn btn-primary mt-auto book-btn">Book Now</a>
      </div>
    </div>

    <div class="col-md-4">
      <div class="package-card h-100 d-flex flex-column">
        <i class="bi bi-calendar-week package-icon"></i>
        <h5 class="card-title">Weekly Cleaning Plan</h5>
        <p class="price">₹6,500/month</p>
        <p class="card-text">2 visits per week. Keep your home fresh all month long.</p>
        <ul>
          <li>General cleaning</li>
          <li>Bathroom sanitization</li>
          <li>Kitchen cleaning</li>
        </ul>
        <a href="#" class="btn btn-primary mt-auto book-btn">Book Now</a>
      </div>
    </div>

  </div>
</div> <br><br>
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
  <div id="login-alert" class="alert alert-warning text-center" style="display:none; position: fixed; top: 0; left: 0; width: 100%; z-index: 2000; border-radius: 0;">
    Please login first to book a package!
  </div>

</section>

<!-- Bootstrap JS bundle --><script>
  document.addEventListener("DOMContentLoaded", function() {
    // Check login status from JSP session
    var loggedIn = <%= (session.getAttribute("user") != null) ? "true" : "false" %>;

    // Handle Book Now clicks
    document.querySelectorAll('.book-btn').forEach(function(btn) {
      btn.addEventListener('click', function(e) {
        e.preventDefault(); // prevent default link behavior

        if (loggedIn === "false") {
          var alertBox = document.getElementById('login-alert');
          alertBox.style.display = 'block';

          // Hide alert after 3 seconds
          setTimeout(function() {
            alertBox.style.display = 'none';
          }, 3000);
        } else {
          // Redirect to booking page
          window.location.href = "booking.jsp";
        }
      });
    });
  });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>
