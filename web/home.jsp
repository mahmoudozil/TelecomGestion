<%--
  Created by IntelliJ IDEA.
  User: mahmoud
  Date: 20/01/18
  Time: 01:38 م
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">



    <title>Telecom Dashboard</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/startmin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <style>
        .error
        {
            color: red;
        }
    </style>
    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="js/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/startmin.js"></script>

    <!--   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     -->  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</head>
<body >

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><i> <img style="height: 25px; width: 25px; border-radius: 50%" src="logo-tt.svg"></i> Telecom</a>
        </div>

        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>


        <ul class="nav navbar-right navbar-top-links">
            <li class="divider"></li>
            <li>
                <a href="logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
            </li>

        </ul>

        <!-- Sidebar -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">

                <ul class="nav" id="side-menu">
                    <li>
                        <a href="#dashboard" id="dashboard1"><i class="fa fa-sitemap fa-fw"></i> Dashboard</a>

                    </li>
                    <li>
                        <a href="#employees" id="employees1"><i class="fa fa-user fa-fw"></i> Employees</a>

                    </li>
                    <li>
                        <a href="#subs" id="subs1"><i class="fa fa-users fa-fw"></i> Subscribers</a>

                    </li>
                    <li>
                        <a href="#services" id="services1"><i class="fa fa-heart fa-fw"></i> Services</a>

                    </li>
                    <li>
                        <a href="#lines" id="lines1"><i class="fa fa-phone fa-fw"></i> Lines</a>

                    </li>
                    <li>
                        <a href="#bills" id="bills1"><i class="fa fa-money fa-fw"></i> Bills</a>

                    </li>
                </ul>

            </div>
        </div>
    </nav>

</div>
<div id="page-wrapper">
    <div class="container-fluid" id="dashboard">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Good Morning <%= request.getSession(true).getAttribute("name")%></h1>

            </div>

        </div>
    </div>

    <jsp:include page="afficheEmp.jsp" ></jsp:include>
    <jsp:include page="services.jsp" ></jsp:include>
    <jsp:include page="abonnes.jsp" ></jsp:include>
    <jsp:include page="lines.jsp" ></jsp:include>
    <jsp:include page="factures.jsp" ></jsp:include>




</div>
<script>

    if((<%=request.getAttribute("perm")%>)==2) //services
    {
        $("#employees1").hide();
        $("#services1").show();
        $("#lines1").hide();
        $("#subs1").hide();
        $("#bills1").show();
        $("#dashboard1").show();
    }
    else if((<%=request.getAttribute("perm")%>)==3) //contracts
    {
        $("#employees1").hide();
        $("#services1").hide();
        $("#lines1").show();
        $("#subs1").show();
        $("#bills1").hide();
        $("#dashboard1").show();
    }
    else
    {
        $("#employees1").show();
        $("#services1").show();
        $("#lines1").show();
        $("#subs1").show();
        $("#bills1").show();
        $("#dashboard1").show();
    }


    if((<%=request.getAttribute("pageToShow")%>)==1)
    {
        $("#employees").show();
        $("#services").hide();
        $("#lines").hide();
        $("#subs").hide();
        $("#bills").hide();
        $("#dashboard").hide();
    }
    if((<%=request.getAttribute("pageToShow")%>)==2)
    {
        $("#employees").hide();
        $("#services").hide();
        $("#lines").hide();
        $("#subs").show();
        $("#bills").hide();
        $("#dashboard").hide();
    }
    if((<%=request.getAttribute("pageToShow")%>)==3)
    {
        $("#employees").hide();
        $("#services").show();
        $("#lines").hide();
        $("#subs").hide();
        $("#bills").hide();
        $("#dashboard").hide();
    }

    if((<%=request.getAttribute("pageToShow")%>)==4)
    {
        $("#employees").hide();
        $("#services").hide();
        $("#lines").show();
        $("#subs").hide();
        $("#bills").hide();
        $("#dashboard").hide();
    }

    if((<%=request.getAttribute("pageToShow")%>)==5)
    {
        $("#employees").hide();
        $("#services").hide();
        $("#lines").hide();
        $("#subs").hide();
        $("#bills").show();
        $("#dashboard").hide();
    }


    if(window.location.href.includes("http://localhost:8080/login?"))
    {

        window.location.href = "http://localhost:8080/home#dashboard";


    }
    if(window.location.href == "http://localhost:8080/home#dashboard")
    {
        $("#employees").hide();
        $("#services").hide();
        $("#lines").hide();
        $("#subs").hide();
        $("#bills").hide();
        $("#dashboard").show();

    }

    $("#dashboard1").click(function(){
        $("#employees").hide();
        $("#services").hide();
        $("#lines").hide();
        $("#subs").hide();
        $("#bills").hide();
        $("#dashboard").show();
    });

    $("#employees1").click(function(){
        $("#employees").show();
        $("#services").hide();
        $("#lines").hide();
        $("#subs").hide();
        $("#bills").hide();
        $("#dashboard").hide();
    });

    $("#services1").click(function(){
        $("#employees").hide();
        $("#services").show();
        $("#lines").hide();
        $("#subs").hide();
        $("#bills").hide();
        $("#dashboard").hide();
    });

    $("#lines1").click(function(){
        $("#employees").hide();
        $("#services").hide();
        $("#lines").show();
        $("#subs").hide();
        $("#bills").hide();
        $("#dashboard").hide();
    });

    $("#subs1").click(function(){
        $("#employees").hide();
        $("#services").hide();
        $("#lines").hide();
        $("#subs").show();
        $("#bills").hide();
        $("#dashboard").hide();
    });

    $("#bills1").click(function(){
        $("#employees").hide();
        $("#services").hide();
        $("#lines").hide();
        $("#subs").hide();
        $("#bills").show();
        $("#dashboard").hide();
    });

</script>
</body>
</html>
