require 'test_helper'

class MissionStatementTest < ActiveSupport::TestCase
  def setup 
    @user = users(:user1)
    @mission_statement = @user.mission_statements.build(content: "Lorem ipsum")
  end 
  
  test "should be valid" do 
    assert @mission_statement.valid? 
  end 
  
  test "user id should be present" do 
    @mission_statement.user_id = nil 
    assert_not @mission_statement.valid? 
  end

  test "order should be most recent first" do 
    assert_equal mission_statements(:most_recent), MissionStatement.first 
  end
end
