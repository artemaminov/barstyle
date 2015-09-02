// JQuery extensions & utility functions
(function($) {
  $.i18nStyles = (function(a) {
    switch (a) {
      case 'page_preview':
        return "190x150";
        break;
      case 'page_width':
        return "В ширину страницы";
        break;
      default :
        return a;
    }
  });
  $.QueryString = (function(a) {
    if (a == "") return {};
    var b = {};
    for (var i = 0; i < a.length; ++i)
    {
      var p=a[i].split('=');
      if (p.length != 2) continue;
      b[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " "));
    }
    return b;
  })(window.location.search.substr(1).split('&'))
})(jQuery);
