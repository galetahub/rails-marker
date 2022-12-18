(function() {
  var initMarkerMap;

  initMarkerMap = function() {
    var elements;
    elements = document.querySelectorAll('[data-marker]');
    return elements.forEach(function(el, index, array) {
      var map;
      map = new MapGoogle(el);
      return $(el).data('map', map);
    });
  };

  window['initMarkerMap'] = initMarkerMap;
}).call(this);
