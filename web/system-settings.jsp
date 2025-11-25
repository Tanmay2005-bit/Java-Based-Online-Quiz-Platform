<%-- 
    Document   : system-settings.jsp
    Created on : 19 Nov 2025, 11:05:20 pm
    Author     : dharm
--%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>System Settings</title>
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" %>


<h2>System Settings</h2>

<form action="update-settings" method="post">
    <label>Platform Title:</label><br>
    <input type="text" name="platformName" placeholder="Quiz Platform"><br><br>

    <label>Allow Guest Users:</label>
    <select name="guest">
        <option value="YES">YES</option>
        <option value="NO">NO</option>
    </select><br><br>

    <button type="submit">Save Settings</button>
</form>
<%@ include file="footer.jsp" %>
</body>
</html>
