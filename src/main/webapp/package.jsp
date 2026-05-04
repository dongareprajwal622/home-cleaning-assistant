<%--
  Created by IntelliJ IDEA.
  User: Prajwal
  Dynamic Package Display from MySQL
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Our Packages</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700&display=swap" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
  <style>
    body {
      margin: 0; font-family: 'Poppins', sans-serif; background-color: #f4fbfb; color: black; }
    .navbar {
      background-color: #f4fbfb; padding: 8px 0; }
    .navbar-brand img {
      height: 65px; width: auto; }
    .navbar-nav .nav-link {
      padding: 6px 14px; font-size: 16px; color: #0d2a10; position: relative; }
    .navbar-nav .nav-link.active::after {
      content: ''; position: absolute; bottom: 0; left: 14px; width: 70%; height: 2px; background-color: #0d1b2a; }
    .navbar-nav .nav-link:hover { color: #d64717; }
    .icon-btn {
      font-size: 20px; color: #0d1b2a; background: none; border: none; padding: 6px 10px; margin-left: 8px; }
    .icon-btn:hover { color: #20c997; }
    .btn-success {
      background-color: #20c997; border: none; }
    .btn-success:hover {
      background-color: #1bb389; }
    .navbar .container-fluid {
      padding-left: 50px; padding-right: 50px; }

    h3 { font-weight: 700; color: #2c3e50; margin-bottom: 3rem; text-align: center; letter-spacing: 1px; text-shadow: 1px 1px 3px rgba(0,0,0,0.1); }

    .package-card {
      background: #fff; border-radius: 12px; box-shadow: 0 4px 15px rgba(44,62,80,0.1);
      padding: 2rem 1.8rem 2.5rem; transition: transform 0.3s ease, box-shadow 0.3s ease;
      display: flex; flex-direction: column; height: 100%; position: relative; border-top: 6px solid transparent;
    }
    .package-card:hover {
      transform: translateY(-8px); box-shadow: 0 12px 30px rgba(44,62,80,0.15); border-top-color: #ff6600;
    }
    .package-icon {
      font-size: 2.8rem; color: #ff6600; margin-bottom: 1rem; align-self: center; transition: color 0.3s ease;
    }
    .package-card:hover .package-icon { color: #db6934; }
    .card-title {
      font-weight: 700; color: #ff6600; font-size: 1.5rem; margin-bottom: 0.5rem; text-align: center;
    }
    .price {
      font-size: 1.5rem; font-weight: 700; color: #28a745; margin-bottom: 1rem; text-align: center; font-family: 'Courier New', Courier, monospace;
    }
    .card-text {
      font-size: 1rem; text-align: center; margin-bottom: 1.3rem; color: #555; flex-grow: 0;
    }
    ul {
      padding-left: 1.3rem; margin-bottom: 1.8rem; color: #555; flex-grow: 1; list-style-type: disc;
    }
    a.btn-primary {
      background: linear-gradient(135deg,#db6934,#ff7f32); border: none; font-weight: 600; border-radius: 8px;
      padding: 0.55rem 1.6rem; font-size: 1.1rem; align-self: center; box-shadow: 0 6px 15px rgba(219,105,52,0.3);
      transition: background 0.3s ease, box-shadow 0.3s ease; text-shadow: 0 1px 2px rgba(0,0,0,0.15); text-decoration: none;
    }
    a.btn-primary:hover {
      background: linear-gradient(135deg,#c45a2d,#e86a2d); box-shadow: 0 10px 25px rgba(196,90,45,0.5); text-decoration: none;
    }
    @media (max-width: 767px) { ul { padding-left: 1rem; } .card-text { font-size: 0.95rem; } }
    .dropdown-toggle::after { display: none; }
  </style>
</head>

<body>
<nav class="navbar navbar-expand-lg sticky-top shadow-sm">
  <div class="container-fluid px-3 d-flex align-items-center justify-content-between">
    <a class="navbar-brand d-flex align-items-center" href="#">
      <img src="image/logo.png" alt="Logo" class="me-2">
      <div class="fw-bold ms-1 text-dark">CLEAN<br><small class="fw-light" style="letter-spacing:2px;">MASTER</small></div>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <div class="navbar-toggler-icon"></div>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <div class="d-flex align-items-center">
        <ul class="navbar-nav mb-2 mb-lg-0 d-flex">
          <li class="nav-item"><a class="nav-link " href="home.jsp">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="ourservice.jsp">Our Services</a></li>
          <li class="nav-item dropdown">
            <a class="nav-link  dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">Pages</a>
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
  </div>
</nav>
<%
  boolean employeesAvailable = true;

  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection checkCon = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/home_assistant",
            "root",
            "Root@123"
    );

    PreparedStatement checkPs = checkCon.prepareStatement(
            "SELECT COUNT(*) FROM addemployee WHERE status='Available'"
    );

    ResultSet checkRs = checkPs.executeQuery();

    if (checkRs.next()) {
      int count = checkRs.getInt(1);
      if (count == 0) {
        employeesAvailable = false;
      }
    }

    checkRs.close();
    checkPs.close();
    checkCon.close();

  } catch (Exception e) {
    employeesAvailable = false;
  }
%>


<div class="container">
  <h3 style="padding-top: 60px;">Our Cleaning Packages</h3>
  <div class="row g-4">
    <%
      Connection con = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/home_assistant", "root", "Root@123");
        ps = con.prepareStatement("SELECT * FROM packages");
        rs = ps.executeQuery();
        while (rs.next()) {
    %>
    <div class="col-md-4">
      <div class="package-card h-100 d-flex flex-column">
        <i class="bi <%= rs.getString("icon") %> package-icon"></i>
        <h5 class="card-title"><%= rs.getString("title") %></h5>
        <p class="price"><%= rs.getString("price") %></p>
        <p class="card-text"><%= rs.getString("description") %></p>
        <ul>
          <li><%= rs.getString("feature1") %></li>
          <li><%= rs.getString("feature2") %></li>
          <li><%= rs.getString("feature3") %></li>
        </ul>
        <a href="booking.jsp?package=<%= rs.getString("title") %>"
           class="btn btn-primary mt-auto book-btn"
           data-available="<%= employeesAvailable %>">Book Now</a>
      </div>
    </div>
    <%
      }
    } catch (Exception e) {
    %>
    <p style="color:red; text-align:center;">Error loading packages: <%= e.getMessage() %></p>
    <%
      } finally {
        if (rs != null) try { rs.close(); } catch (Exception ignored) {}
        if (ps != null) try { ps.close(); } catch (Exception ignored) {}
        if (con != null) try { con.close(); } catch (Exception ignored) {}
      }
    %>
  </div>
</div>

<br><br>
<section style="background-color: #0d1b2a; border-radius: 5px;">
  <div class="container" style="color: white; padding: 30px;">
    <div class="col-5">
      <h2 class="fw-bold display-5">The best cleaning in <br> your city.</h2>
    </div>

    <div class="container" style="color: white; padding: 30px;">
      <div class="row align-items-start">
        <div class="col-6">
          <h4 class="fw-bold display-7">Address</h4><hr>
          <h5>Clean Master Facility Services, Hiremath Heights, 6th Ln
            Poorvarang, Rajarampuri, Kolhapur, Maharashtra 416008</h5>
        </div>
        <div class="col-1"></div>
        <div class="col-5">
          <h4 class="fw-bold display-7">Contact us</h4><hr>
          <h5>9699432733 , 9876543210</h5>
        </div>
      </div>
    </div>
  </div>

  <div id="login-alert" class="alert alert-warning text-center" style="display:none; position:fixed; top:0; left:0; width:100%; z-index:2000; border-radius:0;">
    Please login first to book a package!
  </div>
</section>

<script>
  document.addEventListener("DOMContentLoaded", function() {
    var loggedIn = <%= (session.getAttribute("username") != null) ? "true" : "false" %>;
    const urlParams = new URLSearchParams(window.location.search);
    const available = urlParams.get('available');

    if (available === "false") {
      alert("Sorry, all our cleaners are currently unavailable. Please try again later!");
    }

    document.querySelectorAll('.book-btn').forEach(function(btn) {
      btn.addEventListener('click', function(e) {

        if (!loggedIn) {
          e.preventDefault();
          var alertBox = document.getElementById('login-alert');
          alertBox.style.display = 'block';
          setTimeout(function() { alertBox.style.display = 'none'; }, 3000);
          return;
        }

        if (btn.getAttribute("data-available") === "false") {
          e.preventDefault();
          alert("All our cleaners are unavailable now. Please try again later!");
          return;
        }

      });
    });

  });
</script>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
