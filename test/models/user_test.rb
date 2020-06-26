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
end
