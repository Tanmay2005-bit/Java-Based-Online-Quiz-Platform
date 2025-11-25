<%-- 
    Document   : take-quiz.jsp
    Created on : 20 Nov 2025, 10:11:18 am
    Author     : dharm
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Question" %>
<%@ page import="dao.QuestionDAO" %>
<%@ page import="java.sql.*, util.DBConnection" %>
<%@ include file="header.jsp" %>

<%
    // Validate quizId
    String quizIdStr = request.getParameter("quizId");
    int quizId = 0;

    if (quizIdStr == null) {
%>
        <div class="alert alert-danger mt-4 container">
            ❌ Invalid quiz selection. Please select a quiz again.
            <br><br>
            <a href="participant-dashboard.jsp" class="btn btn-primary">Go Back</a>
        </div>
<%
        return;
    }

    try {
        quizId = Integer.parseInt(quizIdStr);
    } catch (NumberFormatException e) {
%>
        <div class="alert alert-danger mt-4 container">
            ❌ Invalid Quiz ID.
            <br><br>
            <a href="participant-dashboard.jsp" class="btn btn-primary">Go Back</a>
        </div>
<%
        return;
    }

    // Fetch quiz title
    String quizTitle = "Quiz";
    try {
        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement("SELECT title FROM quizzes WHERE id=?");
        ps.setInt(1, quizId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            quizTitle = rs.getString("title");
        }
    } catch (Exception e) {}

    // Fetch all questions
    QuestionDAO qdao = new QuestionDAO();
    List<Question> questions = qdao.getQuestionsByQuizId(quizId);
%>

<div class="container mt-4">

    <h2 class="text-center mb-4"><%= quizTitle %></h2>

    <form action="submit-quiz.jsp" method="post">
        <input type="hidden" name="quizId" value="<%= quizId %>">

        <% 
        if (questions == null || questions.isEmpty()) { 
        %>
            <div class="alert alert-warning">⚠ No questions found for this quiz.</div>
            <a href="participant-dashboard.jsp" class="btn btn-primary">Go Back</a>
        <% 
        } else { 
            int index = 1;
            for (Question q : questions) { 
        %>

        <div class="card mb-3 shadow-sm">
            <div class="card-header bg-primary text-white">
                Question <%= index++ %>
            </div>
            <div class="card-body">
                <p class="fw-bold"><%= q.getQuestionText() %></p>

                <div class="form-check">
                    <input class="form-check-input" type="radio" name="q_<%= q.getId() %>" value="A" required>
                    <label class="form-check-label"><%= q.getOptionA() %></label>
                </div>

                <div class="form-check">
                    <input class="form-check-input" type="radio" name="q_<%= q.getId() %>" value="B">
                    <label class="form-check-label"><%= q.getOptionB() %></label>
                </div>

                <div class="form-check">
                    <input class="form-check-input" type="radio" name="q_<%= q.getId() %>" value="C">
                    <label class="form-check-label"><%= q.getOptionC() %></label>
                </div>

                <div class="form-check">
                    <input class="form-check-input" type="radio" name="q_<%= q.getId() %>" value="D">
                    <label class="form-check-label"><%= q.getOptionD() %></label>
                </div>
            </div>
        </div>

        <% 
            } // end for
        } // end else
        %>

        <div class="text-center mt-3">
            <button type="submit" class="btn btn-success btn-lg">
                Submit Quiz →
            </button>
        </div>

    </form>
</div>

<%@ include file="footer.jsp" %>

