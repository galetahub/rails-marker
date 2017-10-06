initMarkerMap = () ->
  elements = document.querySelectorAll('[data-marker]')

  elements.forEach (el, index, array) ->
    map = new MapGoogle(el)
    $(el).data('map', map)

window['initMarkerMap'] = initMarkerMap
