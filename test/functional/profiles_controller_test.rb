require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do

  	#get the show action in *this controller,
  	#send in the profile name
    get :show, id: users(:javier).profile_name  #localhost:3000/javier //references fixtures/users
    assert_response :success
    assert_template 'profiles/show'             #making sure the correct template is being rendered
  end


  test "should render 404 not found" do
  	get :show, id: "doesnt ex"
  	assert_response :not_found
  end

  test "that vars are assigned correctly" do
    get :show, id: users(:javier).profile_name
  	assert assigns(:user)	                     #make sure instance vars in cotrollers are set 

  	assert_not_empty assigns(:statuses)
  end

  #added new user to :users and new status in :statueses by user
  test "only current user statues are shown" do
    get :show, id: users(:javier).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:javier), status.user #iterate through all statues && varify ownership
  	end
  end
end
