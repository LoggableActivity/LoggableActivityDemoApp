require 'rails_helper'

RSpec.describe "demo/cities/index", type: :view do
  before(:each) do
    assign(:demo_cities, [
      Demo::City.create!(
        name: "Name"
      ),
      Demo::City.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of demo/cities" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
