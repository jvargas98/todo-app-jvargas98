require "rails_helper"

RSpec.describe "tasks/show", type: :view do
  subject { FactoryBot.create(:user) }

  before(:each) do
    @list = assign(:list, FactoryBot.create(:list, user: subject))
    @task = assign(:task, Task.create!(
      name: "MyString",
      text: "MyString",
      list: @list,
    ))
  end

  it "renders attributes in <p>" do
    render
  end
end
