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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <!--   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     -->  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        function dash() {
            window.location.href = "home#dashboard";
        }
    </script>

</head>
<body onload="dash()">

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
                <a href="login"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
            </li>

        </ul>

        <!-- Sidebar -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">

                <ul class="nav" id="side-menu">
                    <li>
                        <a href="#dashboard"><i class="fa fa-sitemap fa-fw"></i> Dashboard</a>

                    </li>
                    <li>
                        <a href="#"><i class="fa fa-user fa-fw"></i> Employees</a>

                    </li>
                    <li>
                        <a href="#"><i class="fa fa-users fa-fw"></i> Subscribers</a>

                    </li>
                    <li>
                        <a href="#"><i class="fa fa-legal fa-fw"></i> Contracts</a>

                    </li>
                    <li>
                        <a href="#"><i class="fa fa-heart fa-fw"></i> Services</a>

                    </li>
                    <li>
                        <a href="#"><i class="fa fa-phone fa-fw"></i> Lines</a>

                    </li>
                    <li>
                        <a href="#"><i class="fa fa-money fa-fw"></i> Bills</a>

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
                <h1 class="page-header">Bonjour <%= request.getSession(true).getAttribute("name")%></h1>

            </div>

        </div>
    </div>
</div>

</body>
</html>
