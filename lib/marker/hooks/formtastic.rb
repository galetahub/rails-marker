require 'formtastic'

class MarkerInput
  include Formtastic::Inputs::Base

  def to_html
    input_wrapping do
      label_html << builder.marker_field(method, options, input_html_options)
    end
  end
end
