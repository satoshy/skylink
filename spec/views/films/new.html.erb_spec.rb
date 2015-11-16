require 'rails_helper'

RSpec.describe "films/new", type: :view do
  before(:each) do
    assign(:film, Film.new(
      :name => "MyString",
      :description => "MyText",
      :cover => "MyString",
      :video => ""
    ))
  end

  it "renders new film form" do
    render

    assert_select "form[action=?][method=?]", films_path, "post" do

      assert_select "input#film_name[name=?]", "film[name]"

      assert_select "textarea#film_description[name=?]", "film[description]"

      assert_select "input#film_cover[name=?]", "film[cover]"

      assert_select "input#film_video[name=?]", "film[video]"
    end
  end
end
