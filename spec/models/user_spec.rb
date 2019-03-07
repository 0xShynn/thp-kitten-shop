require 'rails_helper'


RSpec.describe User, type: :model do
  before(:each) do
    
    @user = FactoryBot.build(:user)
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    it "is a string for first_name" do
      expect @user.first_name.class == String 
    end

    it "is a string for last_name" do
      expect @user.last_name.class == String
    end

    it "is a string for email" do
      expect @user.email.class == String
    end
  end

  context "associations" do

    describe "orders" do
      it "should have_many orders" do
               order = Order.create
        expect(@user.orders.include?(order)).to eq(false)
    end
  end
end
end