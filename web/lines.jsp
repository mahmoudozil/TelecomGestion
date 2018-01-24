<%@ page import="cx.connection" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: mahmoud
  Date: 20/01/18
  Time: 01:38 م
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container-fluid" id="lines">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Lines  <button class="btn btn-info" data-toggle="modal" data-target="#addLine" style="border-radius: 50%;width: 50px; height: 50px;">+</button></h1>
            <% if(request.getAttribute("error_creationLine") != null) { %>
            <div style="color:red;" ><%= request.getAttribute("error_creationLine")%></div>
            <%}%>
            <% if(request.getAttribute("error_creationLine") != null) { %>
            <div style="color:green;" ><%= request.getAttribute("success_creationLine")%></div>
            <%}%>
            <% if(request.getAttribute("successMail") != null) { %>
            <div style="color:green;" ><%= request.getAttribute("successMail")%></div>
            <%}%>
            <table class="table table-bordered" border="1">
                <tr>
                    <td>numLine</td>
                    <td>Subscriber</td>
                    <td>Type</td>
                </tr>
                <% connection c = new connection();
                    c.driver();
                    c.OpenConnexion();
                    ResultSet rs= c.selectExec("select A.numLigne,B.lastName,B.firstName,A.type from ligne A , abonne B where A.matAbonne=B.matAbonne");
                    while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getString(2)%> <%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><form action="deleteLine" method="post">
                        <input type="hidden" name="idLine" value="<%=rs.getInt(1)%>">
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
<div id="addLine" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add Line</h4>
            </div>
            <div class="modal-body">
                <form action="createLine" method="post">
                    <table border="0" class="table">
                        <tr>
                            <td>numLine</td>
                            <td><input type="text" name="id">
                            </td>
                        </tr>
                        <tr>
                            <td>Subscriber</td>
                            <td>
                                <select name="idAbn">
                                    <%
                                    ResultSet rs1= c.selectExec("select * from abonne");
                                    while(rs1.next()){
                                    %>
                                    <option value="<%= rs1.getInt(1)%>"><%= rs1.getString(2)%> <%= rs1.getString(3)%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Type</td>
                            <td>
                                <select name="type" id="type">
                                    <option value="Fixe">Fixe</option>
                                    <option value="Mobile">Mobile</option>
                                </select>
                            </td>
                        </tr>
                        <tr id="localGeo">
                            <td>LocGeo</td>
                            <td>
                                <input type="text" name="locGeo">
                            </td>
                        </tr>
                        <tr id="typeMobile">
                            <td>typeMobile</td>
                            <td>
                                <select name="typeMobile">
                                    <option value="3G">3G</option>
                                    <option value="4G">4G</option>
                                </select>
                            </td>
                        </tr>
                        <tr id="Reseau">
                            <td>Reseau</td>
                            <td>
                                <input type="text" name="reseau">
                            </td>
                        </tr>
                        <tr id="Service">
                            <td>Service</td>
                            <td>
                                <input type="checkbox" name="Service" value="Internet">Internet
                                <input type="checkbox" name="Service" value="CommVocale">CommVocale

                            </td>
                        </tr>
                        <tr class="Internet" >
                            <td>Services Internet</td>
                            <td>
                                <select name="serviceInternet">
                                    <%
                                        ResultSet rs2= c.selectExec("select * from service where type like 'Internet'");
                                        while(rs2.next()){

                                    %>
                                    <option value="-1">Please Select</option>
                                    <option value="<%= rs2.getString(2)%>"><%= rs2.getString(2)%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr class="CommVocale">
                            <td>Services CommVocale</td>
                            <td>
                                <select name="serviceCommVocale">
                                    <%
                                        ResultSet rs3= c.selectExec("select * from service where type like 'Communication Vocale'");
                                        while(rs3.next()){

                                    %>
                                    <option value="-1">Please Select</option>
                                    <option value="<%= rs3.getString(2)%>"><%= rs3.getString(2)%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>

                    </table>
                    <br>
                    <input type="submit" class="btn btn-info" name="cline">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<script>

    $('#localGeo').show();
    $('#Reseau').hide();
    $('#typeMobile').hide();
    $('#Service').hide();
    $('.CommVocale').hide();
    $('.Internet').hide();

    $('#type').on('change', function() {
        if(this.value == "Fixe") {
            $('#localGeo').show();
            $('#Reseau').hide();
            $('#typeMobile').hide();
            $('#Service').hide();
            $('.CommVocale').hide();
            $('.Internet').hide();
        } else {
            $('#localGeo').hide();
            $('#Reseau').show();
            $('#typeMobile').show();
            $('#Service').show();
        }
    });
    $(document).ready(function(){
        $('input[type="checkbox"]').click(function(){
            var inputValue = $(this).attr("value");
            $("." + inputValue).toggle();
        });
    });

</script>




