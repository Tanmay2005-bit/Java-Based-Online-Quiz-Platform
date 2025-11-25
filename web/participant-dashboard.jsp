<%-- 
    Document   : participant-dashboard.jsp
    Created on : 19 Nov 2025, 11:01:19 pm
    Author     : dharm
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ page import="java.sql.*, util.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Participant Dashboard</title>
    <style>
        body { 
            font-family: Arial; 
            background:#eef2f3; 
            padding:20px; 
        }
        .card { 
            background:white; 
            padding:20px; 
            margin:10px 0; 
            border-radius:5px; 
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        a { 
            text-decoration:none; 
            color:#007bff; 
            font-weight:bold;
        }
        .quiz-card {
            padding:15px;
            margin:10px 0;
            background:#fff;
            border-radius:5px;
            border:1px solid #ddd;
        }
        .quiz-title {
            font-size:18px;
            font-weight:bold;
        }
        .quiz-desc {
            font-size:14px;
            margin-top:5px;
            color:#555;
        }
    </style>
</head>
<body>

<h2>Participant Dashboard</h2>
<p>Welcome, Participant!</p>

<!-- TAKE QUIZ SECTION -->
<div class="card">
    <h3>Available Quizzes</h3>

    <%
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT id, title, description FROM quizzes WHERE status='ACTIVE'";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            boolean found = false;

            while (rs.next()) {
                found = true;
    %>

        <div class="quiz-card">
            <div class="quiz-title"><%= rs.getString("title") %></div>
            <div class="quiz-desc"><%= rs.getString("description") %></div>
            <br>
            <a href="take-quiz.jsp?quizId=<%= rs.getInt("id") %>">Start Quiz →</a>
        </div>

    <%
            }

            if (!found) {
    %>
            <p>No quizzes available right now.</p>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
    %>
            <p style="color:red;">Error loading quizzes.</p>
    <%
        }
    %>
</div>

<!-- PERFORMANCE REPORT -->
<div class="card">
    <h3>Performance Report</h3>
    <a href="performance.jsp">View Report →</a>
</div>

<!-- MESSAGES -->
<div class="card">
    <h3>Messages</h3>
    <a href="participant-messages.jsp">See Messages →</a>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>


