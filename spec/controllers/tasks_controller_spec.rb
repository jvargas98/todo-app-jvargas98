require "rails_helper"

RSpec.describe TasksController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:list) { FactoryBot.create(:list, user: user) }
  let(:task) { FactoryBot.create(:task, list: list) }

  before {
    sign_in user
    list.tasks << task
  }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: { list_id: list.id }
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { list_id: list.id, id: task.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { list_id: list.id }
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { list_id: list.id, id: task.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, params: { list_id: list.id, task: { name: task.name, text: task.text } }
        }.to change(Task, :count).by(1)
      end

      it "redirects to the created task" do
        post :create, params: { list_id: list.id, task: { name: task.name, text: task.text } }
        expect(response).to redirect_to("/lists/#{list.id}/tasks")
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { list_id: list.id, task: { name: "task" } }
        expect(response).to redirect_to("/lists/#{list.id}/tasks")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested task" do
        put :update, params: { list_id: list.id, id: task.id, task: { name: "New name", text: "New text" } }
        expect(response).to redirect_to("/lists/#{list.id}/tasks")
        expect(flash[:notice]).to match("Task was successfully updated.")
      end

      it "redirects to the task" do
        put :update, params: { list_id: list.id, id: task.id, task: { name: "New name", text: "New text" } }
        expect(response).to redirect_to("/lists/#{list.id}/tasks")
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { list_id: list.id, id: task.id, task: { name: 2.1 } }
        expect(response).to redirect_to("/lists/#{list.id}/tasks")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested task" do
      expect {
        delete :destroy, params: { list_id: list.id, id: task.id }
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      delete :destroy, params: { list_id: list.id, id: task.id }
      expect(response).to redirect_to("/lists/#{list.id}/tasks")
    end
  end
end
