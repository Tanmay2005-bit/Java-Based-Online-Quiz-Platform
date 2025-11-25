<%-- 
    Document   : register.jsp
    Created on : 19 Nov 2025, 10:56:15 pm
    Author     : dharm
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Quiz Platform</title>
    <style>
        body { font-family: Arial; background: #e8e8e8; }
        .box { width: 300px; margin: 80px auto; padding: 20px; background: white; border-radius: 5px; }
        input, select { width: 100%; padding: 10px; margin: 8px 0; }
        button { width: 100%; padding: 10px; background: green; color: white; border: none; }
        .error { color: red; }
    </style>
</head>
<body>
<div class="box">
    <h2>Create Account</h2>
    <% if (request.getParameter("error") != null) { %>
        <p class="error">Email already exists or something went wrong!</p>
    <% } %>
    <form action="register" method="post">
        <input type="text" name="name" placeholder="Full Name" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <select name="role" required>
            <option value="ADMIN">Admin</option>
            <option value="QUIZ_CREATOR">Quiz Creator</option>
            <option value="PARTICIPANT">Participant</option>
        </select>
        <button type="submit">Register</button>
    </form>
    <p>Already have an account? <a href="login.jsp">Login</a></p>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
