require 'rails_helper'

RSpec.describe "demo/cities/edit", type: :view do
  let(:demo_city) {
    Demo::City.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:demo_city, demo_city)
  end

  it "renders the edit demo_city form" do
    render

    assert_select "form[action=?][method=?]", demo_city_path(demo_city), "post" do

      assert_select "input[name=?]", "demo_city[name]"
    end
  end
end
