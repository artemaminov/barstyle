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
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {

    // developer.mozilla.org/en/CSS/pointer-events
    // Test and project pages:
    // ausi.github.com/Feature-detection-technique-for-pointer-events/
    // github.com/ausi/Feature-detection-technique-for-pointer-events/wiki
    // github.com/Modernizr/Modernizr/issues/80
    Modernizr.addTest('pointerevents', function(){
        var element = document.createElement('x'),
            documentElement = document.documentElement,
            getComputedStyle = window.getComputedStyle,
            supports;
        if(!('pointerEvents' in element.style)){
            return false;
        }
        element.style.pointerEvents = 'auto';
        element.style.pointerEvents = 'x';
        documentElement.appendChild(element);
        supports = getComputedStyle &&
            getComputedStyle(element, '').pointerEvents === 'auto';
        documentElement.removeChild(element);
        return !!supports;
    });


    if (!Modernizr.pointerevents) {
        $(".woodframe").css("z-index", -1);
    }
    
    $(".fancybox").fancybox({
        helpers : {
            overlay : {
                locked : false
            }
        }
    });
});