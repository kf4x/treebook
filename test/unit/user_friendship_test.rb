require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase

	should belong_to(:user)
	should belong_to(:friend)

	test "that creating a friendship works" do
		assert_nothing_raised do
			UserFriendship.create user: users(:javier), friend: users(:jim)
		end
	end

	test "that creating a user_friendships based on user_id and friend_id workd" do
		UserFriendship.create user_id: users(:javier).id, friend_id: users(:jim).id
		assert users(:javier).friends.include?(users(:jim))
	end
end
