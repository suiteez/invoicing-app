    
function create() {
    this.wrapper = $( "<span>" )
    .addClass( "custom-combobox" )
    .insertAfter( this.element );
 
    this.element.hide();
    this._createAutocomplete();
    this._createShowAllButton();
}
        
function createAutocomplete() {
    var selected = this.element.children( ":selected" ),
    value = selected.val() ? selected.text() : "";
 
    this.input = $( "<input>" )
    .appendTo( this.wrapper )
    .attr('id',this.element.attr('id'))
    .val( value )
    .attr( "title", "" )
    .addClass( "custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left" )
    .autocomplete({
        delay: 50,
        minLength: 0,
        source: $.proxy( this, "_source" ),
        search:autocompcustserach
    //                response: autocompresponse
    })
    .tooltip({
        tooltipClass: "ui-state-highlight"
    });
 
    this._on( this.input, {
        autocompleteselect: function( event, ui ) {
            //                    ui.item.option.selected = true;
            //                    this._trigger( "select", event, {
            //                        item: ui.item.option
            //                    });
            if(ui.item.customer && ui.item.customer==-1){
                clickAdd(ui.item.value);
            }
            this._trigger( "select", event, {
                item: ui.item.label
            });
        },
 
        autocompletechange: "_removeIfInvalid"
    });
}
 
function createShowAllButton() {
    var input = this.input,
    wasOpen = false;
 
    $( "<a>" )
    .attr( "tabIndex", -1 )
    .attr( "title", "Show All Items" )
    //            .addClass(" btn btn-default dropdown-toggle")
    .tooltip()
    .appendTo( this.wrapper )
    .button({
        icons: {
            primary: "ui-icon-triangle-1-s"
        },
        text: false
    })
    .removeClass( "ui-corner-all" )
    .addClass("ui-button ui-widget ui-state-default ui-button-icon-only custom-combobox-toggle ui-corner-right")
    //            .addClass( "custom-combobox-toggle ui-corner-right" )
    .mousedown(function() {
        wasOpen = input.autocomplete( "widget" ).is( ":visible" );
    })
    .click(function() {
        input.focus();
 
        // Close if already visible
        if ( wasOpen ) {
            return;
        }
 
        // Pass empty string as value to search for, displaying all results
        var value = input.val();
        input.val("");
        input.autocomplete( "search", "" );
        input.val(value);
    });
}
 
function source( request, response ) {
    var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
    response( this.element.children( "option" ).map(function() {
        var text = $( this ).text();
        if ( this.value && ( !request.term || matcher.test(text) ) )
            return {
                label: text,
                value: text,
                option: this
            };
    }) );
}
 
function removeIfInvalid( event, ui ) {
 
    // Selected an item, nothing to do
    if ( ui.item ) {
        return;
    }
 
    // Search for a match (case-insensitive)
    var value = this.input.val(),
    valueLowerCase = value.toLowerCase(),
    valid = false;
    this.element.children( "option" ).each(function() {
        if ( $( this ).text().toLowerCase() === valueLowerCase ) {
            this.selected = valid = true;
            return false;
        }
    });
 
    // Found a match, nothing to do
    if ( valid ) {
        return;
    }
 
    // Remove invalid value
    this.input
    .val( "" )
    .attr( "title", value + " didn't match any item" )
    .tooltip( "open" );
    this.element.val( "" );
    this._delay(function() {
        this.input.tooltip( "close" ).attr( "title", "" );
    }, 2500 );
    this.input.autocomplete( "instance" ).term = "";
}
 
function destroy() {
    this.wrapper.remove();
    this.element.show();
}
    
 
