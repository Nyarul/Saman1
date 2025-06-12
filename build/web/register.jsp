<%-- 
    Document   : register
    Created on : 11 Jun 2025, 10:24:37 pm
    Author     : SHAHRUL
--%>

<%-- File: WebContent/register.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Student Registration</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .container { width: 400px; margin: 50px auto; }
        input, select { width: 100%; padding: 8px; margin: 5px 0; }
        button { padding: 10px; width: 100%; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Student Registration</h2>
        <% if (request.getParameter("success") != null) { %>
            <p style="color:green;">Registration successful! Please login.</p>
        <% } %>
        <% if (request.getParameter("error") != null) { %>
            <p style="color:red;">Registration failed! Please try again.</p>
        <% } %>
        <form action="register" method="post">
            <input type="text" name="matricNo" placeholder="Matric Number" required>
            <input type="text" name="fullName" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" name="phone" placeholder="Phone Number">
            <input type="text" name="plateNumber" placeholder="Vehicle Plate Number" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Register</button>
        </form>
        <p>Already registered? <a href="login.jsp">Login here</a></p>
    </div>
</body>
</html>
