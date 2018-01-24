<%@ page import="cx.connection" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: mahmoud
  Date: 20/01/18
  Time: 01:38 م
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container-fluid" id="services">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Services  <button class="btn btn-info" data-toggle="modal" data-target="#addSrv" style="border-radius: 50%;width: 50px; height: 50px;">+</button></h1>
            <% if(request.getAttribute("error_creationSrv") != null) { %>
            <div style="color:red;" ><%= request.getAttribute("error_creationSrv")%></div>
            <%}%>
            <% if(request.getAttribute("error_creationSrv") != null) { %>
            <div style="color:green;" ><%= request.getAttribute("success_creationSrv")%></div>
            <%}%>
            <table class="table table-bordered" border="1">
                <tr>
                    <td>num Service</td>
                    <td>Description</td>
                    <td>Cost</td>
                    <td>Type</td>
                </tr>
                <% connection c = new connection();
                    c.driver();
                    c.OpenConnexion();
                    ResultSet rs= c.selectExec("select * from service");
                    while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getFloat(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><form action="deleteService" method="post">
                        <input type="hidden" name="idService" value="<%=rs.getInt(1)%>">
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
<div id="addSrv" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add Service</h4>
            </div>
            <div class="modal-body">
                <form action="createSrv" method="post">
                    <table border="0" class="table">
                        <tr>
                            <td>id</td>
                            <td><input type="text" name="id">
                            </td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td><input type="text" name="des">
                            </td>
                        </tr>
                        <tr>
                            <td>Cost</td>
                            <td><input type="text" name="cost"></td>
                        </tr>
                        <tr>
                            <td>Type</td>
                            <td>
                                <select name="type" id="srv">
                                    <option id="1">Internet</option>
                                    <option id="2">Communication Vocale</option>
                                </select>
                            </td>
                        </tr>
                        <tr id="isp">
                            <td>ISP</td>
                            <td>
                                <input type="text" name="isp">
                            </td>
                        </tr>
                    </table>
                    <br>
                    <input type="submit" class="btn btn-info" name="csrv">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>
<script>
    $('#srv').on('change', function() {
        if(this.id == 1) {
            $('#isp').show();
        } else {
            $('#isp').hide();
        }
    });
</script>



