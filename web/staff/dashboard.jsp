<%-- 
    Document   : dashboard
    Created on : 11 Jun 2025, 11:03:15 pm
    Author     : SHAHRUL
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Staff Dashboard</title>
</head>
<body>
    <h1>Welcome, Staff </h1>
    <h2>Issue Summons</h2>
    <form action="<%= request.getContextPath() %>/issueSummons" method="post">
        <label>Matric Number: <input type="text" name="matricNo" required></label><br>
        <label>Violation Type: 
            <select name="violationType" required>
                <option value="Illegal Parking">Illegal Parking</option>
                <option value="No Vehicle Sticker">No Vehicle Sticker</option>
                <option value="Speeding">Speeding</option>
            </select>
        </label><br>
        <label>Location: <input type="text" name="location" required></label><br>
        <button type="submit">Issue Summons</button>
    </form>
    
    <%-- Display success/error messages --%>
    <% if (request.getParameter("success") != null) { %>
        <p style="color: green;">Summons issued successfully!</p>
    <% } %>
    <% if (request.getParameter("error") != null) { %>
        <p style="color: red;">Failed to issue summons. Please check matric number.</p>
    <% } %>
    
    <p><a href="../logout">Logout</a></p>
</body>
</html>
