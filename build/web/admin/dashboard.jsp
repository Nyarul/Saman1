<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="Dao.UserDAO" %>
<%@ page import="Dao.SummonsDAO" %>
<%@ page import="model.Summons" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }

    UserDAO userDAO = new UserDAO();
    List<User> students = userDAO.getAllStudents();

    SummonsDAO summonsDAO = new SummonsDAO();
%>
<html>
    <head>
        <title>Admin Dashboard</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <h1>Welcome, Admin <%= user.getFullName()%></h1>

        <h2>Student List</h2>
        <table>
            <tr>
                <th>Matric No</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Summons</th>
            </tr>
            <% for (User student : students) {
                    // Fetch the student's summons
                    List<Summons> studentSummons = summonsDAO.getSummonsForStudent(student.getId());
            %>
            <tr>
                <td><%= student.getMatricNo()%></td>
                <td><%= student.getFullName()%></td>
                <td><%= student.getEmail()%></td>
                <td><%= student.getPhone()%></td>
                <td>
                    <% if (studentSummons != null && !studentSummons.isEmpty()) { %>
                    <ul>
                        <% for (Summons summons : studentSummons) {%>
                        <li>
                            <%= summons.getViolationType()%> - <%= summons.getStatus()%>

                            <% if ("Issued".equalsIgnoreCase(summons.getStatus())) {%>
                            <form action="update-summons" method="post">
                                <input type="hidden" name="summonsId" value="<%= summons.getId()%>"/>
                                <input type="hidden" name="status" value="Paid"/>
                                <input type="submit" value="Mark as Paid"/>
                            </form>
                            <form action="update-summons" method="post">
                                <input type="hidden" name="summonsId" value="<%= summons.getId()%>"/>
                                <input type="hidden" name="status" value="Appealed"/>
                                <input type="submit" value="Mark as Appealed"/>
                            </form>
                            <% } %>
                        </li>

                        <% } %>
                    </ul>
                    <% } else { %>
                    No summons
                    <% } %>
                </td>
            </tr>
            <% }%>
        </table>
        <p><a href="../logout">Logout</a></p>
    </body>
</html>
