<%-- 
    Document   : login
    Created on : 11 Jun 2025, 10:23:42 pm
    Author     : SHAHRUL
--%>

<%-- File: WebContent/login.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>UMT Transport - Login</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .container { width: 300px; margin: 100px auto; }
        input { width: 100%; padding: 8px; margin: 5px 0; }
        button { padding: 10px; width: 100%; }
    </style>
</head>
<body>
    <div class="container">
        <h2>UMT Transport Login</h2>
        <% if (request.getParameter("error") != null) { %>
            <p style="color:red;">Invalid credentials!</p>
        <% } %>
        <form action="login" method="post">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <p>New student? <a href="register.jsp">Register here</a></p>
    </div>
</body>
</html>