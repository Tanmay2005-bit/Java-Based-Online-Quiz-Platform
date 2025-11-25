<%-- 
    Document   : approve-quiz
    Created on : 23 Nov 2025, 8:16:11 pm
    Author     : dharm
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">

    <h2 class="mb-4 text-center">Pending Quizzes for Approval</h2>

    <!-- Success / Error Alerts -->
    <%
        String success = request.getParameter("success");
        String error = request.getParameter("error");

        if ("1".equals(success)) {
    %>
        <div class="alert alert-success">Action completed successfully!</div>
    <% } else if ("1".equals(error)) { %>
        <div class="alert alert-danger">Something went wrong. Try again.</div>
    <% } %>

    <!-- Pending Quiz List -->
    <%
        java.util.List<?> quizzes = (java.util.List<?>) request.getAttribute("pendingQuizzes");

        if (quizzes == null || quizzes.isEmpty()) {
    %>

        <div class="alert alert-info text-center">
            No pending quizzes awaiting approval.
        </div>

    <% } else { %>

        <table class="table table-bordered table-striped mt-4">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th class="text-center">Actions</th>
                </tr>
            </thead>
            <tbody>

            <%
                for (Object obj : quizzes) {
                    controller.ApproveQuizzesServlet.Quiz q =
                        (controller.ApproveQuizzesServlet.Quiz) obj;
            %>

                <tr>
                    <td><%= q.id %></td>
                    <td><%= q.title %></td>
                    <td><%= q.description %></td>

                    <td class="text-center">
                        <!-- Approve -->
                        <form action="approveQuizzes" method="post" style="display:inline-block;">
                            <input type="hidden" name="quizId" value="<%= q.id %>">
                            <input type="hidden" name="action" value="approve">
                            <button class="btn btn-success btn-sm">Approve</button>
                        </form>

                        <!-- Reject -->
                        <form action="approveQuizzes" method="post" style="display:inline-block;">
                            <input type="hidden" name="quizId" value="<%= q.id %>">
                            <input type="hidden" name="action" value="reject">
                            <button class="btn btn-danger btn-sm">Reject</button>
                        </form>
                    </td>
                </tr>

            <% } %>

            </tbody>
        </table>
    <% } %>

</div>

<%@ include file="footer.jsp" %>
