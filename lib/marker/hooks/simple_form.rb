require 'simple_form'

module Marker
  module Hooks
    module SimpleForm
      class MarkerInput < ::SimpleForm::Inputs::Base
        def input(_wrapper_options = nil)
          @builder.marker_field(attribute_name, options, input_html_options)
        end
      end
    end
  end
end

::SimpleForm::FormBuilder.map_type :marker, to: Marker::Hooks::SimpleForm::MarkerInput
