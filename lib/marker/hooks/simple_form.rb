require 'simple_form'

class MarkerInput < SimpleForm::Inputs::Base
  def input
    @builder.marker_field(attribute_name, options, input_html_options)
  end
end
