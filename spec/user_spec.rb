require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do
    it "is valid with valid attributes" do
      user = User.new(first_name: "Yavuz", last_name: "Tarik", email: "tarikyavuzca@gmail.com", password: "privacy", password_confirmation: "privacy")
      expect(user).to be_valid
      expect(user.errors.full_messages).to be_empty
    end

    it "is not valid when password and password_confirmation don't match" do
      user = User.new(first_name: "Test", last_name: "Person", email: "test1@gmail.com", password: "something", password_confirmation: "else")
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end

    
  end
end