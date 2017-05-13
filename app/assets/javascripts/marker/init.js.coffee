initMarkerMap = () ->
  elements = document.querySelectorAll('[data-marker]')

  elements.forEach (el, index, array) ->
    options = { zoom: el.getAttribute('data-zoom') }
    map = new MapGoogle(el.id, options)

window['initMarkerMap'] = initMarkerMap
