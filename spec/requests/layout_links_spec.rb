describe "layout links" do

	describe "when signed in" do

		it "should have a profile link" do
			visit root_path
			response.should have_selector("a", :href => user_path(@user),
            :content => "Profile")
        end
       end
      end