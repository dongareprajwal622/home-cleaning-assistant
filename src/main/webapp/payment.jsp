<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f4f9f9, #d1f0e2);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .payment-card {
            max-width: 500px;
            width: 100%;
            padding: 30px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            transition: transform 0.3s;
        }
        .payment-card:hover { transform: translateY(-5px); }
        h3 {
            text-align: center;
            margin-bottom: 30px;
            color: #ff6600;
            letter-spacing: 1px;
        }
        label {
            font-weight: 600;
        }
        input.form-control {
            border-radius: 10px;
            padding: 12px;
            font-size: 15px;
            border: 1px solid #ccc;
            transition: 0.3s;
        }
        input.form-control:focus {
            border-color: #ff6600;
            box-shadow: 0 0 6px rgba(255,102,0,0.3);
        }
        .btn-submit {
            background-color: #ff6600;
            border: none;
            color: #fff;
            font-weight: 600;
            font-size: 16px;
            border-radius: 10px;
            padding: 12px;
            transition: 0.3s;
        }
        .btn-submit:hover {
            background-color: #e05500;
        }
        .form-row {
            display: flex;
            gap: 15px;
        }
        .form-row .form-group { flex: 1; }
    </style>
</head>
<body>

<div class="payment-card">
    <h3>Service Payment</h3>

    <%
        String serviceName = "Selected Service";
        String priceStr = "0.00";
        if(session != null){
            if(session.getAttribute("service") != null)
                serviceName = (String) session.getAttribute("service");
            if(session.getAttribute("price") != null)
                priceStr = String.format("%.2f", Double.parseDouble(session.getAttribute("price").toString()));
        }
    %>

    <p><strong>Package:</strong> <%= serviceName %></p>
    <p><strong>Total Amount:</strong> ₹<%= priceStr %></p>

    <form action="PaymentServlet" method="post" onsubmit="return validateCard();">
        <div class="mb-3">
            <label>Cardholder Name</label>
            <input type="text" name="card_name" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Card Number</label>
            <input type="text" name="card_number" class="form-control" maxlength="19" id="cardNumber" placeholder="XXXX-XXXX-XXXX-XXXX" required>
        </div>

        <div class="form-row">
            <div class="mb-3 form-group">
                <label>Expiry Date</label>
                <input type="month" name="expiry" id="expiry" class="form-control" required>
            </div>
            <div class="mb-3 form-group">
                <label>CVV</label>
                <input type="password" name="cvv" class="form-control" maxlength="3" placeholder="123" required>
            </div>
        </div>

        <button type="submit" class="btn btn-submit w-100">Confirm Payment ₹<%= priceStr %></button>
    </form>
</div>

<script>
    const cardInput = document.getElementById('cardNumber');

    cardInput.addEventListener('input', function(e){
        let value = e.target.value.replace(/\D/g, ''); // remove non-digit
        value = value.match(/.{1,4}/g)?.join('-') || '';
        e.target.value = value;
    });

    function validateCard() {
        const cardVal = cardInput.value.replace(/-/g,'');
        if(cardVal.length !== 16){
            alert("Card number must be 16 digits!");
            return false;
        }
        return true;
    }
    const expiryInput = document.getElementById("expiry");

    const now = new Date();
    const currentMonth = String(now.getMonth() + 1).padStart(2, "0");
    const currentYear = now.getFullYear();
    expiryInput.min = `${currentYear}-${currentMonth}`;

    expiryInput.addEventListener("change", function () {
        if (this.value < this.min) {
            alert("❌ Expiry date cannot be in the past");
            this.value = this.min;
        }
    });
</script>

</body>
</html>
