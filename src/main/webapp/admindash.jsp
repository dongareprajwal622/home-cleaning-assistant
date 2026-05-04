<%--
  Created by IntelliJ IDEA.
  User: Prajwal
  Date: 08-09-2025
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
      body {
        margin: 0;
        font-family: 'Inter', sans-serif;
        background-color: #f5f7fa;
        color: #333;
      }

      .sidebar {
        position: fixed;
        left: 0;
        top: 0;
        width: 220px;
        height: 100vh;
        background-color: #1e1e2f;
        color: #fff;
        display: flex;
        flex-direction: column;
        padding: 20px;
      }

      .sidebar h2 {
        margin: 0 0 30px;
        font-size: 24px;
        font-weight: bold;
      }

      .sidebar a {
        color: #fff;
        text-decoration: none;
        margin: 12px 0;
        display: flex;
        align-items: center;
        font-weight: 500;
      }

      .sidebar a i {
        margin-right: 10px;
      }

      .sidebar a.active,
      .sidebar a:hover {
        background-color: #7f7477;
        padding: 8px;
        border-radius: 8px;
      }

      .submenu {
        padding-left: 20px;
      }

      .main {
        margin-left: 240px;
        padding: 30px;
      }

      .notification-icon {
        position: absolute;
        right: 30px;
        top: 30px;
        font-size: 20px;
        cursor: pointer;
        color: #555;
      }

      .notification-icon .badge {
        position: absolute;
        top: -10px;
        right: -10px;
        background: red;
        color: white;
        border-radius: 50%;
        padding: 4px 8px;
        font-size: 12px;
      }

      .greeting {
        font-size: 28px;
        font-weight: 600;
        margin-top: 20px;
      }

      .sub-greeting {
        font-size: 18px;
        margin-bottom: 30px;
        color: #666;
      }

      .dashboard {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 30px;
      }

      .feature-buttons {
        display: grid;
        grid-template-columns: repeat(4, 1fr); /* 4 cards per row */
        gap: 20px;
        margin-top: 40px;
      }

      .feature-card {
        background: #fff;
        padding: 30px 20px;
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        text-align: center;
        transition: transform 0.2s ease;
        cursor: pointer;
        border: 2px solid transparent;
      }

      .feature-card i {
        font-size: 32px;
        color: #ff6a00;
        margin-bottom: 10px;
      }

      .feature-card span {
        display: block;
        font-weight: 600;
        font-size: 16px;
        color: #333;
      }

      .feature-card:hover {
        transform: translateY(-5px);
        border-color: #ff6a00;
      }

      @media screen and (max-width: 768px) {
        .dashboard {
          grid-template-columns: 1fr;
        }

        .main {
          margin-left: 0;
          padding: 20px;
        }

        .sidebar {
          width: 100%;
          height: auto;
          position: static;
          flex-direction: row;
          overflow-x: auto;
        }

        .sidebar h2 {
          display: none;
        }

        .sidebar a {
          margin: 10px;
        }
      }
      .sidebar {
        display: flex;
        flex-direction: column;
        padding: 20px;
        background-color: #222;
        color: #fff;
        min-height: 100vh;
        width: 220px;
      }

      .sidebar a {
        color: white;
        text-decoration: none;
        padding: 12px;
        margin-bottom: 10px;
        display: flex;
        align-items: center;
        gap: 10px;
        border-radius: 8px;
        transition: background 0.2s ease;
      }

      .sidebar a:hover {
        background-color: #333;
      }

      .logout-form {
        margin-top: 10px;
      }

      .logout-btn {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        background: linear-gradient(135deg, #ff4e50, #f9d423);
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        text-align: left;
        display: flex;
        align-items: center;
        gap: 10px;
        transition: background 0.3s ease, transform 0.2s;
      }

      .logout-btn:hover {
        background: linear-gradient(135deg, #ff3e3e, #fca311);
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(0,0,0,0.15);
      }

      .logout-btn i {
        font-size: 18px;
      }
    </style>
  </head>
  <body>
  <div class="sidebar">
    <h2>CLEAN MASTER</h2>
    <a href="#" class="active"><i class="fas fa-home"></i> Home</a>
    <form action="home.jsp" method="POST" class="logout-form">
      <button type="submit" class="logout-btn">
        <i class="fas fa-sign-out-alt"></i> Log Out
      </button>
    </form>

  </div>
  <div>
    <div class="main">


      <div class="greeting">Admin Dashboard</div>
      <hr>

      <div class="feature-buttons">
          <a href="AddEmployeeServlet">
              <div class="feature-card">
                <i class="fas fa-address-book"></i>
                <span>Add Employess</span>
              </div>
          </a>

          <a href="adminteam.jsp">
            <div class="feature-card">
              <i class="fas fa-clipboard-check"></i>
              <span> Employess Template</span>
            </div>
          </a>

          <a href="view_booking.jsp">
            <div class="feature-card">
              <i class="fas fa-list-ul"></i>
              <span>View booking</span>
            </div>
          </a>


          <a href="report.jsp">
            <div class="feature-card">
              <i class="fas fa-eye"></i>
              <span>Reports</span>
            </div>
          </a>
      </div>

      <div class="feature-buttons">
        <a href="admin_packages.jsp">
          <div class="feature-card">
            <i class="fas fa-cubes"></i>
            <span> Manage packages</span>
          </div>
        </a>

        <a href="admin_feedback.jsp">
          <div class="feature-card">
            <i class="fas fa-comments"></i>
            <span> Feedback</span>
          </div>
        </a>
      </div>



    </div>
  </div>

  </body>
</html>
