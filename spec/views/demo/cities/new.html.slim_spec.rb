# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'demo/cities/new', type: :view do
  before(:each) do
    assign(:demo_city, Demo::City.new(
                         name: 'MyString'
                       ))
  end

  it 'renders new demo_city form' do
    render

    assert_select 'form[action=?][method=?]', demo_cities_path, 'post' do
      assert_select 'input[name=?]', 'demo_city[name]'
    end
  end
end
