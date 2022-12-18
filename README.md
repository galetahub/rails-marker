# Rails::Marker

Form helpers for edit fields such as zoom, longitude and latitude

## Installation

Add this line to your application's Gemfile:

    gem 'rails-marker', require: 'marker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails-marker

## Configure

Get Google API key here https://developers.google.com/maps/documentation/javascript/get-api-key

    Marker.google_api_key = 'your_google_api_key'

## Usage

For example you have model office:

``` ruby

# == Schema Information
#
# Table name: offices
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)     not null
#  address    :string(255)
#  phone      :string(255)
#  email      :string(255)
#  longitude  :float
#  latitude   :float
#  zoom       :integer(1)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Office < ActiveRecord::Base
  validates_presence_of :title, :address
  validates_numericality_of :latitude, :longitude

  attr_accessible :address, :email, :latitude, :longitude, :phone, :title, :is_visible, :zoom
end
```

And you want edit fields zoom, longitude and latitude:

``` erb
<%= form_for @office do |f| %>
  <%= f.text_field :longitude, data: { map: 'lng' } %>
  <%= f.text_field :latitude, data: { map: 'lat' } %>

  // Optional fields
  <%= f.text_field :zoom, data: { map: 'zoom' } %>
  <%= f.text_field :radius, data: { map: 'radius' } %>

  <%= f.marker_field :map %>
<% end %>
```
Also support SimpleForm and Formtastic implementation.
It's all you need! Just move the marker, and zoom, latitude and longitude fields will be automatically filled:

![Marker field in use](https://raw.githubusercontent.com/galetahub/rails-marker/master/screenshots/rails-marker-in-use.png)

### ActiveAdmin

Formtastic integration

``` ruby
f.inputs name: 'Location', for: [:location, f.object.location || f.object.build_location] do |loc|
  loc.input :latitude, input_html: { data: { map: 'lat' } }
  loc.input :longitude, input_html: { data: { map: 'lng' } }
  loc.input :content, input_html: { rows: 2 }
  loc.input :map, as: :marker, google_api_key: 'your_google_api_key'
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Copyright (c) 2017 Fodojo LLC, released under the MIT license
