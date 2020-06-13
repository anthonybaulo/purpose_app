require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  test "should redirect index without sign in" do
    get users_path
    assert_redirected_to new_user_session_path
  end

  test "should redirect show without sign in" do
    user = users(:user1)
    get user_path(user)
    assert_redirected_to new_user_session_path
  end

  # test "should get destroy with sign in" do
  #   get users_destroy_url
  #   assert_response :success
  # end

end
