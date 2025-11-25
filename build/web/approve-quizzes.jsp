<%-- 
    Document   : approve-quizzes.jsp
    Created on : 19 Nov 2025, 11:04:31 pm
    Author     : dharm
--%>

<%@ page import="java.util.List" %>
<%@ page import="model.Quiz" %>
<%@ page import="dao.QuizDAO" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Approve Quizzes</title>
    <style>
        table { width:100%; border-collapse: collapse; margin-top:20px; }
        th, td { border:1px solid gray; padding:10px; }
        th { background:#ccc; }
    </style>
</head>
<body>
    <%@ page contentType="text/html;charset=UTF-8" %>

<h2>Quiz Approvals</h2>

<%
    QuizDAO quizDAO = new QuizDAO();
    List<Quiz> quizzes = quizDAO.getAllQuizzes();
%>

<table>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Duration</th>
        <th>Action</th>
    </tr>

    <% for (Quiz q : quizzes) { %>
        <tr>
            <td><%= q.getId() %></td>
            <td><%= q.getTitle() %></td>
            <td><%= q.getDuration() %> mins</td>
            <td>
                <a href="approve-quiz?id=<%= q.getId() %>">Approve</a> |
                <a href="reject-quiz?id=<%= q.getId() %>">Reject</a>
            </td>
        </tr>
    <% } %>

</table>
<%@ include file="footer.jsp" %>
</body>
</html>
