require "rails_helper"

RSpec.describe List, type: :model do
  subject { FactoryBot.create(:list) }

  describe "all attributes" do
    it "should be valid" do
      expect(subject).to be_valid
    end

    it "should be not blank" do
      subject.name = ""
      subject.description = ""
      expect(subject).not_to be_valid
    end
  end

  describe "name" do
    it "should be present" do
      should validate_presence_of(:name)
    end

    it "should not be present" do
      subject.name = nil
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

  describe "belongs" do
    it "to user" do
      should belong_to :user
    end
  end

  describe "has" do
    it "many tasks" do
      should have_many(:tasks)
    end
  end
end
