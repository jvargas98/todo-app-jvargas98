require "rails_helper"

RSpec.describe "lists/index", type: :view do
  subject { FactoryBot.create(:user) }
  before(:each) do
    assign(:lists, [
      FactoryBot.create(:list, id: "1", user: subject),
      FactoryBot.create(:list, id: "2", user: subject),
    ])
  end
  it "renders all the lists for the user" do
    render
  end
end
