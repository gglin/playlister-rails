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