require 'rails_helper'

RSpec.describe "demo/cities/show", type: :view do
  before(:each) do
    assign(:demo_city, Demo::City.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
