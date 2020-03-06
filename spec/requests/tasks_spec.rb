require "rails_helper"

RSpec.describe "Tasks", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:list) { FactoryBot.create(:list, user: user) }

  before {
    sign_in user
  }
  describe "GET /tasks" do
    it "works! (now write some real specs)" do
      get list_tasks_path(list)
      expect(response).to have_http_status(200)
    end
  end
end
