<%-- 
    Document   : quiz-results.jsp
    Created on : 20 Nov 2025, 9:50:24 am
    Author     : dharm
--%>

<%@ page import="dao.ResultDAO" %>
<%@ page import="model.Result" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz Results</title>
    <style>
        table { width:100%; border-collapse: collapse; margin-top:20px; }
        th, td { border:1px solid gray; padding:10px; }
        th { background:#ddd; }
    </style>
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" %>

<h2>Quiz Results</h2>

<%
    ResultDAO dao = new ResultDAO();
    List<Result> results = dao.getAllResults();
%>

<table>
    <tr>
        <th>Participant</th>
        <th>Quiz Title</th>
        <th>Score</th>
    </tr>

    <% for (Result r : results) { %>
        <tr>
            <td><%= r.getParticipantName() %></td>
            <td><%= r.getQuizTitle() %></td>
            <td><%= r.getScore() %></td>
        </tr>
    <% } %>

</table>
<%@ include file="footer.jsp" %>
</body>
</html>
