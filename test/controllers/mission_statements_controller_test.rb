require 'test_helper'

class MissionStatementsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @mission_statement = mission_statements(:one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'MissionStatement.count' do
      post mission_statements_path, params: { mission_statement: { content: "Lorem ipsum" } }
    end
    assert_redirected_to new_user_session_path
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'MissionStatement.count' do
      delete mission_statement_path(@mission_statement)
    end
    assert_redirected_to new_user_session_path
  end
end
