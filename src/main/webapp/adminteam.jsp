<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Team Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
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

        .employee-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            background: #fff;
            margin-left: 90px;
        }
        .employee-card img { width: 100%; height: 260px; object-fit: cover; }
        .table-container {
            margin-left: 300px;
            margin-top: 40px;
            margin-right: 40px;
        }
        table img {
            width: 70px;
            height: 60px;
            border-radius: 6px;
            object-fit: cover;
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


<!-- ----------------------- FORM (UNCHANGED) ---------------------------- -->
<div class="container py-5">
    <h2 class="fw-bold display-6 text-center mb-4" style="margin-left: 180px;">Add Team Member</h2>

    <div class="row justify-content-center" style="margin-left: 80px;">
        <div class="col-md-6">
            <div class="card employee-card">
                <img id="preview" src="https://via.placeholder.com/400x260?text=Upload+Image">

                <div class="card-body">
                    <form action="TeamServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="action" value="add">

                        <div class="mb-2">
                            <label class="form-label">Upload Image</label>
                            <input type="file" name="image" class="form-control" accept="image/*" onchange="previewImage(event)">
                        </div>

                        <div class="mb-2">
                            <label class="form-label">Full Name</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>

                        <div class="mb-2">
                            <label class="form-label">Role</label>
                            <input type="text" name="role" class="form-control" required>
                        </div>

                        <div class="mb-2">
                            <label class="form-label">Experience</label>
                            <input type="text" name="experience" class="form-control">
                        </div>

                        <div class="mb-2">
                            <label class="form-label">Specialty</label>
                            <input type="text" name="specialty" class="form-control">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Rating</label>
                            <select class="form-select" name="rating" required>
                                <option value="">Select rating</option>
                                <option value="1">1 ★</option>
                                <option value="2">2 ★★</option>
                                <option value="3">3 ★★★</option>
                                <option value="4">4 ★★★★</option>
                                <option value="5">5 ★★★★★</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-success w-100">Save</button>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- ----------------------- TABLE SECTION ---------------------------- -->
<div class="table-container">
    <h3 class="fw-bold mb-3">Team Members</h3>

    <table class="table table-bordered table-striped bg-white">
        <thead class="table-dark">
        <tr>
            <th>Image</th>
            <th>Name</th>
            <th>Role</th>
            <th>Experience</th>
            <th>Specialty</th>
            <th>Rating</th>
            <th>Actions</th>
        </tr>
        </thead>

        <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/home_assistant","root","Root@123");

                PreparedStatement pst = con.prepareStatement("SELECT * FROM team_members");
                ResultSet rs = pst.executeQuery();

                while(rs.next()) {
        %>

        <tr>
            <td><img src="<%= rs.getString("image_path") %>"></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("role") %></td>
            <td><%= rs.getString("experience") %></td>
            <td><%= rs.getString("specialty") %></td>
            <td><%= rs.getString("rating") %> ★</td>

            <td>
                <!-- EDIT BUTTON -->
                <button class="btn btn-primary btn-sm"
                        onclick="openEditModal(
                                '<%= rs.getInt("id") %>',
                                '<%= rs.getString("name") %>',
                                '<%= rs.getString("role") %>',
                                '<%= rs.getString("experience") %>',
                                '<%= rs.getString("specialty") %>',
                                '<%= rs.getString("rating") %>'
                                )">
                    Edit
                </button>

                <!-- DELETE BUTTON -->
                <form action="TeamServlet" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                    <button type="submit" class="btn btn-danger btn-sm"
                            onclick="return confirm('Are you sure?')">Delete</button>
                </form>
            </td>
        </tr>

        <% } con.close(); } catch(Exception ex){ out.println(ex);} %>
        </tbody>
    </table>
</div>

<div class="modal fade" id="editModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">

            <form action="TeamServlet" method="post" enctype="multipart/form-data">
                <input type="hidden" name="action" value="update">
                <input type="hidden" id="edit-id" name="id">

                <div class="modal-header">
                    <h5 class="modal-title">Edit Member</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">

                    <label>Name</label>
                    <input type="text" id="edit-name" name="name" class="form-control mb-2">

                    <label>Role</label>
                    <input type="text" id="edit-role" name="role" class="form-control mb-2">

                    <label>Experience</label>
                    <input type="text" id="edit-exp" name="experience" class="form-control mb-2">

                    <label>Specialty</label>
                    <input type="text" id="edit-spec" name="specialty" class="form-control mb-2">

                    <label>Rating</label>
                    <select id="edit-rating" name="rating" class="form-select mb-2">
                        <option value="1">1 ★</option>
                        <option value="2">2 ★★</option>
                        <option value="3">3 ★★★</option>
                        <option value="4">4 ★★★★</option>
                        <option value="5">5 ★★★★★</option>
                    </select>

                    <label>Change Image (optional)</label>
                    <input type="file" name="image" class="form-control">

                </div>

                <div class="modal-footer">
                    <button class="btn btn-success">Update</button>
                </div>

            </form>
        </div>
    </div>
</div>

<script>
    function previewImage(event) {
        document.getElementById('preview').src = URL.createObjectURL(event.target.files[0]);
    }

    function openEditModal(id, name, role, exp, spec, rating) {
        document.getElementById("edit-id").value = id;
        document.getElementById("edit-name").value = name;
        document.getElementById("edit-role").value = role;
        document.getElementById("edit-exp").value = exp;
        document.getElementById("edit-spec").value = spec;
        document.getElementById("edit-rating").value = rating;

        let modal = new bootstrap.Modal(document.getElementById("editModal"));
        modal.show();
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
