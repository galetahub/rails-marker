module Marker
  # Rails engine
  class Engine < ::Rails::Engine
    initializer 'marker.helpers' do
      ActiveSupport.on_load :action_view do
        ActionView::Base.send(:include, Marker::Helpers::FormTagHelper)
        ActionView::Helpers::FormBuilder.send(:include, Marker::Helpers::FormBuilder)
      end
    end

    initializer 'marker.hooks' do
      require 'marker/hooks/simple_form' if Object.const_defined?('SimpleForm')
      require 'marker/hooks/formtastic'  if Object.const_defined?('Formtastic')
    end
  end
end
