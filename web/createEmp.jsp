<%--
  Created by IntelliJ IDEA.
  User: mahmoud
  Date: 20/01/18
  Time: 04:01 م
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="createEmp" method="post">
    <input type="text" placeholder="cin" name="cin">
    <input type="text" placeholder="name" name="name">
    <input type="text" placeholder="email" name="email">
    <input type="text" placeholder="pass" name="pass">
    <select name="role">
        <option>Admin</option>
        <option>EmployeService</option>
        <option>EmployeContrat</option>
    </select>
    <input type="submit" name="createEmp">
</form>
<div style="color:red;" ><%= request.getAttribute("error_creation")%></div>
<div style="color:green;" ><%= request.getAttribute("success_creation")%></div>

</body>
</html>
