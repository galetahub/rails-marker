$ = jQuery

class MapGoogle

  constructor: (@dom_id, options = {}) ->
    defaults =
      lat: 50.44067063154785
      lng: 30.52654266357422
      zoom: 6
      field_lat: "#lat"
      field_lng: "#lng"
      field_zoom: "#zoom"
      
    @options = $.extend defaults, options
    this._setup()
  
  _setup: ->
    @location = this._build_location()
    @map = this._build_map(@dom_id)
    @marker = this._build_marker()
    
    google.maps.event.addListener(@marker, 'dragend', (event) =>
      pos = @marker.getPosition()
      
      $(@options.field_lat).val pos.lat()
      $(@options.field_lng).val pos.lng()
      
      @map.setCenter(event.latLng)
    )
    
    google.maps.event.addListener(@map, 'zoom_changed', () =>
      $(@options.field_zoom).val @map.getZoom()
    )
  
  placeMarker: (location) ->
    marker = this._build_marker {position: location}

    @map.setCenter(location);
    
    return marker
    
  _build_location: ->
    lat = this._parse_value @options.field_lat, @options.lat
    lng = this._parse_value @options.field_lng, @options.lng
    
    new google.maps.LatLng(lat, lng)
  
  _build_map: (dom_id, options = {}) ->
    zoom = this._parse_value @options.field_zoom, @options.zoom
    
    defaults =
      zoom: zoom
      center: @location
      mapTypeId: google.maps.MapTypeId.ROADMAP
    
    settings = $.extend defaults, options
    
    new google.maps.Map(document.getElementById(dom_id), settings)
  
  _build_marker: (options = {}) ->
    defaults =
      position: @location
      map: @map
      draggable: true
    
    settings = $.extend defaults, options
    
    new google.maps.Marker(settings)
  
  _parse_value: (field, default_value) ->
    value = parseFloat $(field).val()
    
    if value
      return value
    else
      return default_value

window.MapGoogle = MapGoogle
