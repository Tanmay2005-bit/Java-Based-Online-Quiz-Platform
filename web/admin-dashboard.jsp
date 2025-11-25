<%-- 
    Document   : admin-dashboard.jsp
    Created on : 19 Nov 2025, 10:59:27 pm
    Author     : dharm
--%>

<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container mt-4">
    <h2 class="text-center mb-4">Admin Dashboard</h2>

    <div class="row">

        <!-- User Management -->
        <div class="col-md-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <h5 class="card-title">User Management</h5>
                    <p class="card-text">Add, view & delete users.</p>
                    <a href="manage-users.jsp" class="btn btn-primary w-100">Manage Users →</a>
                </div>
            </div>
        </div>

        <!-- Quiz Approvals -->
        <div class="col-md-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <h5 class="card-title">Quiz Approvals</h5>
                    <p class="card-text">Approve quizzes created by creators.</p>
                    <a href="approve-quizzes.jsp" class="btn btn-warning w-100">Approve Quizzes →</a>
                </div>
            </div>
        </div>

        <!-- System Settings -->
        <div class="col-md-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <h5 class="card-title">System Settings</h5>
                    <p class="card-text">Change system configuration.</p>
                    <a href="system-settings.jsp" class="btn btn-secondary w-100">Settings →</a>
                </div>
            </div>
        </div>

        <!-- Reports -->
        <div class="col-md-4">
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <h5 class="card-title">Performance Reports</h5>
                    <p class="card-text">View quiz performance and analytics.</p>
                    <a href="reports.jsp" class="btn btn-success w-100">View Reports →</a>
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
