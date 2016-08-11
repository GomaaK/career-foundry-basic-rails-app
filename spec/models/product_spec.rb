require 'rails_helper'

describe Product do
  context "when product has comments" do
    before do
      @product = Product.create(name: "racing bike")
      @user = FactoryGirl.create(:user)
      @product.comments.create(rating: 5, user: @user, body: "Bodacious bike bro!")
      @product.comments.create(rating: 2, user: @user, body: "This bike is not cool dude!")
      @product.comments.create(rating: 5, user: @user, body: "Epic racer dude. I'm buying one for my dog!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 4.0
    end
  end
end


