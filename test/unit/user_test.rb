require 'test_helper'

class UserTest < ActiveSupport::TestCase

	test "user should have a first name" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?	#making sure the errors list is not empty for the first_name property
	end

	test "user should have last name" do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end
	test "user should have profile name" do
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "user should have unique profile name" do
		user = User.new
		user.profile_name = users(:javier).profile_name #getting profile name from fixture

		assert !user.save
		assert !user.errors[:profile_name].empty?		
	end
	test "user must format profile_name wO spaces" do
		user = User.new 
		user.profile_name = "Javier C"

		assert !user.save							#should NOT save the user
		#puts "\n\n\n" + user.errors.inspect
		assert !user.errors[:profile_name].empty?	#check errors array **should NOT be empty
		assert user.errors[:profile_name].include?("Must be formatted correctly.") #this msg must be included
	end
end
