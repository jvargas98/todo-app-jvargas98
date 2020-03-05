require "rails_helper"

RSpec.describe ListsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:list) { FactoryBot.create(:list, user: user) }

  before { sign_in user }

  describe "GET lists#index" do
    it "should show the lists for the user" do
      get :index
      expect(response).to render_template(:index)
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    it "should show the list view" do
      get :show, params: { id: list.id }
      expect(response).to render_template(:show)
      expect(response.status).to eq(200)
    end
  end

  describe "GET #new" do
    it "should show form for new list" do
      get :new
      expect(response).to render_template(:new)
      expect(assigns(:list)).to be_a_new(List)
      expect(response.status).to eq(200)
    end
  end

  describe "GET #edit" do
    it "should show the list to edit" do
      get :edit, params: { id: list.id }
      expect(response).to render_template(:edit)
      expect(assigns(:list)).to eq(list)
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    context "should be valid" do
      it "redirect to lists" do
        post :create, params: {
                        list: { name: list.name, description: list.description },
                      }
        expect(response).to redirect_to("/lists")
        expect(flash[:notice]).to match("List was successfully created.")
      end
      it "create a new list" do
        expect {
          post :create, params: {
                          list: { name: list.name, description: list.description },
                        }
        }.to change(List, :count).by(2)
      end
    end
    context "should be not valid" do
      it "redirect to new" do
        post :create, params: {
                        list: { description: list.description },
                      }
        expect(response).to redirect_to("/lists")
      end
    end
  end

  describe "PUT #update" do
    context "should be valid" do
      it "redirect to lists" do
        user.lists << list
        put :update, params: {
                       id: list.id,
                       list: { name: "Super 2", description: "super list 2" },
                     }
        expect(response).to redirect_to("/lists/#{list.id}")
        expect(flash[:notice]).to match("List was successfully updated.")
      end
    end
    context "should be not valid" do
      it "redirect to edit" do
        user.lists << list
        put :update, params: {
                       id: list.id,
                       list: { name: "Super 2" },
                     }
        expect(response).to redirect_to("/lists/#{list.id}")
      end
    end
  end

  describe "DELETE #destroy" do
    it "delete the list" do
      user.lists << list
      expect {
        delete :destroy, params: { id: list.id }
      }.to change(List, :count).by(-1)
      expect(flash[:notice]).to match("List was successfully destroyed.")
    end
  end
end
