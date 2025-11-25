<%-- 
    Document   : submit-quiz.jsp
    Created on : 20 Nov 2025, 10:12:32 am
    Author     : dharm
--%>

<%@ page import="dao.QuestionDAO, dao.ResultDAO, model.Question, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>


<html>
<head>
    <title>Quiz Result</title>
</head>
<body>

<%
    int quizId = Integer.parseInt(request.getParameter("quizId"));
    int participantId = 1;  // TEMP – until login system ready

    QuestionDAO qdao = new QuestionDAO();
    List<Question> qList = qdao.getQuestionsByQuizId(quizId);

    int score = 0;

    for (Question q : qList) {
        String selected = request.getParameter("q" + q.getId());
       if (selected != null && selected.equalsIgnoreCase(String.valueOf(q.getCorrectOption()))) {
    score++;
}

    }

    ResultDAO rdao = new ResultDAO();
    rdao.saveResult(participantId, quizId, score);
%>

<h2>Your Score: <%= score %></h2>
<a href="participant-home.jsp">Go Back</a>
<%@ include file="footer.jsp" %>
</body>
</html>
