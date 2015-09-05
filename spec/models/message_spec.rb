require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "associations" do
    before do
      @message = create(:message)
      @user1 = create(:user, username: "user1")
      @user2 = create(:user, username: "user2")

      @message.users << @user1
      @message.users << @user2
    end
    it "has many many users" do
      expect(@message.users).to eq([@user1, @user2])
    end

    it "belongs to many users" do
      expect(@user1.messages).to include(
      @message)
      expect(@user2.messages).to include(@message)
    end
  end
end
