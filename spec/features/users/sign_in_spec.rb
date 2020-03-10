require "rails_helper"

RSpec.feature "Sign In", type: :feature do
  before :each do
    FactoryBot.create(:user)
  end

  background do
    visit new_user_session_path
  end

  scenario "with valid user" do
    fill_in "Email", with: "jvargas18@ucol.mx"
    fill_in "Password", with: "vargas"
    click_on "Log in"
    expect(page).to have_content("Signed in successfully.")
    expect(current_path).to eq(root_path)
  end

  scenario "with invalid user" do
    fill_in "Email", with: "jvargas@ucol.mx"
    fill_in "Password", with: "vargas123"
    click_on "Log in"
    expect(page).to have_content("Invalid Email or password.")
    expect(current_path).to eq(new_user_session_path)
  end

  scenario "with a blank field" do
    fill_in "Email", with: "jvargas18@ucol.mx"
    click_on "Log in"
    expect(page).to have_content("Invalid Email or password.")
    expect(current_path).to eq(new_user_session_path)
  end
end
