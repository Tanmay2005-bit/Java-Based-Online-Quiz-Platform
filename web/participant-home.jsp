<%-- 
    Document   : participant-home.jsp
    Created on : 20 Nov 2025, 10:09:19 am
    Author     : dharm
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.QuizDAO, model.Quiz, java.util.List" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">

    <h2 class="text-center mb-4">Welcome, Participant!</h2>

    <h4 class="mb-3">Available Quizzes</h4>

    <%
        QuizDAO dao = new QuizDAO();
        List<Quiz> quizzes = dao.getAllQuizzes();
    %>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Quiz Title</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
        <% 
            if (quizzes != null && !quizzes.isEmpty()) {
                for (Quiz q : quizzes) { 
        %>
            <tr>
                <td><%= q.getId() %></td>
                <td><%= q.getTitle() %></td>
                <td>
                    <a href="take-quiz.jsp?quizId=<%= q.getId() %>" 
                       class="btn btn-primary btn-sm">
                        Take Quiz →
                    </a>
                </td>
            </tr>
        <% 
                }
            } else { 
        %>
            <tr>
                <td colspan="3" class="text-center text-muted">
                    No quizzes available at the moment.
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>

    <div class="mt-4">
        <a href="LogoutServlet" class="btn btn-danger">Logout</a>
    </div>

</div>

<%@ include file="footer.jsp" %>
