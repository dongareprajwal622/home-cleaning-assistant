<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manage Packages</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #f7f9fc, #e0f7fa);
            min-height: 100vh;
            font-family: 'Inter', sans-serif;
        }

        /* 🔥 NEW NAVBAR START */
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
            transition: 0.2s ease;
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

        .main-content {
            margin-left: 240px;
            padding: 20px;
        }
        /* 🔥 NEW NAVBAR END */

        .page-title {
            font-weight: 700;
            color: #fd590d;
        }

        .card {
            border: none;
            border-radius: 15px;
            transition: 0.3s;
        }
        .card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .table th {
            background: #fd590d;
            color: #fff;
        }

        input, textarea {
            border-radius: 10px !important;
        }

        .form-label {
            font-weight: 500;
        }
    </style>
</head>
<body>

<!-- 🔥 NEW NAVBAR -->
<div class="sidebar">
    <h2>CLEAN MASTER</h2>

    <a href="admindash.jsp" class="active"><i class="fas fa-home"></i>&nbsp; Home</a>

    <form action="home.jsp" method="POST">
        <button class="logout-btn"><i class="fas fa-sign-out-alt"></i> Log Out</button>
    </form>
</div>

<div class="main-content">
    <div class="container py-5">
        <h2 class="mb-5 text-center page-title"><i class="bi bi-gear"></i> Manage Packages</h2>

        <!-- ADD / UPDATE FORM -->
        <div class="card shadow-sm p-4 mb-5">
            <h5 class="text-secondary mb-4"><i class="bi bi-plus-circle"></i> Add / Update Package</h5>

            <form action="PackageServlet" method="post">
                <input type="hidden" name="id" id="pkg_id">
                <input type="hidden" name="action" id="form_action" value="add">

                <div class="row g-3">
                    <div class="col-md-4">
                        <label class="form-label">Choose Icon</label>
                        <select name="icon" id="icon" class="form-select" required>
                            <option value="">-- Select Icon --</option>
                            <option value="bi bi-person">👤 Single Person</option>
                            <option value="bi bi-people">👥 Two People</option>
                            <option value="bi bi-building">🏢 Building</option>
                            <option value="bi bi-house">🏠 House</option>
                            <option value="bi bi-tools">🧰 Tools</option>
                            <option value="bi bi-bucket">🪣 Cleaning Bucket</option>
                            <option value="bi bi-brush">🧹 Brush</option>
                            <option value="bi bi-star">⭐ Premium</option>
                        </select>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Title</label>
                        <input type="text" name="title" id="title" class="form-control" placeholder="Package Name" required>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Price</label>
                        <input type="text" name="price" id="price" class="form-control" placeholder="₹200" required>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Assign Employees</label>
                        <input type="number" name="assign_emp" id="assign_emp" class="form-control" required>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Feature 1</label>
                        <input type="text" name="feature1" id="feature1" class="form-control">
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Feature 2</label>
                        <input type="text" name="feature2" id="feature2" class="form-control">
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Feature 3</label>
                        <input type="text" name="feature3" id="feature3" class="form-control">
                    </div>

                    <div class="col-md-12">
                        <label class="form-label">Description</label>
                        <textarea name="description" id="description" class="form-control" rows="3"></textarea>
                    </div>
                </div>

                <div class="mt-4 text-center">
                    <button type="submit" class="btn btn-success px-4 me-2"><i class="bi bi-check-circle"></i> Save</button>
                    <button type="reset" id="resetBtn" class="btn btn-secondary px-4"><i class="bi bi-arrow-clockwise"></i> Clear</button>
                </div>
            </form>
        </div>

        <!-- TABLE -->
        <div class="card shadow-sm p-4">
            <h5 class="text-secondary mb-3"><i class="bi bi-list-ul"></i> Existing Packages</h5>

            <div class="table-responsive">
                <table class="table align-middle table-hover">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Icon</th>
                        <th>Title</th>
                        <th>Price</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/home_assistant", "root", "Root@123");
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("SELECT * FROM packages");

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><i class="<%= rs.getString("icon") %> fs-4 text-primary"></i></td>
                        <td><%= rs.getString("title") %></td>
                        <td>₹<%= rs.getString("price") %></td>
                        <td><%= rs.getString("description") %></td>
                        <td>
                            <button
                                    class="btn btn-warning btn-sm editBtn"
                                    data-id="<%= rs.getInt("id") %>"
                                    data-icon="<%= rs.getString("icon") %>"
                                    data-title="<%= rs.getString("title") %>"
                                    data-price="<%= rs.getString("price") %>"
                                    data-assign="<%= rs.getInt("assign_emp") %>"
                                    data-description="<%= rs.getString("description") %>"
                                    data-f1="<%= rs.getString("feature1") %>"
                                    data-f2="<%= rs.getString("feature2") %>"
                                    data-f3="<%= rs.getString("feature3") %>"
                            ><i class="bi bi-pencil-square"></i></button>

                            <form action="PackageServlet" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                <button type="submit" class="btn btn-danger btn-sm"><i class="bi bi-trash3"></i></button>
                            </form>
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
</div>

<script>
    document.querySelectorAll('.editBtn').forEach(btn => {
        btn.addEventListener('click', () => {
            document.getElementById('form_action').value = 'update';
            document.getElementById('pkg_id').value = btn.dataset.id;
            document.getElementById('icon').value = btn.dataset.icon;
            document.getElementById('title').value = btn.dataset.title;
            document.getElementById('price').value = btn.dataset.price;
            document.getElementById('assign_emp').value = btn.dataset.assign;
            document.getElementById('description').value = btn.dataset.description;
            document.getElementById('feature1').value = btn.dataset.f1;
            document.getElementById('feature2').value = btn.dataset.f2;
            document.getElementById('feature3').value = btn.dataset.f3;

            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    });

    document.getElementById('resetBtn').addEventListener('click', () => {
        document.getElementById('form_action').value = 'add';
        document.getElementById('pkg_id').value = '';
    });
</script>

</body>
</html>
