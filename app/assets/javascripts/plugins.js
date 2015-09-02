$(document).ready(function() {
    (function($){
        $.fn.wrapMatch = function(count, className) {
            var length = this.length;
            for(var i = 0; i < length ; i+=count) {
                this.slice(i, i+count).wrapAll('<div '+((typeof className == 'string')?'class="'+className+'"':'')+'/>');
            }
            return this;
        };
    })(jQuery);

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
        }
    }
    $fancybox = $(".fancybox");
    $fancybox.wrapMatch(3, 'row');
    $fancybox.fancybox({
        openEffect	: 'fade',
        closeEffect	: 'fade',
        nextEffect: 'fade',
        prevEffect: 'fade',
        helpers : {
            overlay : {
                locked : false
            }
        }
    });

    $(".body .carousel").carouFredSel({
        circular: true,
        infinite: true,
        height: 300,
        width: 640,
        auto: {
            timeoutDuration: 6000
//            play: false
        },
        items: {
            visible: 1,
            height: 300,
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
