<%@ page import="java.sql.*" %>
<%@ page import="configuration.jdbcConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reports</title>

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
            transition: 0.2s ease;
        }

        .logout-btn:hover {
            background: linear-gradient(135deg, #ff3e3e, #fca311);
            transform: translateY(-2px);
        }

        .main {
            margin-left: 240px;
            padding: 30px;
        }

        .greeting {
            font-size: 28px;
            font-weight: 600;
        }

        .feature-buttons {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 25px;
            margin-top: 40px;
        }

        /* Medium size buttons — balanced */
        .feature-card {
            background: #fff;
            padding: 28px 15px;       /* Reduced padding */
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.06);
            text-align: center;
            cursor: pointer;
            transition: 0.25s ease;
            border: 2px solid transparent;
            width: 100%;
            height: 130px;            /* Medium height */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        /* Clean hover */
        .feature-card:hover {
            border-color: #ff6a00;
            transform: translateY(-4px);
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
        }

        .feature-card i {
            font-size: 32px;          /* Medium icon size */
            color: #ff6a00;
            margin-bottom: 8px;
        }

        .feature-card span {
            font-size: 16px;          /* Medium text */
            font-weight: 600;
        }

        /* Remove default button effect */
        form button.feature-card {
            border: none;
            background: none;
            padding: 0;
        }


        /* Table */
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
            border-bottom: 1px solid #ccc;
        }

        #entriesPagination1 {
            display: flex;
            justify-content: right; /* centers horizontally */
            align-items: center; /* vertical centering */
            gap: 6px;
            flex-wrap: wrap;
            margin-top: 15px;
        }

        #entriesPagination1 .page-btn {
            padding: 6px 10px;
            border-radius: 4px;
            cursor: pointer;
            user-select: none;
            border: 1px solid #ddd;
            background: #fff;
        }

        #entriesPagination1 .page-btn.disabled {
            opacity: 0.5;
            cursor: default;
        }

        #entriesPagination1 .page-btn.active {
            background: #0d6efd;
            color: #fff;
            border-color: #0d6efd;
        }
    </style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>CLEAN MASTER</h2>

    <a href="admindash.jsp"><i class="fas fa-home"></i> Home</a>

    <form action="home.jsp" method="POST">
        <button class="logout-btn"><i class="fas fa-sign-out-alt"></i> Log Out</button>
    </form>
</div>

