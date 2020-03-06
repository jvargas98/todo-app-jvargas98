require "rails_helper"

RSpec.describe Task, type: :model do
  subject { FactoryBot.create(:task) }

  describe "all attributes" do
    it "should be valid" do
      expect(subject).to be_valid
    end

    it "should be not blank" do
      subject.name = ""
      subject.text = ""
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

  describe "text" do
    it "should be present" do
      should validate_presence_of(:text)
    end

    it "should not be present" do
      subject.text = nil
      expect(subject).not_to be_valid
    end
  end

  describe "belongs" do
    it "to list" do
      should belong_to :list
    end
  end
end
