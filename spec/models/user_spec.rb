require "rails_helper"

RSpec.describe User, type: :model do
  subject { FactoryBot.create(:user) }

  describe "all attributes" do
    it "should be valid" do
      expect(subject).to be_valid
    end

    it "should be not blank" do
      subject.first_name = ""
      subject.last_name = ""
      subject.description = ""
      subject.email = ""
      subject.password = ""
      expect(subject).not_to be_valid
    end
  end

  describe "first name" do
    it "should be present" do
      should validate_presence_of(:first_name)
    end

    it "should not be present" do
      subject.first_name = nil
      expect(subject).not_to be_valid
    end
  end

  describe "last name" do
    it "should be present" do
      should validate_presence_of(:last_name)
    end

    it "should not be present" do
      subject.last_name = nil
      expect(subject).not_to be_valid
    end
  end

  describe "description" do
    it "should be present" do
      should validate_presence_of(:description)
    end
    it "should not be present" do
      subject.description = nil
      expect(subject).not_to be_valid
    end
  end

  describe "email" do
    it "should be present" do
      should validate_presence_of(:email)
    end
    it "should not be present" do
      subject.email = nil
      expect(subject).not_to be_valid
    end
    it "should be a unique" do
      should validate_uniqueness_of(:email).ignoring_case_sensitivity
    end
    it "should have email format" do
      should allow_value("email@domain.com").for(:email)
    end
    it "don't have email format" do
      should_not allow_value("email.com").for(:email)
    end
  end

  describe "password" do
    it "should be present" do
      should validate_presence_of(:password)
    end
    it "should not be present" do
      subject.password = nil
      expect(subject).not_to be_valid
    end
    it "should have a 6 characters" do
      should validate_length_of(:password).is_at_least(6).on(:create)
    end
  end

  describe "has" do
    it "many lists" do
      should have_many(:lists)
    end
  end
end
