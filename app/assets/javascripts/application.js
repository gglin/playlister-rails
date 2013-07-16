// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
// require_tree .
//= require jquery
//= require jquery_ujs
//= require bootstrap
// require_tree ../../../vendor/assets/javascripts/.
// require      ../../../vendor/assets/javascripts/flatui-checkbox.js


$(document).ready(function() {

    var isVisible = false;

    var hideAllPopovers = function() {
       $('.has_popover').each(function() {
            $(this).popover('hide');
        });  
    };

    $('.has_popover').popover({
        placement: 'bottom',
        animation: true,
        html: true,
        trigger: 'manual'
    }).on('click', function(e) {
        // if any other popovers are visible, hide them
        if(isVisible) {
            hideAllPopovers();
        }

        $(this).popover('show');

        // handle clicking on the popover itself
        $('.popover').off('click').on('click', function(e) {
            e.stopPropagation(); // prevent event for bubbling up => will not get caught with document.onclick
        });

        isVisible = true;
        e.stopPropagation();
    });


    $(document).on('click', function(e) {
        hideAllPopovers();
        isVisible = false;
    });

});