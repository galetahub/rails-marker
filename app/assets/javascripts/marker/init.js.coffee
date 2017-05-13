initMarkerMap = () ->
  elements = document.querySelectorAll('[data-marker]')

  elements.forEach (el, index, array) ->
    map = new MapGoogle(el)

window['initMarkerMap'] = initMarkerMap
