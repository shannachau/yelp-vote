require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe "validations" do
    it "creates a valid model" do
      entry = build(:entry)

      expect(entry).to be_valid
    end

    it "requires a user_id" do
      entry = build(:entry, user_id: nil)

      expect(entry).to be_invalid
      expect(entry.errors).to include(:user_id)
    end

    it "requires a message_id" do
      entry = build(:entry, message_id: nil)

      expect(entry).to be_invalid
      expect(entry.errors).to include(:message_id)
    end
  end

  describe "associations" do
    it "belongs to a user" do
      user = create(:user)
      entry = create(:entry, user_id: user.id)

      expect(entry.user).to eq(user)
    end

    it "belongs to a message" do
      message = create(:message)
      entry = create(:entry, message_id: message.id)

      expect(entry.message).to eq(message)
    end
  end
end
