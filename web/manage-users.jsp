<%-- 
    Document   : manage-users.jsp
    Created on : 19 Nov 2025, 11:03:36 pm
    Author     : dharm
--%>

<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Users</title>
    <style>
        table { width:100%; border-collapse: collapse; margin-top:20px; }
        th, td { border:1px solid gray; padding:10px; text-align:left; }
        th { background:#ddd; }
    </style>
</head>
<body>
   <%@ page contentType="text/html;charset=UTF-8" %>


<h2>User Management</h2>

<%
    UserDAO userDAO = new UserDAO();
    List<User> users = userDAO.getAllUsers();
%>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Action</th>
    </tr>

    <% for (User u : users) { %>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getName() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getRole() %></td>
            <td><a href="delete-user?id=<%= u.getId() %>">Delete</a></td>
        </tr>
    <% } %>

</table>
<%@ include file="footer.jsp" %>
</body>
</html>
