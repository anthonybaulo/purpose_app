require 'test_helper'

class FollowingTest < ActionDispatch::IntegrationTest
  
  def setup
    @user1 = users(:user1)
    @user2 = users(:user2)
    sign_in(@user1)
  end

  test "should follow a user the standard way" do
    assert_difference '@user1.following.count', 1 do
      post relationships_path, params: { followed_id: @user2.id }
    end
  end

  test "should follow a user with Ajax" do
    assert_difference '@user1.following.count', 1 do
      post relationships_path, xhr: true, params: { followed_id: @user2.id }
    end
  end

  test "should unfollow a user the standard way" do
    @user1.follow(@user2)
    relationship = @user1.active_relationships.find_by(followed_id: @user2.id)
    assert_difference '@user1.following.count', -1 do
      delete relationship_path(relationship)
    end
  end

  test "should unfollow a user with Ajax" do
    @user1.follow(@user2)
    relationship = @user1.active_relationships.find_by(followed_id: @user2.id)
    assert_difference '@user1.following.count', -1 do
      delete relationship_path(relationship), xhr: true
    end
  end
end