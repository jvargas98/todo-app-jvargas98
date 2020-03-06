require "rails_helper"

RSpec.describe "tasks/index", type: :view do
  subject { FactoryBot.create(:user) }

  before(:each) do
    @list = assign(:list, FactoryBot.create(:list, user: subject))
    @tasks = assign(:tasks, [
      FactoryBot.create(:task, id: "1", list: @list),
      FactoryBot.create(:task, id: "2", list: @list),
    ])
  end

  it "renders a list of tasks" do
    render
  end
end
