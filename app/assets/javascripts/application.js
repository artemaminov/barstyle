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
//= require jquery.fancybox.pack
//= require carouFredSel-6.2.1/jquery.carouFredSel-6.2.1-packed
//= require modernizr
//= require_self

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

    var fancyImage = $('.body img.fancybox');
    if (fancyImage.length > 0) {
        for (var i = 0; i < fancyImage.length; i++) {
            fancyThumbUrl = $(fancyImage[i]).attr('src');
            fancyOrigUrl = fancyThumbUrl.replace('page_preview', 'original');
            $(fancyImage[i]).wrap('<a class="fancybox" rel="fancygroup" href="' + fancyOrigUrl + '" />');
            $(fancyImage[i]).removeClass('fancybox');
        };
    }
    $(".fancybox").fancybox({
        helpers : {
            overlay : {
                locked : false
            }
        }
    });

    $(".body .carousel").carouFredSel({
        circular: true,
        infinite: true,
        height: "auto",
        width: '100%',
        auto: {
            timeoutDuration: 6000
//            play: false
        },
        items: {
            visible: 1,
            height: "auto",
            width: 640,
            minimum: 2
        },
        scroll: {
            duration: 300
        },
//        pagination: {
//            container: ".main-carousel-pager"
//            anchorBuilder: function (nr) {
//                return '<a href="#' + nr + '"></a>';
//            }
//        },
        swipe: true
    });
});