<!-- Main Content -->
<div class="main">
    <div class="greeting">Reports</div>
    <hr>

    <div class="feature-buttons">

        <form method="get" action="report.jsp">
            <input type="hidden" name="show" value="employee">
            <button class="feature-card" type="submit">
                <i class="fas fa-users"></i>
                <span>Employee Report</span>
            </button>
        </form>



        <!-- User Report -->
        <form action="report.jsp" method="get">
            <input type="hidden" name="showUser" value="user">
            <button class="feature-card" type="submit">
                <i class="fas fa-user"></i>
                <span>User Report</span>
            </button>
        </form>


        <form action="report.jsp" method="get">
            <input type="hidden" name="showBooking" value="booking">
            <button class="feature-card" type="submit">
                <i class="fas fa-list"></i>
                <span>Booking Report</span>
            </button>
        </form>


        <form action="report.jsp" method="get">
            <input type="hidden" name="showPackage" value="package">
            <button class="feature-card" type="submit">
                <i class="fas fa-box"></i>
                <span>Package Report</span>
            </button>
        </form>


    </div>

    <!-- ▼▼▼ EMPLOYEE REPORT SECTION ▼▼▼ -->
    <%
        String show = request.getParameter("show");

        if ("employee".equals(show)) {

            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rs = null;

            try {
                con = jdbcConnection.getConnection();
                pst = con.prepareStatement("SELECT * FROM addEmployee");
                rs = pst.executeQuery();
    %>

    <h2 style="margin-top:40px;">Employee Report</h2>
    <form action="GenerateEmployeeReportPDF" method="post">
        <button style="padding:10px 20px;background:#ff6a00;color:white;border:none;border-radius:8px;cursor:pointer;">
            Download PDF
        </button>
    </form>
    <table id="entriesTable1">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Contact</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("contact") %></td>
            <td><%= rs.getString("status") %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <!-- pagination controls -->
    <div id="entriesPagination1"></div>

    <%
            } catch (Exception e) {
                out.println("Error loading employee report");
            }
        }
    %>

    <%
        String showUser = request.getParameter("showUser");

        if ("user".equals(showUser)) {

            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rs = null;

            try {
                con = jdbcConnection.getConnection();
                pst = con.prepareStatement("SELECT id, username, email, mobile FROM users");
                rs = pst.executeQuery();
    %>

    <h2 style="margin-top:40px;">User Report</h2>

    <!-- PDF Download Button -->
    <form action="GenerateUserReportPDF" method="post">
        <button style="padding:10px 20px;background:#28a745;color:white;border:none;border-radius:8px;cursor:pointer;">
            Download PDF
        </button>
    </form>

    <table id="entriesTable2">
        <thead>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Mobile</th>
        </tr>
        </thead>
        <tbody>

        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getLong("mobile") %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <!-- pagination controls -->
    <div id="entriesPagination2"></div>
    <%
            } catch (Exception e) {
                out.println("Error loading user report");
            }
        }
    %>
    <%
        String showBooking = request.getParameter("showBooking");

        if ("booking".equals(showBooking)) {

            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rs = null;

            try {
                con = jdbcConnection.getConnection();
                pst = con.prepareStatement("SELECT * FROM user_booking");
                rs = pst.executeQuery();
    %>

    <h2 style="margin-top:40px;">Booking Report</h2>

    <!-- PDF Download Button -->
    <form action="GenerateBookingReportPDF" method="post">
        <button style="padding:10px 20px;background:#007bff;color:white;border:none;border-radius:8px;cursor:pointer;">
            Download PDF
        </button>
    </form>

    <table id="entriesTable3">
        <thead>
        <tr>
            <th>Booking ID</th>
            <th>User ID</th>
            <th>Service Name</th>
            <th>Booking Date</th>
            <th>Booking Time</th>
            <th>Address</th>
            <th>Contact</th>
            <th>Status</th>
            <th>Price</th>
        </tr>
        </thead>
        <tbody>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("booking_id") %></td>
            <td><%= rs.getInt("user_id") %></td>
            <td><%= rs.getString("service_name") %></td>
            <td><%= rs.getDate("booking_date") %></td>
            <td><%= rs.getTime("booking_time") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("contact_number") %></td>
            <td><%= rs.getString("status") %></td>
            <td><%= rs.getInt("price") %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <!-- pagination controls -->
    <div id="entriesPagination3"></div>
    <%
            } catch (Exception e) {
                out.println("Error loading booking report");
            }
        }
    %>
    <%
        String showPackage = request.getParameter("showPackage");

        if ("package".equals(showPackage)) {

            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rs = null;

            try {
                con = jdbcConnection.getConnection();
                pst = con.prepareStatement("SELECT * FROM packages");
                rs = pst.executeQuery();
    %>

    <h2 style="margin-top:40px;">Package Report</h2>

    <!-- PDF Download Button -->
    <form action="GeneratePackageReportPDF" method="post">
        <button style="padding:10px 20px;background:#6f42c1;color:white;border:none;border-radius:8px;cursor:pointer;">
            Download PDF
        </button>
    </form>

    <table id="entriesTable4">
        <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Price</th>
            <th>Feature 1</th>
            <th>Feature 2</th>
            <th>Feature 3</th>
            <th>Description</th>
            <th>Assigned Employees</th>
        </tr>
        </thead>
        <tbody>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getDouble("price") %></td>
            <td><%= rs.getString("feature1") %></td>
            <td><%= rs.getString("feature2") %></td>
            <td><%= rs.getString("feature3") %></td>
            <td><%= rs.getString("description") %></td>
            <td><%= rs.getInt("assign_emp") %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <!-- pagination controls -->
    <div id="entriesPagination4"></div>
    <%
            } catch (Exception e) {
                out.println("Error loading package report");
            }
        }
    %>

</div>

<script>
    function setupPagination(tableId, paginationContainerId) {
        const pageSize = 10;
        const table = document.getElementById(tableId);
        if (!table) return;

        const tbody = table.querySelector('tbody');
        if (!tbody) return;

        const rows = Array.from(tbody.rows);
        const totalRows = rows.length;
        const paginationContainer = document.getElementById(paginationContainerId);

        let currentPage = 1;
        const totalPages = Math.ceil(totalRows / pageSize);

        if (totalPages <= 1) {
            rows.forEach(row => row.style.display = '');
            paginationContainer.innerHTML = '';
            return;
        }

        function renderPage(page) {
            if (page < 1) page = 1;
            if (page > totalPages) page = totalPages;
            currentPage = page;

            const start = (page - 1) * pageSize;
            const end = start + pageSize;

            rows.forEach((row, index) => {
                row.style.display = (index >= start && index < end) ? '' : 'none';
            });

            renderPaginationButtons();

            // Scroll to table safely
            table.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }

        function createButton(text, isActive, isDisabled, onClick) {
            const btn = document.createElement('button');
            btn.type = 'button';
            btn.textContent = text;
            btn.className = 'page-btn';
            if (isActive) btn.classList.add('active');
            if (isDisabled) {
                btn.classList.add('disabled');
                btn.disabled = true;
            } else {
                btn.addEventListener('click', onClick);
            }
            return btn;
        }

        function renderPaginationButtons() {
            paginationContainer.innerHTML = '';

            // Prev
            paginationContainer.appendChild(
                createButton('Prev', false, currentPage === 1, () => renderPage(currentPage - 1))
            );

            for (let i = 1; i <= totalPages; i++) {
                paginationContainer.appendChild(
                    createButton(i, i === currentPage, false, () => renderPage(i))
                );
            }

            // Next
            paginationContainer.appendChild(
                createButton('Next', false, currentPage === totalPages, () => renderPage(currentPage + 1))
            );
        }

        renderPage(1);
    }

    window.onload = function () {
        setupPagination('entriesTable1', 'entriesPagination1');
        setupPagination('entriesTable2', 'entriesPagination2');
        setupPagination('entriesTable3', 'entriesPagination3');
        setupPagination('entriesTable4', 'entriesPagination4');
    };

</script>

</body>
</html>
