require 'rails_helper'

RSpec.describe "films/edit", type: :view do
  before(:each) do
    @film = assign(:film, Film.create!(
      :name => "MyString",
      :description => "MyText",
      :cover => "MyString",
      :video => ""
    ))
  end

  it "renders the edit film form" do
    render

    assert_select "form[action=?][method=?]", film_path(@film), "post" do

      assert_select "input#film_name[name=?]", "film[name]"

      assert_select "textarea#film_description[name=?]", "film[description]"

      assert_select "input#film_cover[name=?]", "film[cover]"

      assert_select "input#film_video[name=?]", "film[video]"
    end
  end
end
