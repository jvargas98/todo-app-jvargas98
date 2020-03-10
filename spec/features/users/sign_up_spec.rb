require "rails_helper"

RSpec.feature "SignUps", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  background do
    visit root_path
    click_on "Sign up"
  end

  scenario "Sign up with valid values" do
    fill_in "Email", with: "jvargas18@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    fill_in "First name", with: "Jorge"
    fill_in "Last name", with: "Vargas"
    fill_in "Description", with: "My description"
    click_on "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(current_path).to eq(root_path)
  end

  scenario "Sign up with email already taken" do
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Description", with: user.description
    click_on "Sign up"
    expect(page).to have_content("Email has already been taken")
    expect(current_path).to eq(root_path)
  end

  scenario "Sign up with a very short password" do
    fill_in "Email", with: "jvargas18@gmail.com"
    fill_in "Password", with: "12345"
    fill_in "Password confirmation", with: "12345"
    fill_in "First name", with: "Jorge"
    fill_in "Last name", with: "Vargas"
    fill_in "Description", with: "My description"
    click_on "Sign up"
    expect(page).to have_content("Password is too short")
    expect(current_path).to eq(root_path)
  end

  scenario "Sign up with a within invalid password confirmation" do
    fill_in "Email", with: "jvargas18@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123455"
    fill_in "First name", with: "Jorge"
    fill_in "Last name", with: "Vargas"
    fill_in "Description", with: "My description"
    click_on "Sign up"
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(current_path).to eq(root_path)
  end

  scenario "Sign up with a blank field (first name)" do
    fill_in "Email", with: "jvargas18@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123455"
    fill_in "Last name", with: "Vargas"
    fill_in "Description", with: "My description"
    click_on "Sign up"
    expect(page).to have_content("First name can't be blank")
    expect(current_path).to eq(root_path)
  end
end
