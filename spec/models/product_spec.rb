require 'rails_helper'

describe Product do 
	
	before do 
		@product = Product.create!(name: "racing bike")
		@user = User.create!(email: "george@bullockbikesberlin.com", password: "123456")
		@product.comments.create!(rating: 5, user: @user, body: "Bodacious bike bro!")
		@product.comments.create!(rating: 2, user: @user, body: "This bike is not cool dude!")
		@product.comments.create!(rating: 5, user: @user, body: "Epic racer dude. I'm buying one for my dog!")
	
		it "returns the average rating from all users" do
			expect(comments.averge(:rating)).to eq "4"
		end	
	end	

end
