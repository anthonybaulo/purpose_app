require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup 
    @user = User.new(email: "test@example.com", password: "foobar", 
                     password_confirmation: "foobar") 
  end
  
  test "associated mission_statements should be destroyed" do 
    @user.save 
    @user.mission_statements.create!(content: "Lorem ipsum") 
    assert_difference 'MissionStatement.count', -1 do 
      @user.destroy 
    end 
  end
end
