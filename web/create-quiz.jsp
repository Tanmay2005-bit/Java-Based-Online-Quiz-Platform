<%-- 
    Document   : create-quiz.jsp
    Created on : 20 Nov 2025, 9:47:51 am
    Author     : dharm
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Quiz</title>
    <style>
        body { font-family: Arial; padding: 20px; }
        input, textarea { width: 100%; padding: 10px; margin: 10px 0; }
        button { padding: 10px; background: green; color: white; border-radius: 4px; }
    </style>
</head>
<body>

<h2>Create a New Quiz</h2>

<form action="createQuiz" method="post">
    <label>Quiz Title:</label>
    <input type="text" name="title" required>

    <label>Duration (minutes):</label>
    <input type="number" name="duration" required>

    <button type="submit">Create Quiz</button>
</form>
<%@ include file="footer.jsp" %>
</body>
</html>
