/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


var ADDLABEL="Add Product";
//when DOM is ready
$(document).ready(function () {

    // Attach Button click event listener 
    $("#myBtn").click(function(){

        // show Modal
        /* $('#myModal').modal('show'); */
        $('#myModal').appendTo("body");
    });
    
    patchAutocomplete();
    //initialize the jquery auto completer.
    initAutocomp($( "#product_Name" ));
    
    //init auto complete for customer...
    initAutocomp($("#customer"));
    //add events for text fields...
    initListners(0);
    
    var invdate = $('#invoicedate').datepicker().on('changeDate', function(ev) {
        $('#invoicedate').datepicker('hide');
    });
    var duedate = $('#duedate').datepicker().on('changeDate', function(ev) {
        $('#duedate').datepicker('hide');
    });
    

});

//init listeners for the text fileds...
function initListners(rowno){
    //    $("#description[]")[rowno].change(function(){
    //        
    //    });
    calc = function(){
        var qty = $(".quantity"+rowno).val()?$(".quantity"+rowno).val():0;
        var price = $(".price"+rowno).val()?$(".price"+rowno).val():0;
        var tax = $(".tax"+rowno).val()?$(".tax"+rowno).val():0;
        
        var total = qty*price;
        var taxamount = total * tax/100;
        var amount = total-taxamount;
        $(".amount"+rowno).val(amount);
        
        calctotal();
    };
    $(".quantity"+rowno).change(calc);
    $(".price"+rowno).change(calc);
    $(".tax"+rowno).change(calc);
    
}

function calctotal(){
    var count=0;
    var totalprice = 0;
    var totaltaxamount = 0;
    var totalamount = 0;
    while($(".amount"+count) && $(".amount"+count).val() && 
            $(".amount"+count).val()>="0"){
        var qty = $(".quantity"+count).val()?$(".quantity"+count).val():0;
        var price = $(".price"+count).val()?$(".price"+count).val():0;
        totalprice = totalprice + (qty*price);
        totaltaxamount += ((qty*price)*parseFloat($(".tax"+count).val()?$(".tax"+count).val():0)/100);
        totalamount += parseFloat($(".amount"+count).val());
        count++;
    }
    $("#subtotal").val(totalprice);
    $("#totalamount").val(totalamount);
    $("#totaltax").val(totaltaxamount);
}
function initAutocomp(element){
    $(function() {
        instance = element.combobox();
    });
}


//filter override method...
function autocompserach(oEvent, oUi) {
    // get current input value
    var sValue = $(oEvent.target).val();
    // init new search array
    var aSearch = [];
    // for each element in the main array ...
    $("#"+oEvent.target.id+" > option ").each(function() {
        //    $("#"+$(oEvent.target).attr("id")).find("option").each(function() {
        // ... if element starts with input value ...
        if ((this.text.substr(0, sValue.length) == sValue) || sValue=="") {
            // ... add element
            aSearch.push({
                label:this.text,
                value:this.value,
                option:this
                });
        //                        aSearch.push(this.text);
        }
    });
                
    if(aSearch.length==0 && sValue!=""){
        if(oEvent.target.id=='customer'){
            aSearch.push({
                label:"Add \""+sValue+"\" as a Customer",
                value:sValue,
                product:-1
            });
        }else{
            aSearch.push({
                label:"Add \""+sValue+"\" as a Product",
                value:sValue,
                product:-1
            });
        }
    }
    // change search array
    $(this).autocomplete('option', 'source', aSearch);
}


function patchAutocomplete() {

    $.ui.autocomplete.prototype._renderItem = function( ul, item) {
                return $( "<li values="+item.value+" ></li>" )
                .text(item.label)
                .appendTo( ul );
    };
          
}

//override the method everywhere...
//Add product function on click
function clickAdd(ev,product){
    console.log("add clicked..."+product);
    if(ev.target.id=='customer'){
        
        $( "#customermodal" ).modal( "show" );
//        $.post(getContextPath()+"/customer/addajax",
//        {
//            name: product
//        },
//        function(data){
//            if(data.message && data.message=="success"){
//                $("#customer").append("<option selected >"+product+"</option>").val(data.customobj.id);
//                console.log("Customer added.");
//            }else{
//                console.log("Customer not added."+data);
//            }
//        })
//        .fail(function(data) {
//            $("#errormsg").show().html(data.responseJSON.message);
//        });
        
    }else{
        $.post(getContextPath()+"/product/addajax",
        {
            productName: product
        },
        function(data){
            if(data.message && data.message=="success"){
                $("#"+ev.target.id).append("<option selected>"+product+"</option>").val(product);
                console.log("Product added.");
            }else{
                console.log("product not added."+data);
            }
        })
        .fail(function(data) {
            $("#errormsg").show().html(data.responseJSON.message);
        });
    }
}

function removeRow(rowno){
    var $tr    = $('.row'+rowno);
    $tr.remove();

}
