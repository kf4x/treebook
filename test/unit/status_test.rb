require 'test_helper'

class StatusTest < ActiveSupport::TestCase

	test "content must be entered" do
		status = Status.new

		assert !status.save
		assert !status.errors[:content].empty?
	end

	test "content is > 2 chars" do
		status = Status.new

		status.content = "H"
		assert !status.save
		assert !status.errors[:content].empty?
	end

	test "that status has a user id" do
		status = Status.new
		status.content = "Hello world"

		assert !status.save
		assert !status.errors[:user_id].empty?
	end
end
