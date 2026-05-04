<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin - View All Bookings</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        /* RESET */
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background-color: #f5f7fa;
            color: #333;
        }

        /* SIDEBAR */
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
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: bold;
        }

        .sidebar a {
            color: #fff;
            text-decoration: none;
            margin: 12px 0;
            padding: 10px;
            display: flex;
            align-items: center;
            border-radius: 8px;
        }

        .sidebar a:hover,
        .sidebar a.active {
            background-color: #7f7477;
        }

        /* LOGOUT BUTTON */
        .logout-btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #ff4e50, #f9d423);
            border: none;
            border-radius: 8px;
            color: white;
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
            margin-top: 20px;
            transition: 0.2s ease;
        }

        .logout-btn:hover {
            background: linear-gradient(135deg, #ff3e3e, #fca311);
            transform: translateY(-2px);
        }

        .main-content {
            margin-left: 260px;
            width: calc(100% - 260px);
            padding: 40px;
        }

        .page-title {
            font-size: 28px;
            font-weight: 700;
            color: #ff7b00;
            margin-bottom: 25px;
            text-align: center;
        }

        .card {
            border-radius: 15px;
            border: none;
        }

        .table thead th {
            background: #ff7b00;
            color: white;
            padding: 12px;
            font-size: 14px;
        }

        .table td {
            padding: 12px;
            font-size: 14px;
            vertical-align: middle;
        }

        .status-badge {
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .paid { background: #d4edda; color: #155724; }
        .pending { background: #fff3cd; color: #856404; }
        .completed { background: #c3e6cb; color: #155724; }
        .cancelled { background: #f8d7da; color: #721c24; }

        select {
            width: 130px;
        }
    </style>
</head>
<body>

<%
    String message = request.getParameter("message");
    if (message != null) {
%>
<div class="alert alert-success text-center"><%= message %></div>
<%
    }
%>

<div class="sidebar">
    <h2>CLEAN MASTER</h2>

    <a href="admindash.jsp"><i class="fas fa-home"></i> Home</a>

    <form action="home.jsp" method="POST">
        <button class="logout-btn"><i class="fas fa-sign-out-alt"></i> Log Out</button>
    </form>
</div>

<div class="main-content">
    <h2 class="page-title">🧾 All Service Bookings</h2>

    <div class="card shadow p-4">
        <div class="table-responsive">
            <table class="table table-hover text-center align-middle">
                <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Service</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Price</th>
                    <th>Address</th>
                    <th>User</th>
                    <th>Employee</th>
                    <th>Status</th>
                    <th>Change Status</th>
                </tr>
                </thead>
                <tbody>

                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection(
                                "jdbc:mysql://localhost:3306/home_assistant", "root", "Root@123");

                        String query =
                                "SELECT b.booking_id, b.service_name, b.booking_date, b.booking_time, b.price, " +
                                        "b.address, b.status AS booking_status, " +
                                        "u.username AS user_name, u.mobile AS user_mobile, " +
                                        "GROUP_CONCAT(a.name SEPARATOR ', ') AS employees, " +
                                        "GROUP_CONCAT(a.id SEPARATOR ',') AS employee_ids " +
                                        "FROM user_booking b " +
                                        "LEFT JOIN users u ON b.user_id = u.id " +
                                        "LEFT JOIN user_booking_employees ube ON b.booking_id = ube.booking_id " +
                                        "LEFT JOIN addemployee a ON ube.employee_id = a.id " +
                                        "GROUP BY b.booking_id " +
                                        "ORDER BY b.booking_id DESC";

                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery(query);

                        while (rs.next()) {

                            String bookingStatus = rs.getString("booking_status");
                            String badgeClass;

                            switch (bookingStatus) {
                                case "Paid": badgeClass = "paid"; break;
                                case "Completed": badgeClass = "completed"; break;
                                case "Cancelled": badgeClass = "cancelled"; break;
                                default: badgeClass = "pending"; break;
                            }

                            // FIX: Proper employee handling
                            String empList = rs.getString("employees");
                            boolean hasEmployees = (empList != null && !empList.trim().isEmpty());

                            String showEmployees = hasEmployees ? empList : "Not Assigned";
                %>

                <tr>
                    <td><%= rs.getInt("booking_id") %></td>
                    <td><%= rs.getString("service_name") %></td>
                    <td><%= rs.getDate("booking_date") %></td>
                    <td><%= rs.getTime("booking_time") %></td>
                    <td>₹<%= rs.getInt("price") %></td>
                    <td><%= rs.getString("address") %></td>
                    <td><%= rs.getString("user_name") %></td>

                    <td><%= showEmployees %></td>

                    <td><span class="status-badge <%= badgeClass %>"><%= bookingStatus %></span></td>

                    <td>
                        <% if (hasEmployees) { %>
                        <form action="UpdateBookingStatusServlet" method="post">
                            <input type="hidden" name="booking_id" value="<%= rs.getInt("booking_id") %>">
                            <input type="hidden" name="employee_ids" value="<%= rs.getString("employee_ids") %>">

                            <select name="new_status" class="form-select form-select-sm" onchange="this.form.submit()">
                                <option value="Pending" <%= "Pending".equals(bookingStatus) ? "selected" : "" %>>Pending</option>
                                <option value="Paid" <%= "Paid".equals(bookingStatus) ? "selected" : "" %>>Paid</option>
                                <option value="Completed" <%= "Completed".equals(bookingStatus) ? "selected" : "" %>>Completed</option>
                                <option value="Cancelled" <%= "Cancelled".equals(bookingStatus) ? "selected" : "" %>>Cancelled</option>
                            </select>
                        </form>
                        <% } else { %>
                        <span style="color:#777;">No employee</span>
                        <% } %>
                    </td>
                </tr>

                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>

                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
