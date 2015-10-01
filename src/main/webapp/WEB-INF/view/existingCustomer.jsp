<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html lang="en">
    <head>
        <!-- Bootstrap Core CSS -->
        <link href="<c:url value="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css" />" rel="stylesheet"/>

        <!-- MetisMenu CSS -->
        <link href="<c:url value="/resources/bower_components/metisMenu/dist/metisMenu.min.css" />" rel="stylesheet"/>

        <!-- Timeline CSS -->
        <link href="<c:url value="/resources/css/timeline.css" />" rel="stylesheet"/>

        <!-- Custom CSS -->
        <link href="<c:url value="/resources/css/sb-admin-2.css" />" rel="stylesheet"/>

        <!-- Morris Charts CSS -->
        <link href="<c:url value="/resources/bower_components/morrisjs/morris.css" />" rel="stylesheet"/>

        <!-- Custom Fonts -->
        <link href="<c:url value="/resources/bower_components/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css"/>

        <title><spring:message code="label.pages.home.title"></spring:message></title>

        <spring:url value="/resources/hello.css" var="coreCss" />
        <link href="${coreCss}" rel="stylesheet" />
        <%--<spring:url value="/resources/bootstrap.min.css" var="bootstrapCss" />--%>
        <!--<link href="${bootstrapCss}" rel="stylesheet" />-->
        <style type="text/css">
            .tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
            .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
            .tg .tg-4eph{background-color:#f9f9f9}
        </style>
        <!-- jQuery -->
        <script src="<c:url value='/resources/bower_components/jquery/dist/jquery.min.js' />" ></script>
        <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>-->
    </head>

    <body>
        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="home.html"><spring:message code="label.pages.home.title"></spring:message></a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">
                    <!-- /.dropdown -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                            </li>
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="<c:url value="/changePassword.html" />"><spring:message code="message.changePassword"></spring:message></a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="<c:url value="/j_spring_security_logout" />"><spring:message code="label.pages.logout"></spring:message></a>
                                <!--<a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>-->
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->

                </ul>

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li>
                                <a href="<c:url value="/console.html" />">
                                    <i class="fa fa-dashboard fa-fw"></i>Dashboard</a>
                                <!--<a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>-->
                            </li>
                            <li>
                                <a href="<c:url value="/customers" />"><spring:message code="label.pages.customers"></spring:message></a>
                            </li>
                            <li>
                                <a href="<c:url value="/invoices" />"><spring:message code="label.customer.invoice"></spring:message></a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Customers</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <div class="row">
                    <!--
                    <nav class="navbar navbar-inverse navbar-fixed-top">
                            <div class="container">
                                    <div class="navbar-header">
                                            <a class="navbar-brand"href="<c:url value="/home.html" />"><spring:message code="label.pages.home.title"></spring:message></a>
                                    </div>
                            </div>
                    </nav>-->

                    <div class="jumbotron">
                    </div>

                    <div class="container">

                        <c:choose>
                            <c:when test="${!empty listCustomers}">
                                <h1>Customers</h1>
                                <table class="table table-striped">
                                    <tr>
                                        <th width="80">Customer ID</th>
                                        <th width="120">First Name</th>
                                        <th width="120">Last Name</th>
                                        <th width="60">Edit</th>
                                        <th width="60">Delete</th>
                                    </tr>
                                    <c:forEach items="${listCustomers}" var="customer">
                                        <tr>
                                            <td>${customer.id}</td>
                                            <td>${customer.firstName}</td>
                                            <td>${customer.lastName}</td>
                                            <td><a href="<c:url value='/edit/${customer.id}' />">Edit</a></td>
                                            <td><a href="<c:url value='/remove/${customer.id}' />">Delete</a></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <h4>You Have no customers added</h4>
                            </c:otherwise>
                        </c:choose>

                        <h3><button  class="btn btn-primary" id = "buttonLogin" onclick = "displayLoginBox()">Add Customer</button></h3>

                        <form action="/" method="POST" enctype="utf8" id="addCustomerForm">
                            <div class="form-group row" > 
                                <label class="col-sm-3"><spring:message code="label.user.firstName"></spring:message></label>
                                <span class="col-sm-5"><input class="form-control" name="firstName" value="" required/></span>
                                <span id="firstNameError" class="alert alert-danger col-sm-4" style="display:none"></span>

                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3"><spring:message code="label.user.lastName"></spring:message></label>
                                <span class="col-sm-5"><input class="form-control" name="lastName" value="" required/></span>
                                <span id="lastNameError" class="alert alert-danger col-sm-4" style="display:none"></span>

                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3"><spring:message code="label.user.email"></spring:message></label>
                                <span class="col-sm-5"><input type="email" class="form-control" name="email" value="" required/></span>                    
                                <span id="emailError" class="alert alert-danger col-sm-4" style="display:none"></span>

                            </div>
                            <br>
                            <button type="submit" class="btn btn-primary">
                                <spring:message code="label.customer.form.submit"></spring:message>
                            </button> 

                        </form>            

                        <br>
                    </div>
                </div>
                <!-- /.row -->

                        <hr>
                        <footer>
                            <p>&copy; MattSac.com 2015</p>
                        </footer>
            </div>
        </div>

        <!-- JAVA Script -->
        <script type="text/javascript">
            $(document).ready(function () {
                $('form').submit(function(event) {
                    addCustomer(event);
                });
            });

            function addCustomer(event){
                event.preventDefault();
        var formData= $('form').serialize        ();
                $.post("<c:url value="/customer/add"/>",formData ,function(data){
            if(data.message ==         "success"){
                        window.location.href = "<c:url value="/customer.html"></c:url>";
                    }
        
                })
                .fail(function(data) {
                });
            }

            /* Hide Customer Form */
            $('#buttonLogin').on('click', function(e){

                $("#addCustomerForm").toggle();
                $(this).toggleClass('class1')
            });

            </script>	


        <!-- Bootstrap Core JavaScript -->
        <script src="<c:url value='/resources/bower_components/bootstrap/dist/js/bootstrap.min.js' />" ></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="<c:url value='/resources/bower_components/metisMenu/dist/metisMenu.min.js' />"></script>

        <!--     Morris Charts JavaScript 
            <script src="<c:url value='/resources/bower_components/raphael/raphael-min.js' />"></script>
            <script src="<c:url value='/resources/bower_components/morrisjs/morris.min.js' />"></script>
            <script src="<c:url value='/resources/js/morris-data.js' />"></script>-->

        <!-- Custom Theme JavaScript -->
        <script src="<c:url value='/resources/js/sb-admin-2.js' />"></script>

    </body>
</html>
