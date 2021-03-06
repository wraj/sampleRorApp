require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:michael)	
	end	

	test "edit user with invalid informations" do
		log_in_as(@user)
		get edit_user_path(@user)

		assert_template 'users/edit'
		patch user_path(@user), params: { user: {
											name: "",
											email: "sample.dsfd",
											password: "foorab",
											password_confirmation: "rabfoo"	
											}
										}
		assert_template 'users/edit'									
	end

	test "successful edit user with friendly forwarding" do
		get edit_user_path(@user)
		log_in_as(@user)
		assert_redirected_to edit_user_url(@user)

		name = "Foo Bar"
		email = "foobar@example.com"

		patch user_path(@user), params: {
									user: {
										name: name,
										email: email,
										password: "",
										password_confirmation: ""	
									}	
								}	
		assert_not flash.empty?
		assert_redirected_to @user	
		@user.reload

		assert_equal name, @user.name
		assert_equal email, @user.email					
	end	
end
