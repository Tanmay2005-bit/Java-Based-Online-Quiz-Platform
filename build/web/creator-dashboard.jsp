<%-- 
    Document   : quiz-creator-dashboard.jsp
    Created on : 19 Nov 2025, 11:00:31 pm
    Author     : dharm
--%>

<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container mt-4">
    <h2 class="text-center mb-4">Quiz Creator Dashboard</h2>

    <div class="row">

        <!-- Create New Quiz -->
        <div class="col-md-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <h5 class="card-title">Create New Quiz</h5>
                    <p class="card-text">Start creating a new quiz with questions.</p>
                    <a href="create-quiz.jsp" class="btn btn-primary w-100">Create Quiz →</a>
                </div>
            </div>
        </div>

        <!-- Review Quiz Results -->
        <div class="col-md-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <h5 class="card-title">Review Quiz Results</h5>
                    <p class="card-text">View the performance of participants.</p>
                    <a href="quiz-results.jsp" class="btn btn-success w-100">View Results →</a>
                </div>
            </div>
        </div>

        <!-- Interact with Participants -->
        <div class="col-md-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <h5 class="card-title">Interact with Participants</h5>
                    <p class="card-text">Send messages or notifications.</p>
                    <a href="creator-messages.jsp" class="btn btn-warning w-100">Messages →</a>
                </div>
            </div>
        </div>

        <!-- Logout -->
        <div class="col-md-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body text-center">
                    <h5 class="card-title">Logout</h5>
                    <a href="LogoutServlet" class="btn btn-danger w-100">Logout</a>
                </div>
            </div>
        </div>

    </div>
</div>

<%@ include file="footer.jsp" %>
