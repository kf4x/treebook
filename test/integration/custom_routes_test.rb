require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest

	test "/login opens the login page" do
		get '/login'
		assert_response :success
	end

	test "/logout opens the login page" do
		get '/logout'
		assert_response :redirect
		assert_redirected_to '/'
	end
	test "/register opens the signup page" do
		get '/register'
		assert_response :success
	end
end
