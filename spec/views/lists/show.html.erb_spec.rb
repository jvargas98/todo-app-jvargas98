require "rails_helper"

RSpec.describe "lists/show", type: :view do
  subject { FactoryBot.create(:user) }
  before(:each) do
    @list = assign(:list, FactoryBot.create(:list, user: subject))
  end

  it "renders the list" do
    render
  end
end
