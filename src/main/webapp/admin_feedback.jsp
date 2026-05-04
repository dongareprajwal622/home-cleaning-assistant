<%@ page import="java.sql.*" %>
<%@ page import="configuration.jdbcConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Feedback Report</title>

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
        }

        /* ===== MAIN ===== */
        .main {
            margin-left: 240px;
            padding: 30px;
        }

        .greeting {
            font-size: 28px;
            font-weight: 600;
        }

        table {
            width: 100%;
            background: white;
            border-collapse: collapse;
            margin-top: 30px;
            border-radius: 10px;
            overflow: hidden;
        }

        th {
            background: #ff6a00;
            color: white;
            padding: 12px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        .rating-badge {
            background: #28a745;
            color: white;
            padding: 5px 10px;
            border-radius: 6px;
            font-weight: 600;
        }
    </style>
</head>

<body>

<div class="sidebar">
    <h2>CLEAN MASTER</h2>

    <a href="admindash.jsp"><i class="fas fa-home"></i> Home</a>
    <form action="home.jsp" method="POST">
        <button class="logout-btn">
            <i class="fas fa-sign-out-alt"></i> Log Out
        </button>
    </form>
</div>

<div class="main">
    <div class="greeting">User Feedback</div>
    <hr>

    <table>
        <thead>
        <tr>
            <th>#</th>
            <th>User Name</th>
            <th>Service</th>
            <th>Rating</th>
            <th>Comment</th>
            <th>Date</th>
        </tr>
        </thead>

        <tbody>
        <%
            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rs = null;

            try {
                con = jdbcConnection.getConnection();

                String sql =
                        "SELECT bf.rating, bf.comment, bf.created_at, " +
                                "u.username, ub.service_name " +
                                "FROM booking_feedback bf " +
                                "JOIN users u ON bf.user_id = u.id " +
                                "JOIN user_booking ub ON bf.booking_id = ub.booking_id " +
                                "ORDER BY bf.created_at DESC";

                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();

                int count = 1;
                while (rs.next()) {
        %>
        <tr>
            <td><%= count++ %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("service_name") %></td>
            <td>
                <span class="rating-badge">
                    <%= rs.getInt("rating") %> ★
                </span>
            </td>
            <td><%= rs.getString("comment") %></td>
            <td><%= rs.getTimestamp("created_at") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='6'>Error loading feedback</td></tr>");
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
