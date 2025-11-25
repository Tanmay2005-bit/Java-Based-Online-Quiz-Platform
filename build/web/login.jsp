<%-- 
    Document   : login.jsp
    Created on : 19 Nov 2025, 10:54:34 pm
    Author     : dharm
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 90vh;">
    <div class="card shadow-lg p-4" style="width: 380px; border-radius: 12px;">

        <h3 class="text-center mb-4 text-primary">Login</h3>

        <% if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger text-center">
                Invalid email or password!
            </div>
        <% } %>

        <form action="LoginServlet" method="post">

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-primary w-100 mt-2">
                Login
            </button>
        </form>

        <p class="text-center mt-3" style="font-size: 14px;">
            Don't have an account? <a href="register.jsp">Register</a>
        </p>

    </div>
</div>

<%@ include file="footer.jsp" %>
