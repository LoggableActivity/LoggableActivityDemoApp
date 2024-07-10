# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'demo/cities/index' do
  before do
    assign(:demo_cities, [
             create(:demo_city, name: 'Stockholm'),
             create(:demo_city, name: 'Tokyo')
           ])
  end

  it 'renders a list of demo/cities' do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new('Stockholm'.to_s), count: 1
  end
end
