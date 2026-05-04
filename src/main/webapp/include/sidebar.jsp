<!-- includes/sidebar.jsp -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

<style>
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
    padding: 10px;
    border-radius: 8px;
    gap: 10px;
    transition: background 0.2s;
  }

  .sidebar a:hover,
  .sidebar a.active {
    background-color: #7f7477;
  }

  .logout-btn {
    width: 100%;
    padding: 12px;
    background: linear-gradient(135deg, #ff4e50, #f9d423);
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    margin-top: 15px;
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 16px;
    transition: 0.2s;
  }

  .logout-btn:hover {
    background: linear-gradient(135deg, #ff3e3e, #ffa600);
    transform: translateY(-2px);
  }
</style>

<div class="sidebar">
  <h2>CLEAN MASTER</h2>

  <a href="admin_dashboard.jsp" class="<%= request.getRequestURI().contains("admin_dashboard") ? "active" : "" %>">
    <i class="fas fa-home"></i> Home
  </a>

  <form action="logout.jsp" method="POST">
    <button type="submit" class="logout-btn">
      <i class="fas fa-sign-out-alt"></i> Log Out
    </button>
  </form>
</div>
