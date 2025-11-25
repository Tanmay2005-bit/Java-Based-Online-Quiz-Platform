<%-- 
    Document   : creator-messages.jsp
    Created on : 20 Nov 2025, 10:06:05 am
    Author     : dharm
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Messages</title>
    <style>
        body { font-family: Arial; padding:20px; }
        textarea, input { width:100%; margin:10px 0; padding:10px; }
        button { background:orange; padding:10px; border:none; color:white; }
    </style>
</head>
<body>

<h2>Participant Messages</h2>

<form action="sendMessage" method="post">
    <textarea name="message" rows="3" placeholder="Write your reply..." required></textarea>
    <button type="submit">Send</button>
</form>
<%@ include file="footer.jsp" %>
</body>
</html>
