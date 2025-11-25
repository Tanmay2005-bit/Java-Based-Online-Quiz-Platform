<%-- 
    Document   : add-question.jsp
    Created on : 20 Nov 2025, 9:49:45 am
    Author     : dharm
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Question</title>
    <style>
        body { font-family: Arial; padding:20px; }
        textarea, input { width:100%; padding:10px; margin:10px 0; }
        button { padding:10px; background:blue; color:white; border:none; }
    </style>
</head>
<body>

<h2>Add Question to Quiz</h2>

<form action="addQuestion" method="post">
    <input type="hidden" name="quizId" value="<%= request.getParameter("quizId") %>">
    
    <label>Question Text:</label>
    <textarea name="questionText" rows="3" required></textarea>

    <label>Option A:</label>
    <input type="text" name="optionA" required>

    <label>Option B:</label>
    <input type="text" name="optionB" required>

    <label>Option C:</label>
    <input type="text" name="optionC" required>

    <label>Option D:</label>
    <input type="text" name="optionD" required>

    <label>Correct Option (A/B/C/D):</label>
    <input type="text" name="correctAnswer" required>

    <button type="submit">Add Question</button>
</form>
    <a href="PublishQuizServlet?quizId=${param.quizId}" 
   class="btn btn-success" 
   style="margin-top:20px; width:100%;">
    Finish & Publish Quiz
</a>
<%@ include file="footer.jsp" %>
</body>
</html>
