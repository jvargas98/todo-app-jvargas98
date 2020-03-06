require "rails_helper"

RSpec.describe "tasks/edit", type: :view do
  subject { FactoryBot.create(:user) }
  before(:each) do
    @list = assign(:list, FactoryBot.create(:list, user: subject))
    @task = assign(:task, Task.create!(
      id: "1",
      name: "MyString",
      text: "MyString",
      list: @list,
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", "/lists/#{@list.id}/tasks/#{@task.id}", "post" do
      assert_select "input[name=?]", "task[name]"

      assert_select "textarea[name=?]", "task[text]"
    end
  end
end
