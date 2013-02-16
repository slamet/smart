require 'spec_helper'
describe PagesController do
render_views

	describe "GET 'home'"do
		it "should be successfull" do
			get 'home'
			response.should be_success
		end

		it "should have the right title" do
			get 'home'
			rensponse.should have_selector("title",
				:content => @base_title +  " | Home "

		end		
	end
	describe "when signed in" do
		before(:each) do
		@user = test_sign_in(Factory(:user))
		other_user = Factory(:user, :email => Factory.next(:email))
	other_user.follow!(@user)
   end
   it "should have the right follower/following counts" do
		get :home
		response.should have_selector("a", :href => following_user_path(@user),
		:content => "0 following")
		response.should have_selector("a", :href => followers_user_path(@user),
		:content => "1 follower")
	end
  end


	describe "GET 'contact'" do
		it "should be succesfull" do
		get 'contact'
		response.should be_success
	end

	it "should have the right title" do
			get 'contact'
			rensponse.should have_selector("title",
				:content => @base_title +  " | contact "
		end
end
	describe "GET 'about'" do
		it "should be succesfull" do
		get 'about'
		response.should be_success
	end

	it "should have the right title" do
			get 'about'
			rensponse.should have_selector("title",
				:content => @base_title +  " | about "
		end

	describe "GET 'help'" do
		it "should be succesfull" do
		get 'help'
		response.should be_success
	end

	it "should have the right title" do
			get 'help'
			rensponse.should have_selector("title",
				:content => @base_title +  " | help "
		end
	end
end