<%-- 
    Document   : header
    Created on : 21 Nov 2025, 7:45:04 pm
    Author     : dharm
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz Platform</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">

        <a class="navbar-brand" href="#">Quiz Platform</a>

        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">

                <% 
                    String loggedRole = (String) session.getAttribute("role");
                    if (loggedRole != null) {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Logout</a>
                </li>
                <% } %>

            </ul>
        </div>

    </div>
</nav>

<div class="container mt-4">
