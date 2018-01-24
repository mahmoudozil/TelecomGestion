<%@ page import="cx.connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.time.LocalDateTime" %><%--
  Created by IntelliJ IDEA.
  User: mahmoud
  Date: 20/01/18
  Time: 01:38 م
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container-fluid" id="bills">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Bills  <button class="btn btn-info" data-toggle="modal" data-target="#addFac" style="border-radius: 50%;width: 50px; height: 50px;">+</button></h1>
            <% if(request.getAttribute("error_creationf") != null){%>
            <div style="color:red;" ><%= request.getAttribute("error_creationf")%></div>
            <%}%>
            <% if(request.getAttribute("success_creationf") != null){%>
            <div style="color:green;" ><%= request.getAttribute("success_creationf")%></div>
            <%}%>
            <table class="table table-bordered" border="1">
                <tr>
                    <td>num Bill</td>
                    <td>num Line</td>
                    <td>Month</td>
                    <td>Year</td>
                    <td>NbrMinutes</td>
                    <td>DateLimitP</td>
                    <td>Total</td>
                    <td>Subscriber</td>
                    <td>Email</td>
                </tr>
                <% connection c = new connection();
                    c.driver();
                    c.OpenConnexion();
                    ResultSet rs= c.selectExec("select F.numFacture,F.numLigne,F.mois,F.annee,F.NbrU,F.DateLimitP,F.Total,A.lastName,A.firstName,A.email from facture F , abonne A, ligne L where L.matAbonne=A.matAbonne and L.numLigne=F.numLigne");
                    while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getInt(2)%></td>
                    <td><%=rs.getInt(3)%></td>
                    <td><%=rs.getInt(4)%></td>
                    <td><%=rs.getInt(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getFloat(7)%></td>
                    <td><%=rs.getString(8)%> <%=rs.getString(9)%></td>
                    <td><%=rs.getString(10)%></td>
                    <td><form action="sendMail" method="post">
                        <input type="hidden" name="mail" value="<%=rs.getString(10)%>">
                        <input type="hidden" name="objet" value="Facture de <%=rs.getInt(3)%> <%=rs.getInt(4)%>">
                        <input type="hidden" name="contenu" value="votre facture de la ligne <%=rs.getInt(2)%> est <%=rs.getFloat(7)%>. Veuillez payez votre facture avant le <%=rs.getString(6)%>">
                        <input type="submit" value="Send Mail" class="btn btn-primary">
                    </form></td>

                    <td id="alert">
                    <form action="sendMail" method="post">
                        <input type="hidden" name="mail" value="<%=rs.getString(10)%>">
                        <input type="hidden" name="objet" value="Alert de Paiement de la facture de <%=rs.getInt(3)%> <%=rs.getInt(4)%>">
                        <input type="hidden" name="contenu" value="votre facture de la ligne <%=rs.getInt(2)%> est <%=rs.getFloat(7)%>. vous avez dépasser la date limite">
                        <input type="submit" value="Alert" class="btn btn-danger">
                    </form>
                    </td>
                </tr>
                <%
                    }
                %>


            </table>

        </div>

    </div>
</div>
<div id="addFac" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add Bill</h4>
            </div>
            <div class="modal-body">
                <form action="createFacture" method="post">
                    <table border="0" class="table">
                        <tr>
                            <td>numBill</td>
                            <td><input type="text" name="numFac">
                            </td>
                        </tr>
                        <tr>
                            <td>numLine</td>
                            <td><select name="numLine">
                                <%ResultSet rs1= c.selectExec("select * from ligne");
                                while(rs1.next()){
                                %>
                                <option value="<%= rs1.getInt(1)%>"><%= rs1.getInt(1)%></option>
                                <%
                                    }
                                %>
                            </select>


                            </td>
                        </tr>
                        <%
                            LocalDateTime now = LocalDateTime.now();
                        %>
                        <tr>
                            <td>Month</td>
                            <td>
                               <input type="text" name="month" value="<%=now.getMonthValue()%>">
                                <input type="hidden" name="day" value="<%=now.getDayOfMonth()%>">
                            </td>
                        </tr>
                        <tr>
                            <td>Year</td>
                            <td>
                                <input type="text" name="year" value="<%=now.getYear()%>">
                            </td>
                        </tr>
                        <tr>
                            <td>NbrMinutes</td>
                            <td>
                                <input type="text" name="numU">
                            </td>
                        </tr>


                    </table>
                    <br>
                    <input type="submit" class="btn btn-info" name="cfac">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>




