<%-- 
    Document   : createQuiz
    Created on : 22 Nov 2025, 6:19:30 pm
    Author     : dharm
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Quiz - Quiz Platform</title>
    <style>
        body { font-family: Arial; background: #f8f9fa; }
        .container { width: 400px; margin: 80px auto; background: white; padding: 24px; border-radius: 5px; }
        input, textarea, button { width: 100%; margin: 10px 0; padding: 10px;}
        label { font-weight: bold; }
        .msg { margin-bottom: 10px; font-size: 15px; }
        .msg-success { color: green; }
        .msg-error { color: red; }
    </style>
</head>
<body>
<div class="container">
    <h2>Create a New Quiz</h2>
    <% 
        String success = request.getParameter("success");
        String error = request.getParameter("error");
        if (success != null) { 
    %>
        <div class="msg msg-success">Quiz created successfully!</div>
    <% 
        } else if (error != null) { 
            if ("missingfields".equals(error)) { 
    %>
        <div class="msg msg-error">Please fill in both the title and description.</div>
    <% 
            } else { 
    %>
        <div class="msg msg-error">There was an error creating the quiz.</div>
    <%
            }
        }
    %>
    <form action="createQuiz" method="post" autocomplete="off">
        <label for="title">Quiz Title:</label>
        <input type="text" name="title" id="title" required />

        <label for="description">Description:</label>
        <textarea name="description" id="description" rows="4" required></textarea>

        <button type="submit">Create Quiz</button>
    </form>
    <a href="creator-dashboard.jsp">Back to Dashboard</a>
</div>
</body>
</html>
