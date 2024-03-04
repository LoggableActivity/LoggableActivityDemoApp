# frozen_string_literal: true

json.extract! demo_city, :id, :name, :created_at, :updated_at
json.url demo_city_url(demo_city, format: :json)
