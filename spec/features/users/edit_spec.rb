require "rails_helper"

RSpec.feature "Users", type: :feature do
  given(:user) { create(:user) }
  background do
    sign_in user
    visit root_path
    click_on "Profile"
    click_on "Settings"
  end

  scenario "Edit succefully" do
    fill_in "First name", with: "Alejandro"
    click_on "Update"
    #expect(page).to have_content("Your account has been updated successfully.")
    expect(current_path).to eq("/users/#{user.id}")
  end
end
