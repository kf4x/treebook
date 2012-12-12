require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
	@status = statuses(:one)
  end

  test "should get index" do
	get :index
	assert_response :success
	assert_not_nil assigns(:statuses)
  end

  test "should be redirected when not logged in" do
	get :new
	assert_response :redirect
	assert_redirected_to new_user_session_path
  end

  test "shout render new page if logged in" do
	sign_in users(:javier)
	get :new
	assert_response :success
  end

  test "must be logged in to post status" do
	post :create, :status => {:content => "Hello"}
	assert_redirected_to new_user_session_path
  end

  test "should create status when logged in" do
	sign_in users(:javier)      #have to sign in user
	assert_difference('Status.count') do
	  post :create, status: { content: @status.content}
	end
	assert_redirected_to status_path(assigns(:status))
  end

  test "should create status for current user when logged in" do
	sign_in users(:javier)      #have to sign in user

	assert_difference('Status.count') do
	  post :create, status: { content: @status.content, user_id: users(:jim).id }   #trying to pass user_id as author of this status
	end

	assert_redirected_to status_path(assigns(:status))
	assert_equal assigns(:status).user_id, users(:javier).id                        #now make sure the signed in user's ID is the same
  end

  test "should show status" do
	get :show, id: @status
	assert_response :success
  end

  test "should get edit" do
	sign_in users(:javier)      #have to sign in user   
	get :edit, id: @status
	assert_response :success
  end
  
  test "should redirect to login if not signed in" do
	put :update, id: @status, status: { content: @status.content }
	assert_response :redirect
	assert_redirected_to new_user_session_path
  end

  test "should update status when logged in" do
	sign_in users(:javier)      #have to sign in user
	put :update, id: @status, status: { content: @status.content }
	assert_redirected_to status_path(assigns(:status))
  end

  test "should update status when current user is logged in" do
	sign_in users(:javier)      #have to sign in user
	put :update, id: @status, status: { content: @status.content, user_id: users(:jim).id }   #trying to pass user_id as updator of this status
	assert_redirected_to status_path(assigns(:status))
	assert_equal assigns(:status).user_id, users(:javier).id                                  #now make sure the signed in user's ID is the same
  end
  
  test "should not update status if nothing has changed" do
	sign_in users(:javier)      #have to sign in user
	put :update, id: @status
	assert_redirected_to status_path(assigns(:status))
	assert_equal assigns(:status).user_id, users(:javier).id                                  #now make sure the signed in user's ID is the same
  end

  test "should destroy status" do
	assert_difference('Status.count', -1) do
	  delete :destroy, id: @status
	end

	assert_redirected_to statuses_path
  end
end
