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