require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get world_wall" do
    get :world_wall
    assert_response :success
  end

  test "should get friend_activity" do
    get :friend_activity
    assert_response :success
  end

end
