module Marker
  module Helpers
    module FormBuilder
      # Render map field
      # Usage:
      #   
      #   <%= form_for @office do |f| %>
      #     <%= f.marker_field :marker %>
      #   <%= end %>
      #
      def marker_field(method, options = {})
        @template.send("marker_field_tag", @object_name, method, objectify_options(options))
      end
    end
  end
end
