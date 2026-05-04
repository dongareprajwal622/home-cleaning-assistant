<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession session1 = request.getSession(false);

    if (session1 == null || session1.getAttribute("user_id") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int userId = (int) session1.getAttribute("user_id");
    String username = (String) session1.getAttribute("username");
%>

<html>
<head>
    <title>My Bookings</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #f4fbfb;
        }

        .navbar {
            background-color: #f4fbfb;
            padding: 8px 0;
        }

        .navbar-brand img {
            height: 65px;
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

        .dropdown-toggle::after {
            display: none;
        }

        .table {
            background: white;
        }
        /* ORANGE THEME TABLE STYLE */
        .table-container {
            background: #ffffff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(255, 138, 76, 0.2);
            border: 1px solid #ffe2d2;
        }

        .table thead {
            background: linear-gradient(90deg, #ff8a4c, #ff6f2f);
            color: white;
            border-radius: 10px;
        }

        .table thead th {
            border: none;
            padding: 14px;
            font-size: 16px;
            letter-spacing: 0.5px;
        }

        .table tbody tr {
            background: #fff7f2;
            transition: 0.2s;
        }

        .table tbody tr:hover {
            background: #ffe8dc;
        }

        .table-bordered > tbody > tr > td {
            border-color: #ffd3bf;
            padding: 14px;
            vertical-align: middle;
        }

        .badge-paid {
            background-color: #28a745 !important;
            color: white;
            padding: 5px 10px;
            border-radius: 8px;
            font-size: 13px;
        }

        .badge-notpaid {
            background-color: #dc3545 !important;
            color: white;
            padding: 5px 10px;
            border-radius: 8px;
            font-size: 13px;
        }

    </style>
</head>

<body>

<!-- NAVBAR (unchanged as you requested) -->
<nav class="navbar navbar-expand-lg sticky-top shadow-sm">
    <div class="container-fluid px-3">

        <a class="navbar-brand d-flex align-items-center" href="home.jsp">
            <img src="image/logo.png" alt="Logo">
            <div class="fw-bold ms-1 text-dark">CLEAN<br>
                <small class="fw-light" style="letter-spacing: 2px;">MASTER</small>
            </div>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav me-3">
                <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="ourservice.jsp">Our Services</a></li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Pages</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="our_team.jsp">Our Team</a></li>
                        <li><a class="dropdown-item" href="package.jsp">Pricing</a></li>
                        <li><a class="dropdown-item" href="about_us.jsp">About Us</a></li>
                    </ul>
                </li>

                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contacts</a></li>

                <% if (username != null) { %>
                <li class="nav-item"><a class="nav-link active" href="my_bookings.jsp">My Bookings</a></li>
                <% } %>
            </ul>

            <% if (username == null) { %>
            <div class="dropdown ms-3">
                <button class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown">Login</button>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="login.jsp?role=user">User Login</a></li>
                    <li><a class="dropdown-item" href="admin_login.jsp">Admin Login</a></li>
                </ul>
            </div>
            <% } else { %>
            <span class="ms-3 fw-bold text-dark">Hi, <%= username %></span>
            <a href="LogoutServlet" class="btn btn-danger ms-3">Logout</a>
            <% } %>

        </div>
    </div>
</nav>

<!-- MAIN CONTENT -->
<div class="container mt-4">
    <h4 class="mb-3">My Booking Details</h4>

    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/home_assistant", "root", "Root@123"
            );

            // Fetch bookings (correct column is booking_id, not id)
            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM user_booking WHERE user_id = ? ORDER BY booking_id DESC"
            );
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (!rs.isBeforeFirst()) {
    %>

    <div class="text-center p-3">
        <p class="text-muted">You have no bookings yet.</p>
    </div>

    <%
    } else {
    %>

    <div class="table-responsive table-container">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
            <tr>
                <th>Package</th>
                <th>Employee IDs</th>
                <th>Date</th>
                <th>Time</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>

            <tbody>
            <%
                while (rs.next()) {
                    int bookingId = rs.getInt("booking_id");

                    // Fetch employee_ids only
                    PreparedStatement empPs = con.prepareStatement(
                            "SELECT employee_id FROM user_booking_employees WHERE booking_id = ?"
                    );
                    empPs.setInt(1, bookingId);
                    ResultSet empRs = empPs.executeQuery();

                    String empList = "";
                    while (empRs.next()) {
                        empList += empRs.getInt("employee_id") + ", ";
                    }
                    if (empList.endsWith(", ")) {
                        empList = empList.substring(0, empList.length() - 2);
                    }
            %>

            <tr>
                <td><%= rs.getString("service_name") %></td>
                <td><%= empList.equals("") ? "Not Assigned" : empList %></td>
                <td><%= rs.getString("booking_date") %></td>
                <td><%= rs.getString("booking_time") %></td>
                <td>
                    <span class="badge bg-info"><%= rs.getString("status") %></span>
                </td>
                <td>
                    <% if ("Completed".equalsIgnoreCase(rs.getString("status"))) { %>
                    <button class="btn btn-sm btn-warning"
                            data-bs-toggle="modal"
                            data-bs-target="#feedbackModal"
                            onclick="setBookingId(<%= bookingId %>)">
                        Give Feedback
                    </button>
                    <% } else { %>
                    <span class="text-muted">Not Available</span>
                    <% } %>
                </td>
            </tr>


            <%
                } // end while
            %>
            </tbody>
        </table>
    </div>

    <%
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

</div>
<!-- Feedback Modal -->
<div class="modal fade" id="feedbackModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <form action="SubmitFeedbackServlet" method="post" class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Give Feedback</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">

                <input type="hidden" name="booking_id" id="bookingIdInput">
                <input type="hidden" name="user_id" value="<%= userId %>">

                <!-- Rating -->
                <label class="form-label">Rating</label>
                <select name="rating" class="form-select" required>
                    <option value="">Select Rating</option>
                    <option value="5"> Excellent</option>
                    <option value="4"> Good</option>
                    <option value="3"> Average</option>
                    <option value="2"> Poor</option>
                    <option value="1"> Very Bad</option>
                </select>

                <!-- Comment -->
                <label class="form-label mt-3">Comment</label>
                <textarea name="comment" class="form-control" rows="4"
                          placeholder="Write your feedback..."></textarea>

            </div>

            <div class="modal-footer">
                <button type="submit" class="btn btn-success">Submit</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            </div>
        </form>
    </div>
</div>
<script>
    function setBookingId(id) {
        document.getElementById("bookingIdInput").value = id;
    }
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
