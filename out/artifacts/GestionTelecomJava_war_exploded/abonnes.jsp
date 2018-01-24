<%@ page import="cx.connection" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: mahmoud
  Date: 20/01/18
  Time: 01:38 م
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container-fluid" id="subs">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Subscribers  <button class="btn btn-info" data-toggle="modal" data-target="#addSub" style="border-radius: 50%;width: 50px; height: 50px;">+</button></h1>
            <% if(request.getAttribute("error_creationAbn") != null) { %>
            <div style="color:red;" ><%= request.getAttribute("error_creationAbn")%></div>
            <% } %>
            <% if(request.getAttribute("success_creationAbn") != null) { %>
            <div style="color:green;" ><%= request.getAttribute("success_creationAbn")%></div>
            <% } %>
            <table class="table table-bordered" border="1">
                <tr>
                    <td>Matricule</td>
                    <td>Last Name</td>
                    <td>First Name</td>
                    <td>Address</td>
                    <td>Email</td>
                </tr>
                <% connection c = new connection();
                    c.driver();
                    c.OpenConnexion();
                    ResultSet rs= c.selectExec("select * from abonne");

                    while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><form action="deleteAbn" method="post">
                        <input type="hidden" name="idAbn" value="<%=rs.getInt(1)%>">
                        <input type="submit" value="Delete" class="btn btn-danger">
                    </form></td>
                </tr>
                <%
                    }
                %>


            </table>

        </div>

    </div>
</div>
<div id="addSub" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add Subscriber</h4>
            </div>
            <div class="modal-body">
                <form action="createAbonne" method="post">
                    <table border="0" class="table">
                        <tr>
                            <td>Matricule</td>
                            <td><input type="text" name="matAbn">
                            </td>
                        </tr>
                        <tr>
                            <td>Last Name</td>
                            <td><input type="text" name="lname"></td>
                        </tr>
                        <tr>
                            <td>First Name</td>
                            <td><input type="text" name="fname"></td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><input type="text" name="add"></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="email"></td>
                        </tr>
                    </table>
                    <br>
                    <input type="submit" class="btn btn-info" name="cabn">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>



