module Marker
  # View helpers
  module Helpers
    autoload :FormTagHelper, 'marker/helpers/form_tag_helper'
    autoload :FormBuilder, 'marker/helpers/form_builder'
    autoload :FieldTag, 'marker/helpers/field_tag'
  end

  def self.google_api_key=(value)
    @google_api_key = value
  end

  def self.google_api_key
    @google_api_key || ENV['GOOGLE_API_KEY']
  end
end

require 'marker/engine'
require 'marker/version'
