require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "creates a valid user" do
      user = build(:user)

      expect(user).to be_valid
    end

    it "requires a username" do

    end
  end
end
