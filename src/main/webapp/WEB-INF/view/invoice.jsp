<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html lang="en">
    <head>
        <link href="<c:url value="/resources/css/invoices.css" />" rel="stylesheet"/>
        <!-- jQuery -->
        <script src="<c:url value='/resources/bower_components/jquery/dist/jquery.min.js' />" ></script>

        <!--<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">-->
        <link rel="stylesheet" href="<c:url value='/resources/bower_components/jquery-ui-1.11.4.custom/jquery-ui.css' />"/>

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

        <title><spring:message code="label.pages.home.title"></spring:message></title>

        <spring:url value="/resources/hello.css" var="coreCss" />
        <link href="${coreCss}" rel="stylesheet" />

        <!-- Bootstrap Core JavaScript -->
        <script src="<c:url value='/resources/bower_components/bootstrap/dist/js/bootstrap.min.js' />" ></script>
        <script src="<c:url value='/resources/bower_components/jquery-ui-1.11.4.custom/jquery-ui.js' />"></script>
        <script src="<c:url value='/resources/js/accounting.min.js' />" ></script>
        <!--<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>-->
        <style>
            
.custom-combobox {
    position: relative;
    display: inline-block;
}
.custom-combobox-toggle {
    position: absolute;
    top: 0;
    bottom: 0;
    margin-left: -1px;
    padding: 0;
}
.custom-combobox-input {
    margin: 0;
    padding: 5px 10px;

}
.ui-autocomplete {
    z-index: 10000;
}
        </style>
        
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

                        <!--<div class="jumbotron"></div>-->

                        <div class="container">
                            <h3>Add an Invoice</h3>
                            <c:if test="${param.message != null}">
                            <div class="alert alert-info">
                            ${param.message}
                            </div>
                            </c:if>
                            <span class="alert alert-danger col-sm-11" id="globalError" style="display:none"></span>
                            <form action="/" method="POST" class="" enctype="utf8" id="addInvoiceForm" >
                                <input type="hidden" name="status" id="status" value="0"/>
                                <div class="form-group control-group ">
                                    <label class="col-sm-2"><spring:message code="label.invoice.invoicedate"></spring:message></label>
                                    <span class="col-sm-2"><input class="form-control datepicker" type="text" id="invoicedate" name="invoicedate" placeholder="MM/dd/yyyy" value="" required/></span>
                                    <span id="invoicedateError" class="alert alert-danger col-sm-2" style="display:none"></span>
                                </div>
                                <div class="form-group control-group ">
                                    <label class="col-sm-1"><spring:message code="label.invoice.duedate"></spring:message></label>
                                    <span class="col-sm-2"><input class="form-control datepicker" type="text" id="duedate" name="duedate" value="" placeholder="MM/dd/yyyy"  required/></span>
                                    <span id="duedateError" class="alert alert-danger col-sm-2" style="display:none"></span>
                                </div>
                                <div class="form-group control-group col-lg-12"></div>
                                <div class="form-group control-group ">
                                    <label class="col-sm-2"><spring:message code="label.invoice.customer"></spring:message></label>
                                    <span class="col-sm-3">
                                        <select id="customer"  name="customer" class="form-control combobox autocomplete" placeholder="start typing a Customer Name" >
                                            <c:forEach items="${customerList}" var="cust" varStatus="loop">
                                                <option value="${cust.name}">${cust.name}</option>
                                            </c:forEach>
                                        </select>
                                    </span>
                                    <span id="customerError" class="alert alert-danger col-sm-2" style="display:none"></span>
                                </div>
                                
                                <div class="form-group control-group col-sm-12 product-table">
                                    <span id="invdetailListError" class="alert alert-danger col-sm-2" style="display:none"></span>
                                    <div class="table-header">
                                        <div class="col-sm-3"><spring:message code="label.invoice.product"></spring:message></div>
                                        <div class="col-sm-3"><spring:message code="label.invoice.description"></spring:message></div>
                                        <div class="col-sm-1"><spring:message code="label.invoice.quantity"></spring:message></div>
                                        <div class="col-sm-1"><spring:message code="label.invoice.price"></spring:message></div>
                                        <div class="col-sm-1"><spring:message code="label.invoice.tax"></spring:message></div>
                                        <div class="col-sm-1" style="width:11%"><spring:message code="label.invoice.amount"></spring:message></div>
                                        <div class="col-sm-1" style="width:4%"></div>
                                    </div>
                                    <div class="table-row row0" data-id="0">
                                        <div class="col-sm-3">
                                            <p><select id="product_Name"  name="invdetailList[0].product" class="form-control autocomplete" placeholder="start typing a product name" >
                                                    <c:forEach items="${productName}" var="prod" varStatus="loop">
                                                        <option value="${prod}">${prod}</option>
                                                    </c:forEach>
                                                </select></p>
                                        </div>
                                        <div class="col-sm-3"><input class="form-control description0" name="invdetailList[0].description" id="description" value="" required placeholder="Describe your product or service" />
                                        </div>
                                        <div class="col-sm-1"><input class="form-control quantity0" name="invdetailList[0].quantity" id="quantity" value="" required placeholder="Qty" /></div>
                                        <div class="col-sm-1"><input class="form-control price0" name="invdetailList[0].price" id="price" value="" required placeholder="Price" /></div>
                                        <div class="col-sm-1"><input class="form-control tax0" name="invdetailList[0].tax" id="tax" value="" required placeholder="%" /></div>
                                        <div class="col-sm-1" style="width:11%"><input type="hidden" class="form-control amount0 amountfield" readonly name="invdetailList[0].amount" id="amount" value="" />
                                            <input type="text" class="form-control amountlabel0" disabled="" id="amountlabel" value="" required />
                                        </div>
                                        <div class="col-sm-1" style="width:4%"><a href="javascript:void(0)" class="remove-item pull-right " style="display: none;font-size: 24px;color: red" onclick="removeRow('0')">×</a></div>
                                    </div>
                                </div>
                                    
                                <div class="form-group control-group col-sm-12">
                                        <a href="#" title="add-new-invoice" class="add-new-invoice">+ Add new Product</a> 
                                </div>
                                <div class="form-group control-group ">
                                    <label class="col-sm-1"><spring:message code="label.invoice.totalprice"></spring:message></label>
                                <span class="col-sm-2"><input type="hidden" id="subtotal" name="subtotal" value="" />
                                <input class="form-control " type="text" id="subtotallabel" name="subtotallabel" value="" disabled=""/></span>
                                    <span id="subtotalError" class="alert alert-danger col-sm-2" style="display:none"></span>
                                </div>
                                <div class="form-group control-group ">
                                    <label class="col-sm-1"><spring:message code="label.invoice.totaltax"></spring:message></label>
                                    <span class="col-sm-2"><input type="hidden" id="totaltax" name="tax" value="" />
                                    <input class="form-control " type="text" id="totaltaxlabel" name="taxlabel" value="" disabled=""/></span>
                                    <span id="taxError" class="alert alert-danger col-sm-2" style="display:none"></span>
                                </div>
                                <div class="form-group control-group ">
                                    <label class="col-sm-1"><spring:message code="label.invoice.totalamount"></spring:message></label>
                                    <span class="col-sm-2"><input type="hidden" id="totalamount" name="total" value="" />
                                        <input class="form-control " type="text" id="totalamountlabel" name="totallabel" value="" disabled=""/></span>
                                    <span id="amountError" class="alert alert-danger col-sm-2" style="display:none"></span>
                                </div>
                                    
                                <div class="form-group control-group col-sm-12">
                                    <br><button class="btn btn-danger" type="reset">Reset</button>
                                    <button class="btn btn-primary" type="submit" id="savedraft">
                                        <spring:message code="label.invoice.form.draft"></spring:message>
                                    </button>
                                    <button type="submit" class="btn btn-primary">
                                    <spring:message code="label.invoice.form.submit"></spring:message>
                                    </button>

                                </div>
                        </form>
                        <br>


                        <!-- Modal -->
                        <div class="modal fade" id="customermodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <form id="customerform" class="customerform" method="post" role="">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel"><spring:message code="label.customer.modaltitle"></spring:message></h4>
                                            <span class="alert alert-danger " id="modalError" style="display:none"></span>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group control-group col-sm-13">
                                                <label class="col-sm-3"><spring:message code="label.customer.name"></spring:message></label>
                                                <span class="col-sm-8"><input class="form-control " type="text" id="name" name="name" value="" autofocus/></span>
                                                <span id="nameError" class="alert alert-danger col-sm-3" style="display:none"></span>
                                            </div>
                                            <div class="col-sm-13">
                                                <div class="form-group control-group ">
                                                    <label class="col-sm-3"><spring:message code="label.customer.fname"></spring:message></label>
                                                    <span class="col-sm-3"><input class="form-control " type="text" id="firstName" name="firstName" value="" /></span>
                                                    <span id="firstNameError" class="alert alert-danger col-sm-3" style="display:none"></span>
                                                </div>
                                                <div class="form-group control-group ">
                                                    <label class="col-sm-3"><spring:message code="label.customer.lname"></spring:message></label>
                                                    <span class="col-sm-3"><input class="form-control " type="text" id="lastName" name="lastName" value="" /></span>
                                                    <span id="lastNameError" class="alert alert-danger col-sm-3" style="display:none"></span>
                                                </div>
                                            </div>
                                            <div class="form-group control-group col-sm-13">
                                                <label class="col-sm-3"><spring:message code="label.customer.email"></spring:message></label>
                                                <span class="col-sm-8"><input class="form-control " type="text" id="email" name="email" value="" /></span>
                                                <span id="emailError" class="alert alert-danger col-sm-3" style="display:none"></span>
                                            </div>
                                            <div class="form-group control-group col-sm-13">
                                                <label class="col-sm-3" style="margin:-1px"><spring:message code="label.customer.streetAddress"></spring:message></label>
                                                <span class="col-sm-8" style="margin-left:1px"><input class="form-control " type="text" id="streetAddress" name="streetAddress" value="" /></span>
                                                <span id="streetAddressError" class="alert alert-danger col-sm-3" style="display:none"></span>
                                            </div>
                                            <div class="col-sm-13">
                                                <div class="form-group control-group ">
                                                    <label class="col-sm-3"><spring:message code="label.customer.city"></spring:message></label>
                                                    <span class="col-sm-3"><input class="form-control " type="text" id="city" name="city" value="" /></span>
                                                    <span id="cityError" class="alert alert-danger col-sm-3" style="display:none"></span>
                                                </div>
                                                <div class="form-group control-group ">
                                                    <label class="col-sm-3"><spring:message code="label.customer.zip"></spring:message></label>
                                                    <span class="col-sm-3"><input class="form-control " type="text" id="zip" name="zip" value="" /></span>
                                                    <span id="zipError" class="alert alert-danger col-sm-3" style="display:none"></span>
                                                </div>
                                            </div>
                                            <div class="col-sm-13">
                                                <div class="form-group control-group ">
                                                    <label class="col-sm-3"><spring:message code="label.customer.country"></spring:message></label>
                                                    <span class="col-sm-3"><input class="form-control " type="text" id="country" name="country" value="" /></span>
                                                    <span id="countryError" class="alert alert-danger col-sm-3" style="display:none"></span>
                                                </div>
                                                <div class="form-group control-group ">
                                                    <label class="col-sm-3"><spring:message code="label.customer.state"></spring:message></label>
                                                    <span class="col-sm-3"><input class="form-control " type="text" id="state" name="state" value="" /></span>
                                                    <span id="stateError" class="alert alert-danger col-sm-3" style="display:none"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer col-sm-9">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="submit" id="customersavebtn" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
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
            var counter = 0;
            
		
            /* Submit Invoice */	

            $(document).ready(function () {
                $('#addInvoiceForm').submit(function(event) {
                    saveInvoice(event);
                });
                
                $('#customerform').submit(function(event){
                    saveCustomer(event);
                });
                
                //draft listener...
                $("#savedraft").click(function (event){
//                    event.preventDefault();
                    //save as draft status==1;
                    $("#status").val("1");
//                    $('#addInvoiceForm').submit();
                    return true;
                });
                //button click event
                jQuery('.add-new-invoice')
                .click(
                function(event) {
                    event.preventDefault();
                    counter++;
                    var $tr    = $('.table-row:first');
                    var $clone = $tr.clone();
                    
                    $(".row"+(counter-1)).find("a.remove-item").show();
                    
                    rowid=$clone.attr('data-id');
                    //init the text fields...
                    $clone.find(':text').val('');
                    $clone.find('select').prop('selectedIndex',-1);
                    //remove the autocomplete of first row...
                    $clone.find('.custom-combobox').remove();
                    //set the id of the select field...
                    $clone.find('select').attr('id','product_Name'+counter);
                    $clone.find('input[id="description"]').removeClass('description'+rowid).addClass('description'+counter);
                    $clone.find('input[id="quantity"]').removeClass('quantity'+rowid).addClass('quantity'+counter);
                    $clone.find('input[id="price"]').removeClass('price'+rowid).addClass('price'+counter);
                    $clone.find('input[id="tax"]').removeClass('tax'+rowid).addClass('tax'+counter);
                    $clone.find('input[id="amount"]').removeClass('amount'+rowid).addClass('amount'+counter);
                    $clone.find('input[id="amountlabel"]').removeClass('amountlabel'+rowid).addClass('amountlabel'+counter);
                    $clone.removeClass('row'+rowid).addClass('row'+counter);
                    $clone.attr('data-id',counter);

                    //change the name of the new compnents...
                    $clone.find('select').attr('name','invdetailList['+counter+'].product');
                    $clone.find('input[id="description"]').attr('name','invdetailList['+counter+'].description');
                    $clone.find('input[id="quantity"]').attr('name','invdetailList['+counter+'].quantity');
                    $clone.find('input[id="price"]').attr('name','invdetailList['+counter+'].price');
                    $clone.find('input[id="tax"]').attr('name','invdetailList['+counter+'].tax');
                    $clone.find('input[id="amount"]').attr('name','invdetailList['+counter+'].amount');
                    $clone.find("a.remove-item").attr("onclick","removeRow('"+counter+"')");
                    $clone.find("a.remove-item").hide();
                    
                    //append the row to the table...
                    $(".product-table").append($clone);
                    
                    //$clone.find('select').autocomplete( "destroy" );
                    
                    //create the auto completer for this row...
                    initAutocomp($('#product_Name'+counter));
                    initListners(counter);
               });
            });


            function saveInvoice(event){
                event.preventDefault();
                renameFields();
                var formData= $('#addInvoiceForm').serialize();
                
                $.post("<c:url value="/invoice/add"/>",formData ,function(data){
                    $("#status").val("0");
                    if(data.message == "success"){
                        window.location.href = "<c:url value="/invoices/add"></c:url>"+ "?message=" + data.message;
                    }
                })
                .fail(function(data) {
                    $("#status").val("0");
//                    var errors = $.parseJSON(data.responseJSON.message);
                    $("#globalError").show().append(data.responseJSON.error+"<br>");
                    $.each( data.responseJSON.message, function( index,item ){
                        $("#"+item.field+"Error").show().html(item.defaultMessage);
                    });
//                    errors = $.parseJSON(data.responseJSON.error);
                    $.each( data.responseJSON.error, function( index,item ){
                        $("#globalError").show().append(item.defaultMessage+"<br>");
                    });
                });
            }

            function saveCustomer(event){
                event.preventDefault();
                var formData= $('#customerform').serialize();
                $.post("<c:url value="/customer/addajax"/>",formData ,function(data){
                    if(data.message == "success"){
                        console.log("Customer added..."+data);
                        if(data.message && data.message=="success"){
                            $("#customer").append("<option selected >"+data.customobj.name+"</option>").val(data.customobj.name);
                            $('#customermodal').modal('hide')
                            console.log("Customer added.");
                        }else{
                            console.log("Customer not added."+data);
                            $("#modalError").show().append(item.defaultMessage+"<br>");
                        }
                    }
                })
                .fail(function(data) {
                    console.log("Customer not added..."+data);
                    $("#modalError").show().append(data.responseJSON.error+"<br>");
                });
            }

            function renameFields(){
                var $tr    = $('.table-row');
                var index=0;
                $tr.each(function(){
                    row = $(this);
                    row.find('select').attr('name','invdetailList['+index+'].product');
                    row.find('input[id="description"]').attr('name','invdetailList['+index+'].description');
                    row.find('input[id="quantity"]').attr('name','invdetailList['+index+'].quantity');
                    row.find('input[id="price"]').attr('name','invdetailList['+index+'].price');
                    row.find('input[id="tax"]').attr('name','invdetailList['+index+'].tax');
                    row.find('input[id="amount"]').attr('name','invdetailList['+index+'].amount');
                    index++;
                    
                });
            }
            function getContextPath() {
               return "<c:out value="${pageContext.request.contextPath}" />";
            }

            </script>


            <!-- invoice script  --> 
            <script src="<c:url value='/resources/js/jautocomplete.js' />"></script>
            <script src="<c:url value='/resources/js/invoice.js' />"></script>
            <!-- Metis Menu Plugin JavaScript -->
            <script src="<c:url value='/resources/bower_components/metisMenu/dist/metisMenu.min.js' />"></script>

        <!--     Morris Charts JavaScript 
            <script src="<c:url value='/resources/bower_components/raphael/raphael-min.js' />"></script>
            <script src="<c:url value='/resources/bower_components/morrisjs/morris.min.js' />"></script>
            <script src="<c:url value='/resources/js/morris-data.js' />"></script>-->

        <!-- Custom Theme JavaScript -->
        <script src="<c:url value='/resources/js/sb-admin-2.js' />"></script>
        <script src="<c:url value='/resources/js/bootstrap-datepicker.js' />"></script>


    </body>	
</html>
