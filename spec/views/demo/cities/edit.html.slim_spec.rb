# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'demo/cities/edit' do
  let(:demo_city) do
    Demo::City.create!(
      name: 'Tokyo',
      country: 'Japan'
    )
  end

  before do
    assign(:demo_city, demo_city)
  end

  it 'renders the edit demo_city form' do
    render

    assert_select 'form[action=?][method=?]', demo_city_path(demo_city), 'post' do
      assert_select 'input[name=?]', 'demo_city[name]'
    end
  end
end
