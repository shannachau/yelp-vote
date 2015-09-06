require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "creates a valid user" do
      user = build(:user)

      expect(user).to be_valid
    end

    it "requires a username" do
      user = build(:user, username: nil)

      expect(user).to be_invalid
      expect(user.errors).to include(:username)
    end

    it "requires a unique username" do
      user1 = create(:user, username: "username")
      user2 = build(:user, username: "username")

      expect(user2).to be_invalid
      expect(user2.errors).to include(:username)
    end

    it "requires a password" do
      user = build(:user, password: nil)

      expect(user).to be_invalid
      expect(user.errors).to include(:password)
    end

    it "requires a password_confirmation" do
      user = build(:user, password_confirmation: nil)

      expect(user).to be_invalid
      expect(user.errors).to include(:password_confirmation)
    end
  end

  describe "assocations" do
    before do
      @user = create(:user)
      @message1 = create(:message)
      @message2 = create(:message)

      @user.messages << @message1
      @user.messages << @message2

      @entry1 = create(:entry, user_id: @user.id)
      @entry2 = create(:entry, user_id: @user.id)
    end

    it "has many messages" do
      expect(@user.messages).to eq([@message1, @message2])
    end

    it "belongs to many messages" do
      expect(@message1.users).to include(@user)
      expect(@message2.users).to include(@user)
    end

    it "has many entries" do
      expect(@user.entries).to eq([@entry1, @entry2])
    end
  end
end
