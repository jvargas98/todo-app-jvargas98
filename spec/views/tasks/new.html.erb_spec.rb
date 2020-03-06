require "rails_helper"

RSpec.describe "tasks/new", type: :view do
  subject { FactoryBot.create(:user) }

  before(:each) do
    @list = assign(:list, FactoryBot.create(:list, user: subject))
    @task = assign(:task, Task.create!(
      name: "MyString",
      text: "MyString",
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", "/lists/#{@list.id}/tasks/#{@task.id}", "post" do
      assert_select "input[name=?]", "task[name]"

      assert_select "textarea[name=?]", "task[text]"
    end
  end
end
