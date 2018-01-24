<%@ page import="cx.connection" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: mahmoud
  Date: 20/01/18
  Time: 01:38 م
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <div class="container-fluid" id="employees">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Employees  <button class="btn btn-info" data-toggle="modal" data-target="#addEmp" style="border-radius: 50%;width: 50px; height: 50px;">+</button></h1>
                <% if(request.getAttribute("error_creationEmp") != null) { %>
                <div style="color:red;" ><%= request.getAttribute("error_creationEmp")%></div>
                <%}%>
                <% if(request.getAttribute("success_creationEmp") != null) { %>
                <div style="color:green;" ><%= request.getAttribute("success_creationEmp")%></div>
                <%}%>
                <table class="table table-bordered" border="1">
                    <tr>
                        <td>Cin</td>
                        <td>Name</td>
                        <td>Email</td>
                        <td>Role</td>
                    </tr>
                    <% connection c = new connection();
                        c.driver();
                        c.OpenConnexion();
                        ResultSet rs= c.selectExec("select * from employees");boolean test = false;

                            while(rs.next()){
                        %>
                    <tr>
                        <td><%=rs.getInt(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><form action="deleteEmp" method="post">
                            <input type="hidden" name="idEmp" value="<%=rs.getInt(1)%>">
                            <input type="submit" value="Delete" class="btn-danger btn">
                        </form></td>
                    </tr>
                     <%
                         }
                     %>


                </table>

            </div>

        </div>
    </div>
<div id="addEmp" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add Employee</h4>
            </div>
            <div class="modal-body">
                <form action="createEmp" method="post">
                    <table border="0" class="table">
                        <tr>
                            <td>Cin</td>
                            <td><input type="text" name="cin">
                            </td>
                        </tr>
                        <tr>
                            <td>Full Name</td>
                            <td><input type="text" name="name"></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="email"></td>
                        </tr>
                        <tr>
                        <td>Password</td>
                        <td><input type="text" name="pass"></td>
                        </tr>
                        <tr>
                            <td>Role</td>
                            <td>
                                <select name="role">
                                    <option>Admin</option>
                                    <option>EmployeService</option>
                                    <option>EmployeContrat</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <input type="submit" class="btn btn-info" name="cemp">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>



