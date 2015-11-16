require 'rails_helper'

RSpec.describe "films/index", type: :view do
  before(:each) do
    assign(:films, [
      Film.create!(
        :name => "Name",
        :description => "MyText",
        :cover => "Cover",
        :video => ""
      ),
      Film.create!(
        :name => "Name",
        :description => "MyText",
        :cover => "Cover",
        :video => ""
      )
    ])
  end

  it "renders a list of films" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Cover".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
