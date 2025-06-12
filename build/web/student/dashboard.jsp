<%-- 
    Document   : dashboard
    Created on : 11 Jun 2025, 11:04:38 pm
    Author     : SHAHRUL
--%>

<%@page import="Dao.SummonsDAO"%>
<%@page import="model.User"%>
<%-- File: WebContent/student/dashboard.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Summons" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"student".equals(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
    
    SummonsDAO summonsDAO = new SummonsDAO();
    List<Summons> summonsList = summonsDAO.getSummonsForStudent(user.getId());
%>
<html>
<head>
    <title>Student Dashboard</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>Welcome,  <%= user.getFullName() %></h1>
    
    <h2>Your Summons</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Violation</th>
            <th>Location</th>
            <th>Amount (RM)</th>
            <th>Status</th>
            <th>Issued Date</th>
        </tr>
        <% for (Summons summons : summonsList) { %>
        <tr>
            <td><%= summons.getId() %></td>
            <td><%= summons.getViolationType() %></td>
            <td><%= summons.getLocation() %></td>
            <td><%= String.format("%.2f", summons.getAmount()) %></td>
            <td><%= summons.getStatus() %></td>
            <td><%= summons.getIssuedAt() %></td>
        </tr>
        <% } %>
    </table>
    
    <p><a href="../logout">Logout</a></p>
</body>
</html>