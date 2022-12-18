(function() {
  var $, MapGoogle;

  $ = jQuery;

  MapGoogle = (function() {
    function MapGoogle(dom, options) {
      var defaults;
      this.dom = dom;
      if (options == null) {
        options = {};
      }
      defaults = {
        lat: 50.44067063154785,
        lng: 30.52654266357422,
        zoom: 6,
        radius: 1000
      };
      this.element = $(this.dom);
      this.options = $.extend(defaults, this.element.data(), options);
      this.name = this.element.data('marker');
      this.options.field_lat = "[data-" + this.name + "='lat']";
      this.options.field_lng = "[data-" + this.name + "='lng']";
      this.options.field_zoom = "[data-" + this.name + "='zoom']";
      this.options.field_radius = "[data-" + this.name + "='radius']";

      this._setup();
    }

    MapGoogle.prototype._setup = function() {
      var number;

      this.location = this._build_location();
      this.map = this._build_map(this.element.get(0));
      this.marker = this._build_marker();
      this.field_lat = $(this.options.field_lat + ':eq(0)');
      this.field_lng = $(this.options.field_lng + ':eq(0)');
      this.field_zoom = $(this.options.field_zoom + ':eq(0)');
      this.field_radius = $(this.options.field_radius + ':eq(0)');

      google.maps.event.addListener(this.marker, 'dragend', (function(_this) {
        return function(event) {
          return _this._update_location(event)
        };
      })(this));
      google.maps.event.addListener(this.map, 'zoom_changed', (function(_this) {
        return function() {
          return _this.field_zoom.val(_this.map.getZoom());
        };
      })(this));
      if (this.field_radius.length > 0) {
        number = this._parse_value(this.field_radius, this.options.radius);
        this.circle = this._build_circle({
          radius: number
        });
        return this.circle.bindTo('center', this.marker, 'position');
      }
    };

    MapGoogle.prototype.placeMarker = function(location) {
      var marker;
      marker = this._build_marker({
        position: location
      });
      this.map.setCenter(location);
      return marker;
    };

    MapGoogle.prototype._build_location = function() {
      var lat, lng;
      lat = this._parse_value(this.options.field_lat, this.options.lat);
      lng = this._parse_value(this.options.field_lng, this.options.lng);
      return new google.maps.LatLng(lat, lng);
    };

    MapGoogle.prototype._build_map = function(element, options) {
      var defaults, settings, zoom;
      if (options == null) {
        options = {};
      }
      zoom = this._parse_value(this.options.field_zoom, this.options.zoom);
      defaults = {
        zoom: zoom,
        center: this.location,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      settings = $.extend(defaults, options);
      return new google.maps.Map(element, settings);
    };

    MapGoogle.prototype._build_marker = function(options) {
      var defaults, settings;
      if (options == null) {
        options = {};
      }
      defaults = {
        position: this.location,
        map: this.map,
        draggable: true
      };
      settings = $.extend(defaults, options);
      return new google.maps.Marker(settings);
    };

    MapGoogle.prototype._build_circle = function(options) {
      var defaults, settings;
      if (options == null) {
        options = {};
      }
      defaults = {
        map: this.map,
        strokeColor: '#FF0000',
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: '#FF0000',
        fillOpacity: 0.35,
        radius: 1000
      };
      settings = $.extend(defaults, options);
      return new google.maps.Circle(settings);
    };

    MapGoogle.prototype._update_location = function(event) {
      var pos = this.marker.getPosition();

      this.field_lat.val(pos.lat());
      this.field_lng.val(pos.lng());

      return this.map.setCenter(event.latLng);
    };

    MapGoogle.prototype._parse_value = function(field, default_value) {
      var value;
      value = parseFloat($(field).val());
      if (value) {
        return value;
      } else {
        return parseFloat(default_value);
      }
    };

    return MapGoogle;
  })();

  window.MapGoogle = MapGoogle;
}).call(this);
