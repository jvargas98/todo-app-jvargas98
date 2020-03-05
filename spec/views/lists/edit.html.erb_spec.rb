require "rails_helper"

RSpec.describe "lists/edit", type: :view do
  subject { FactoryBot.create(:user) }
  before(:each) do
    @list = assign(:list, FactoryBot.create(:list, user: subject))
  end

  it "renders the edit form" do
    render

    assert_select "form[action=?][method=?]", list_path(@list), "post" do
    end
  end
end
