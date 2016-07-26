require 'rails_helper'

describe UsersController, :type => :controller do

  # @user_1 = let(:user) { User.create!(email: "george@bullocksbikes.com", password: "123456") }
  # @user_2 = let(:user) { User.create!(email: "support@bullocksbikes.com", password: "123456") }
  @user_1 = FactoryGirl.create(:user)
  @user_2 = FactoryGirl.create(:user)


  describe "GET #show" do
    before "User is logged in" do
      sign_in user_1
      
      it "loads correct user details" do 
        get :show, id: user.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq user
      end

      it "tries to access user_2 details" do
        get :show, id: user_2
        expect(response).to redirect_to(root_path)
      end  
    end  

    before "No user is logged in" do 
      it "redirects to login" do
        get :show, id: user.id
        expect(response).to redirect_to(root_path)
      end
    end
  end 
end