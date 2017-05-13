module Marker
  module Helpers
    class FieldTag
      attr_reader :template, :object, :engine, :html_options

      DEFAULT_MAP_ENGINE = 'google'.freeze
      DEFAULT_STYLE = 'width:800px;height:400px'.freeze

      # Wrapper for render marker field
      # Usage:
      #
      #   marker = FieldTag.new(object_name, method_name, template, options)
      #   marker.to_s
      #
      def initialize(object_name, method_name, template, options = {}, html_options = {}) #:nodoc:
        @options = { object_name: object_name, method_name: method_name }.merge!(options)
        @template = template
        @html_options = html_options

        @engine = (@options.delete(:engine) || DEFAULT_MAP_ENGINE)
        @object = (@options.delete(:object) || @template.instance_variable_get("@#{object_name}"))

        @html_options[:id] ||= id
      end

      def to_s(locals = {}) #:nodoc:
        locals = { field: self }.merge!(locals)
        @template.render partial: "marker/#{@engine}", locals: locals
      end

      def id
        @id ||= @template.dom_id(@object, method_name)
      end

      def input_options
        @input_options ||= {
          data: {
            marker: method_name,
            zoom: @html_options[:zoom]
          },
          style: DEFAULT_STYLE
        }.merge!(@html_options)
      end

      def method_name
        @options[:method_name]
      end

      def object_name
        @options[:object_name]
      end
    end
  end
end
