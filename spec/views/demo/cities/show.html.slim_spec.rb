# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'demo/cities/show', type: :view do
  before(:each) do
    assign(:demo_city, FactoryBot.create(:demo_city))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
