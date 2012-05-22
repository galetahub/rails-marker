# Rails::Marker

Form helpers for edit fields such as zoom, longitude and latitude

## Installation

Add this line to your application's Gemfile:

    gem 'rails-marker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails-marker

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
  <%= f.marker_field :marker %>
<% end %>
```

It's all you need!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Copyright (c) 2012 Aimbulance, released under the MIT license
