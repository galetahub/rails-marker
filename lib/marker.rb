require "marker/version"
require "marker/engine"

module Marker
  module Helpers
    autoload :FormTagHelper, 'marker/helpers/form_tag_helper'
    autoload :FormBuilder, 'marker/helpers/form_builder'
    autoload :FieldTag, 'marker/helpers/field_tag'
  end
end
