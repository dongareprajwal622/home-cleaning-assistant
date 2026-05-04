<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Employee" %>
<%@ page import="java.sql.*" %>
<%@ page import="configuration.jdbcConnection" %>
<html>
<head>
  <title>Manage Employees</title>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
  <style>
    /* Keep all your existing CSS exactly as before */
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


    .main-content{ margin-left:240px; padding:30px; }
    .page-title{ color:#ff6600; font-size:1.8rem; margin-bottom:25px; text-align:center; }

    .container{ display:grid; grid-template-columns:1fr 2fr; gap:20px; }
    .form-container, .table-container{ background:#fff; padding:20px; border-radius:12px; box-shadow:0 4px 12px rgba(0,0,0,0.05); }
    .form-container h3{ margin-bottom:15px; border-left:5px solid #ff7300; padding-left:10px; font-size:1.2rem; }
    .form-group{ margin-bottom:15px; }
    label{ font-weight:600; display:block; margin-bottom:5px; }
    input[type="text"], input[type="file"], select{ width:95%; padding:10px; border:1px solid #ddd; border-radius:8px; }
    input:focus, select:focus{ border-color:#ff7300; outline:none; box-shadow:0 0 5px rgba(255,115,0,0.3); }
    button{ padding:10px; border:none; background:#ff7300; color:white; border-radius:8px; cursor:pointer; font-size:16px; transition:0.2s; }
    button:hover{ background:#e65c00; transform:scale(1.03); }
    .btn-secondary{ background:#ccc; margin-left:5px; }
    .btn-secondary:hover{ background:#bbb; }

    table{ width:100%; border-collapse:collapse; }
    th, td{ padding:14px; text-align:center; }
    th{ background:#ff7300; color:#fff; }
    tr:hover{ background:#f8f9fc; }
    .badge{ padding:6px 12px; border-radius:20px; font-size:13px; font-weight:bold; color:#fff; }
    .available{ background:#28a745; }
    .not-available{ background:#dc3545; }
    img{ width:40px; height:40px; border-radius:50%; object-fit:cover; border:2px solid #ddd; }
    .action-btn{ background:transparent; border:none; cursor:pointer; font-size:16px; margin:0 5px; color:#555; text-decoration:none; }
    .action-btn:hover{ color:#ff7300; }
    .search-box{ margin-bottom:10px; text-align:right; }
    .search-box input{ padding:8px; border-radius:8px; border:1px solid #ddd; width:200px; }

    @media screen and (max-width:1024px){
      .container{ grid-template-columns:1fr; }
      .main-content{ margin-left:0; }
      .sidebar{ position:static; width:100%; flex-direction:row; overflow-x:auto; }
      .sidebar h2{ display:none; }
    }
  </style>
</head>
<body>

<div class="sidebar">
  <h2>CLEAN MASTER</h2>

  <a href="admindash.jsp"><i class="fas fa-home"></i> Home</a>

  <form action="home.jsp" method="POST">
    <button class="logout-btn"><i class="fas fa-sign-out-alt"></i> Log Out</button>
  </form>
</div>

<main class="main-content">
  <h2 class="page-title">Manage Employees</h2>

  <%
    // Load employee to edit if "id" parameter exists
    String editId = request.getParameter("id");
    Employee editEmp = null;
    if(editId != null) {
      try {
        Connection con = jdbcConnection.getConnection();
        PreparedStatement pst = con.prepareStatement("SELECT * FROM addEmployee WHERE id=?");
        pst.setInt(1, Integer.parseInt(editId));
        ResultSet rs = pst.executeQuery();
        if(rs.next()){
          editEmp = new Employee();
          editEmp.setId(rs.getInt("id"));
          editEmp.setName(rs.getString("name"));
          editEmp.setPhone(rs.getString("contact"));
          editEmp.setStatus(rs.getString("status"));
          editEmp.setPhoto(rs.getString("photo"));
        }
      } catch(Exception e){ e.printStackTrace(); }
    }
  %>

  <div class="container">

    <!-- Add/Edit Employee Form -->
    <section class="form-container">
      <h3><%= (editEmp != null) ? "Edit Employee" : "Add Employee" %></h3>
      <form action="AddEmployeeServlet" method="post" enctype="multipart/form-data">
        <!-- Hidden field to pass ID for update -->
        <input type="hidden" name="id" value="<%= (editEmp != null) ? editEmp.getId() : "" %>">

        <div class="form-group">
          <label for="name">Employee Name</label>
          <input type="text" id="name" name="name" placeholder="Enter employee name"
                 value="<%= (editEmp != null) ? editEmp.getName() : "" %>" required>
        </div>
        <div class="form-group">
          <label for="contact">Contact Number</label>
          <input type="text" id="contact" name="contact" maxlength="10" placeholder="10-digit number"
                 value="<%= (editEmp != null) ? editEmp.getPhone() : "" %>" required>
        </div>
        <div class="form-group">
          <label for="photo">Upload Photo</label>
          <input type="file" id="photo" name="photo" accept="image/*" <%= (editEmp == null) ? "required" : "" %>>
        </div>
        <div class="form-group">
          <label for="status">Availability</label>
          <select id="status" name="status">
            <option value="Available" <%= (editEmp != null && "Available".equals(editEmp.getStatus())) ? "selected" : "" %>>Available</option>
            <option value="Unavailable" <%= (editEmp != null && "Unavailable".equals(editEmp.getStatus())) ? "selected" : "" %>>Unavailable</option>
          </select>
        </div>
        <div class="button-group">
          <button type="submit"><%= (editEmp != null) ? "Update Employee" : "Save Employee" %></button>
          <button type="reset" class="btn-secondary">Clear</button>
        </div>
      </form>
    </section>

    <!-- Employee Table -->
    <section class="table-container">
      <div class="search-box">
        <input type="text" id="searchInput" placeholder="🔍 Search employee...">
      </div>
      <table>
        <thead>
        <tr>
          <th>Photo</th>
          <th>Name</th>
          <th>Phone</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
          List<Employee> employees = (List<Employee>) request.getAttribute("employees");
          if (employees != null && !employees.isEmpty()) {
            for (Employee emp : employees) {
        %>
        <tr>
          <td><img src="<%= emp.getPhoto() %>" alt="Emp Photo"></td>
          <td><%= emp.getName() %></td>
          <td><%= emp.getPhone() %></td>
          <td><span class="badge <%= "Available".equals(emp.getStatus()) ? "available" : "not-available" %>"><%= emp.getStatus() %></span></td>
          <td>
            <a href="addemp.jsp?id=<%= emp.getId() %>" class="action-btn" title="Edit"><i class="fas fa-edit"></i> Edit</a>
            <a href="DeleteEmployeeServlet?id=<%= emp.getId() %>" class="action-btn" title="Delete"><i class="fas fa-trash"></i> Delete</a>
          </td>
        </tr>
        <%
          }
        } else {
        %>
        <tr>
          <td colspan="5">No employees found.</td>
        </tr>
        <%
          }
        %>
        </tbody>
      </table>
    </section>
  </div>

</main>

<script>
  document.getElementById("searchInput").addEventListener("keyup", function () {
    const searchValue = this.value.toLowerCase();
    const rows = document.querySelectorAll("tbody tr");
    rows.forEach(row => {
      const name = row.cells[1].textContent.toLowerCase();
      row.style.display = name.includes(searchValue) ? "" : "none";
    });
  });
</script>

</body>
</html>
