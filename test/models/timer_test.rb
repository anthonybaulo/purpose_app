require 'test_helper'

class TimerTest < ActiveSupport::TestCase
  def setup
    @user = users(:user1)
    @timer = @user.timers.build(name: "Title",
                                unit: "Lorem ipsum",
                                date: 5.days.from_now)
  end
 
  test "should be valid" do
    assert @timer.valid?
  end
 
  test "user id should be present" do
    @timer.user_id = nil
    assert_not @timer.valid?
  end

  test "order should be soonest first" do
    assert_equal timers(:soonest), Timer.first
  end
end
