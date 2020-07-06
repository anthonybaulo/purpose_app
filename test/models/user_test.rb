require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup 
    # TODO: create test for creating a new user with email confirmation
    # @new_user = User.new(email: "test@example.com", password: "foobar", 
    #                  password_confirmation: "foobar") 
    @user = users(:new_user)
  end
  
  test "associated mission_statements should be destroyed" do 
    @user.mission_statements.create!(content: "Lorem ipsum") 
    assert_difference 'MissionStatement.count', -1 do 
      @user.destroy 
    end 
  end

  test "associated timers should be destroyed" do 
    @user.timers.create!(name: "Lorem ipsum", 
                         unit: 'd', 
                         date: 2.days.from_now) 
    assert_difference 'Timer.count', -1 do 
      @user.destroy 
    end 
  end

  test "should follow and unfollow a user" do
    user1 = users(:user1)
    user2  = users(:user2)
    assert_not user1.following?(user2)
    user1.follow(user2)
    assert user1.following?(user2)
    assert user2.followers.include?(user1)
    user1.unfollow(user2)
    assert_not user1.following?(user2)
  end
end
