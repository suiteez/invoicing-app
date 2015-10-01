<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
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

        <!-- jQuery -->
        <script src="<c:url value='/resources/bower_components/jquery/dist/jquery.min.js' />" ></script>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="<c:url value='/resources/js/jautocomple.js' />"></script>

        <%-- <spring:url value="/resources/bootstrap.min.css" var="bootstrapCss" /> --%>
        <!--<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">-->
        <!--<link href="${bootstrapCss}" rel="stylesheet" />-->
        <style type="text/css">
            .tg {
                border-collapse: collapse;
                border-spacing: 0;
                border-color: #ccc;
            }

            .tg td {
                font-family: Arial, sans-serif;
                font-size: 14px;
                padding: 10px 5px;
                border-style: solid;
                border-width: 1px;
                overflow: hidden;
                word-break: normal;
                border-color: #ccc;
                color: #333;
                background-color: #fff;
            }

            .tg th {
                font-family: Arial, sans-serif;
                font-size: 14px;
                font-weight: normal;
                padding: 10px 5px;
                border-style: solid;
                border-width: 1px;
                overflow: hidden;
                word-break: normal;
                border-color: #ccc;
                color: #333;
                background-color: #f0f0f0;
            }

            .tg .tg-4eph {
                background-color: #f9f9f9
            }
        </style>
        <style>
            .product_Name-combobox {
                position: relative;
                display: inline-block;
            }
            .product_Name-combobox-toggle {
                position: absolute;
                top: 0;
                bottom: 0;
                margin-left: -1px;
                padding: 0;
            }
            .product_Name-combobox-input {
                margin: 0;
                padding: 5px 10px;
            }
        </style>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
         <script src="https://getbootstrap.com/2.3.2/assets/js/bootstrap-modal.js"></script> -->

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
                        <h1 class="page-header">Invoices</h1>
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

                    <div class="jumbotron"></div>

                    <div class="container">
                        <h3>Add an Invoice</h3>

                        <form action="/" method="POST" enctype="utf8" id="addInvoiceForm">
                            <table class="table table-striped">
                                <thead class="table table-striped">
                                    <tr>
                                        <th width="80">Product</th>
                                        <th width="120">Description</th>
                                        <th width="120">Quantity</th>
                                        <th width="60">Price</th>
                                        <th width="60">Tax</th>
                                        <th width="60">Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <!-- <div class="dropdown">
                                                    <button class="btn btn-primary dropdown-toggle" type="button"data-toggle="dropdown">
                                                            <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                            <li><a href="#">HTML</a></li>
                                                            <li><a href="#">CSS</a></li>
                                                            <li><a href="#">JavaScript</a></li>
                                                    </ul>
                                            </div> -->
                                            <form:select id="product_Name"  path="productName">
                                                <form:option value="NONE" label="Select Product"/>
                                                <form:options items="${productList}"/> 
                                                <form:option value="products">Add New Product</form:option>
                                            </form:select>
                                        </td>

                                        <td>
                                            <div>
                                                <span class="col-sm-8"><input class="form-control" name="description" value="" required /></span>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <span class="col-sm-5"><input class="form-control" name="quantity" value="" required /></span>
                                            </div>
                                        </td>

                                        <td>
                                            <div>
                                                <span class="col-sm-7"><input class="form-control" name="price" value="" required /></span>
                                            </div>
                                        </td>

                                        <td>
                                            <div>
                                                <span class="col-sm-7"><input class="form-control" name="tax" value="" required /></span>
                                            </div>
                                        </td>

                                        <td>
                                            <div>
                                                <span class="col-sm-7"><input class="form-control" name="amount" value="" required /></span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <a href="#" title="add-new-invoice" class="add-new-invoice">+ Add a line</a> 

                            <br>
                            <button type="submit" class="btn btn-primary">
                                <spring:message code="label.invoice.form.submit"></spring:message>
                            </button>
                        </form>
                        <br>

                        <button id="myBtn" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                            Launch demo modal
                        </button>


                        <!-- Modal -->
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                    </div>
                                    <div class="modal-body">
                                        ...
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>

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
            var counter = 1;
            jQuery('add-new-invoice')
            .click(
            function(event) {
                event.preventDefault();
                counter++;
                var newRow = jQuery('<tr><td><div class="dropdown"><button class="btn btn-primary dropdown-toggle" type="button"data-toggle="dropdown"><span class="caret"></span></button><ul class="dropdown-menu"><li><a href="#">HTML</a></li><li><a href="#">CSS</a></li><li><a href="#">JavaScript</a></li></ul></div>'
                    + counter +'</td><td><div><span class="col-sm-8"><input class="form-control" name="lastName" value="" required /></span></div>'
                    + counter +'</td></tr>');
                jQuery('table.table table-striped').append(newRow);
            });
		
            /* Submit Invoice */	

            $(document).ready(function () {
                $('form').submit(function(event) {
                    saveInvoice(event);
                });
            });


            function saveInvoice(event){
                event.preventDefault();
                var formData= $('form').serialize();
                $.post("<c:url value="/invoice/add"/>",formData ,function(data){
                    if(data.message == "success"){
                        window.location.href = "<c:url value="/invoice.html"></c:url>";
                    }
        
                })
                .fail(function(data) {
                });
            }

            /* Add New Product */
            /* document.getElementById("product_Name").onchange = function(){
        if(this.selectedIndex == 1){
                var updatedUrl = this.value;
                var url = window.location.href;
                var newText = url.replace(/(invoices).*?()/, updatedUrl);
                window.location.href = newText; 
        }
}; */

            document.getElementById("product_Name").onchange = function(){
                if(this.selectedIndex == 1){
                    $('#my-modal').modal('show')
		
                    var data = $(this).serializeObject();
                    json_data = JSON.stringify(data);
                    $("#results").text(json_data); 
                    $(".modal-body").text(json_data); 

                    // $("#results").text(data);

                    ev.preventDefault();
	
                }
            };

            //when DOM is ready
            $(document).ready(function () {

                // Attach Button click event listener 
                $("#myBtn").click(function(){

                    // show Modal
                    /* $('#myModal').modal('show'); */
                    $('#myModal').appendTo("body");
                });
                
                //initialize the jquery auto completer.
                $(function() {
                    patchAutocomplete();
                    $( "#product_Name" ).combobox();
                    //                    $( "#toggle" ).click(function() {
                    //                        $( "#combobox" ).toggle();
                    //                    });
                });
                
            });

            function patchAutocomplete() {

                // Don't really need to save the old fn, 
                //          // but I could chain if I wanted to
                //          var oldFn = $.ui.autocomplete.prototype._renderItem;
                //
                //          $.ui.autocomplete.prototype._renderItem = function( ul, item) {
                //              var re = new RegExp("^" + this.term, "i") ;
                //              var t = item.label.replace(re,"<span style='font-weight:bold;color:Blue;'>" + this.term + "</span>");
                //              return $( "<li></li>" )
                //                  .data( "item.autocomplete", item )
                //                  .append( "<a>" + t + "</a>" )
                //                  .appendTo( ul );
                //          };
          
                $.ui.autocomplete.prototype._renderMenu = function( ul, items ) {
                    var that = this;
                    $.each( items, function( index, item ) {
                        that._renderItemData( ul, item );
                    });
                    ul.append("<li><a href=# data-toggle='modal' data-target='#myModal'>Add Product</a></li>");
                    $( ul ).find( "li:odd" ).addClass( "odd" );
                };

            }

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
