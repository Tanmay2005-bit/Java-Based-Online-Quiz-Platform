<%-- 
    Document   : reports.jsp
    Created on : 22 Nov 2025, 1:57:52 pm
    Author     : dharm
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Platform - Reports</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-dark bg-dark">
        <a class="navbar-brand" href="admin-dashboard.jsp">Quiz Platform</a>
    </nav>
    <div class="container mt-5">
        <h2 class="mb-4">Performance Reports</h2>
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>#</th>
                    <th>User</th>
                    <th>Quiz</th>
                    <th>Score</th>
                    <th>Taken On</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="5" class="text-center">No reports yet.</td>
                </tr>
            </tbody>
        </table>
        <a href="admin-dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>
</body>
</html>
