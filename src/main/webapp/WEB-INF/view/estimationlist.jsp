<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
    <head>
        <!-- jQuery -->
        <script src="<c:url value='/resources/bower_components/jquery/dist/jquery.min.js' />" ></script>

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
        
        <!--boootstrap datpicker css-->
        <link href="<c:url value="/resources/css/bootstrap-datepicker.css" />" rel="stylesheet"/>
        <link href="<c:url value='/resources/css/jquery.dataTables.css'/>" rel="stylesheet">

        <title><spring:message code="label.pages.home.title"></spring:message></title>

        <!-- Bootstrap Core JavaScript -->
        <script src="<c:url value='/resources/bower_components/bootstrap/dist/js/bootstrap.min.js' />" ></script>
        <script src="<c:url value='/resources/bower_components/jquery-ui-1.11.4.custom/jquery-ui.js' />"></script>
        <script src="<c:url value='/resources/js/accounting.min.js' />" ></script>
        <!--<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>-->
        
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
                            <h1 class="page-header">Estimation</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <div class="row">
                        <!--	<nav class="navbar navbar-inverse navbar-fixed-top">
                                        <div class="container">
                                                <div class="navbar-header">
                                                        <a class="navbar-brand" href="/SpringMVCHibernate">BILLING
                                                                Application Inc</a>
                                                </div>
                                        </div>
                                </nav>-->

                        <!--<div class="jumbotron"></div>-->

                        <div class="container">
                            <button class="btn add-new-invoice btn-primary"><spring:message code="label.estimation.addestimate"></spring:message></button>
                            <h3>Estimation List</h3>
                            <c:if test="${param.message != null}">
                            <div class="alert alert-info">
                            ${param.message}
                            </div>
                            </c:if>
                            <span class="alert alert-danger col-sm-11" id="globalError" style="display:none"></span>
                            
                        <!-- Modal -->
                        <c:choose>
                            <c:when test="${!empty invoiceList}">
                                <h1>Customers</h1>
                                <table id="invoicetable" class="table table-striped" >
                                    <thead><tr>
                                        <th width="120">Date</th>
                                        <th width="80">Number</th>
                                        <th width="120">Customer</th>
                                        <th width="60">Amount</th>
                                        <th width="60">Status</th>
                                    </tr></thead>
                                    <c:forEach items="${invoiceList}" var="inv">
                                        <tr>
                                            <td>${inv.invoicedate}</td>
                                            <td>${inv.id}</td>
                                            <td>${inv.customer.name}</td>
                                            <td>${inv.total}</td>
                                            <td>status</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <h4>You Have no Estimation added</h4>
                            </c:otherwise>
                        </c:choose>

                        </div>

                </div>
                <!-- /.row -->

                <hr>
                <footer>
                    <p>&copy; MattSac.com 2015</p>
                </footer>
            </div>
        </div>

        <script type="text/javascript">
	
            /* Add New Line */
            var counter = 0;
            
		
            /* Submit Invoice */	

            $(document).ready(function () {

                //button click event
                jQuery('.add-new-invoice')
                .click(
                function(event) {
                    event.preventDefault();
                    window.location.href = "<c:url value="/estimation/add"></c:url>";
                });
                
//                table = $('#invoicetable').dataTable({
//                    //"sDom": "<'row'<'span8'l><'span8'f>r>t<'row'<'span8'i><'span8'p>>",
////                                    "sDom": 'lf<"pull-right">rtip<"DTTT_container">',
//                    "bJQueryUI": false,
//                    "bProcessing":true,
//                    "sPaginationType": "full_numbers"
//                });
                
                table = $('#invoicetable').dataTable({
                    "bLengthChange": true,
                    "bFilter": true,
                    "bInfo": true,
                    "sPaginationType": "full_numbers",
                    "bAutoWidth": true
                });
                
            });


            function getContextPath() {
               return "<c:out value="${pageContext.request.contextPath}" />";
            }

            </script>


            <!-- Metis Menu Plugin JavaScript -->
            <script src="<c:url value='/resources/bower_components/metisMenu/dist/metisMenu.min.js' />"></script>

        <!-- Custom Theme JavaScript -->
        <script src="<c:url value='/resources/js/sb-admin-2.js' />"></script>
        <script src="<c:url value='/resources/js/bootstrap-datepicker.js' />"></script>
        <script src="<c:url value='/resources/js/jquery.dataTables.js'/>"></script>


    </body>	
</html>
