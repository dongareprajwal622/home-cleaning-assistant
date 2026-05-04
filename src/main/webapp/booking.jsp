<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #f5f5f5;
            min-height: 100vh;
        }
        .navbar {
            background-color: #f4fbfb;
            padding: 8px 0;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        .navbar-brand img { height: 65px; width: auto; }
        .navbar-nav .nav-link { padding: 6px 14px; font-size: 16px; color: #0d2a10; }
        .navbar-nav .nav-link:hover { color: #d64717; }
        .icon-btn { font-size: 20px; color: #0d1b2a; background: none; border: none; padding: 6px 10px; margin-left: 8px; }
        .icon-btn:hover { color: #20c997; }
        .btn-success { background-color: #20c997; border: none; }
        .btn-success:hover { background-color: #1bb389; }

        .booking-wrapper {
            display: flex;
            max-width: 950px;
            width: 100%;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            overflow: hidden;
            margin: 40px auto;
        }
        .form-section { flex: 1; padding: 40px; }
        .form-section h2 { margin-bottom: 20px; font-size: 24px; color: #333; }
        .form-group { margin-bottom: 15px; }
        label { display: block; font-weight: bold; margin-bottom: 6px; color: #444; }
        input, textarea, select {
            width: 100%; padding: 12px; border-radius: 8px; border: 1px solid #ccc;
            font-size: 15px; outline: none; transition: 0.3s;
        }
        input:focus, textarea:focus, select:focus { border-color: #ff6600; box-shadow: 0 0 6px rgba(255,102,0,0.4); }
        textarea { resize: none; height: 80px; }
        .btn-submit {
            display: block; width: 100%; padding: 14px; margin-top: 20px;
            background: #ff6600; border: none; border-radius: 8px; color: #fff;
            font-size: 16px; font-weight: bold; cursor: pointer; transition: 0.3s;
        }
        .btn-submit:hover { background: #e05500; }
        .image-section {
            flex: 1;
            background: url("image/bookinglady.png") center/115% no-repeat;
            background-color: #f0f0f0;
        }
        @media (max-width: 768px) {
            .booking-wrapper { flex-direction: column; }
            .image-section { height: 250px; }
        }
        .dropdown-toggle::after { display: none; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container-fluid px-3">
        <a class="navbar-brand d-flex align-items-center" href="#">
            <img src="image/logo.png" alt="Logo" class="me-2">
            <div class="fw-bold ms-1 text-dark">
                CLEAN<br>
                <small class="fw-light" style="letter-spacing: 2px;">MASTER</small>
            </div>
        </a>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav me-3">
                <li class="nav-item"><a class="nav-link active" href="home.jsp">Home</a></li>
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
            </ul>
            <button class="icon-btn"><i class="bi bi-search"></i></button>
        </div>
    </div>
</nav>

<!-- Booking Form -->
<div class="booking-wrapper">
    <div class="form-section">
        <h2>Book Your Cleaning</h2>
        <form id="bookingForm" action="BookingServlet" method="post">
            <div class="form-group">
                <label for="service">Selected Package</label>
                <input type="text" id="service" name="service" value="<%= request.getParameter("package") != null ? request.getParameter("package") : "" %>" readonly>
            </div>

            <div class="form-group">
                <label for="date">Date</label>
                <input type="date" id="date" name="date"
                       min="<%= java.time.LocalDate.now() %>"
                       max="<%= java.time.LocalDate.now() %>"
                       required>
            </div>
            <div class="form-group">
                <label for="time">Time</label>
                <input type="time" id="time" name="time" required>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <textarea id="address" name="address" placeholder="Enter your full address" required></textarea>
            </div>
            <div class="form-group">
                <label for="contact">Contact Number</label>
                <input type="tel" id="contact" name="contact" placeholder="Phone Number" pattern="[0-9]{10}" maxlength="10" required inputmode="numeric"  oninput="this.value = this.value.replace(/[^0-9]/g, '')">
            </div>
            <div class="form-group">
                <label for="notes">Extra Notes (optional)</label>
                <textarea id="notes" name="notes" placeholder="Any extra instructions?"></textarea>
            </div>
            <button type="submit" class="btn-submit">Confirm Booking</button>
        </form>
    </div>
    <div class="image-section"></div>
</div>

<!-- Footer -->
<section style="background-color: #0d1b2a; border-radius: 5px;">
    <div class="container" style="color: white; padding: 30px;">
        <div class="col-5">
            <h2 class="fw-bold display-5">The best cleaning in <br> your city.</h2>
        </div>
        <div class="row align-items-start mt-3">
            <div class="col-6">
                <h4 class="fw-bold">Address</h4> <hr>
                <h5>Clean Master Facility Services, Hiremath Heights, 6th Ln Poorvarang, Rajarampuri, Kolhapur, Maharashtra 416008</h5>
            </div>
            <div class="col-1"></div>
            <div class="col-5">
                <h4 class="fw-bold">Contact us</h4> <hr>
                <h5>9699432733 , 9876543210</h5>
            </div>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const dateInput = document.getElementById("date");
    const timeInput = document.getElementById("time");

    function setMinDate() {
        const now = new Date();
        const yyyy = now.getFullYear();
        const mm = String(now.getMonth() + 1).padStart(2, "0");
        const dd = String(now.getDate()).padStart(2, "0");
        const today = `${yyyy}-${mm}-${dd}`;
        dateInput.min = today;
        dateInput.max = today;
    }

    function setTimeLimits() {
        timeInput.min = "08:00";
        timeInput.max = "22:00";
    }

    function validateDate() {
        const today = new Date().toISOString().split("T")[0];

        // ❌ Past date
        if (dateInput.value < today) {
            alert("❌ You cannot select a past date!");
            dateInput.value = today;
            timeInput.value = "";
            return;
        }

        // ❌ Future date
        if (dateInput.value > today) {
            alert("❌ Booking is allowed only for today.");
            dateInput.value = today;
            timeInput.value = "";
            return;
        }

        // ✅ Today → continue normal flow
        validateTime();
    }


    function validateTime() {
        const selectedDate = dateInput.value;
        const selectedTime = timeInput.value;
        if (!selectedDate || !selectedTime) return;

        const now = new Date();
        const today = now.toISOString().split("T")[0];

        const [hours, minutes] = selectedTime.split(":").map(Number);
        const selectedDateTime = new Date(selectedDate);
        selectedDateTime.setHours(hours, minutes, 0, 0);

        if (selectedDateTime < now) {
            alert("⚠️ The selected time has already passed. Please select a valid future time.");
            timeInput.value = "";
            return;
        }

        const oneHourLater = new Date(now.getTime() + 60 * 60 * 1000);
        if (selectedDate === today && selectedDateTime < oneHourLater) {
            alert("⏰ Please select a time at least 1 hour ahead of the current time.");
            timeInput.value = "";
            return;
        }

        const startTime = new Date(selectedDate);
        startTime.setHours(8, 0, 0, 0);
        const endTime = new Date(selectedDate);
        endTime.setHours(22, 0, 0, 0);

        if (selectedDateTime < startTime || selectedDateTime > endTime) {
            alert("🕗 Bookings are allowed only between 8:00 AM and 10:00 PM.");
            timeInput.value = "";
            return;
        }

        const ninePM = new Date();
        ninePM.setHours(21, 0, 0, 0);
        if (now > ninePM && selectedDate === today) {
            alert("🌙 Sorry, please book your service for tomorrow.");
            dateInput.value = "";
            timeInput.value = "";
            return;
        }
    }

    // Event listeners
    dateInput.addEventListener("change", validateDate);
    timeInput.addEventListener("change", validateTime);

    document.addEventListener("DOMContentLoaded", () => {
        setMinDate();
        setTimeLimits();
    });
</script>


</body>
</html>
