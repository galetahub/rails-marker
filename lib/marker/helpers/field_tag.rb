module Marker
  module Helpers
    class FieldTag
      attr_reader :template, :object, :engine, :html_options
      
      # Wrapper for render marker field
      # Usage:
      #
      #   marker = FieldTag.new(object_name, method_name, template, options)
      #   marker.to_s
      #
      def initialize(object_name, method_name, template, options = {}, html_options = {}) #:nodoc:
        options = { :object_name => object_name, :method_name => method_name }.merge(options)
        
        @template, @options, @html_options = template, options.dup, html_options.dup
        @engine = (@options.delete(:engine) || "google")
        @object = (@options.delete(:object) || @template.instance_variable_get("@#{object_name}"))
        @html_options[:id] ||= id
      end
      
      def to_s(locals = {}) #:nodoc:
        locals = { :field => self }.merge(locals)
        @template.render :partial => "marker/#{@engine}", :locals => @options.merge(locals)
      end
      
      def id
        @id ||= @template.dom_id(@object, [method_name, 'marker'].join('_'))
      end
      
      def input_options
        @input_options ||= {:zoom => :zoom, :lat => :latitude, :lng => :longitude}.merge(@options)
      end
      
      def map_options
        {
          :field_lat => "##{sanitized_object_name}_#{input_options[:lat]}",
          :field_lng => "##{sanitized_object_name}_#{input_options[:lng]}",
          :field_zoom => "##{sanitized_object_name}_#{input_options[:zoom]}"
        }
      end
      
      def method_name
        @options[:method_name]
      end
      
      def object_name
        @options[:object_name]
      end
      
      def sanitized_object_name
        @sanitized_object_name ||= object_name.gsub(/\]\[|[^-a-zA-Z0-9:.]/, "_").sub(/_$/, "")
      end
    end
  end
end
