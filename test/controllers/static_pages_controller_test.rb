require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Purpose App"
  end

  test "should get root without sign in" do
    get root_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should redirect without sign in" do
    paths = [help_path, about_path, contact_path]
    paths.each do |path|
      get path
      assert_redirected_to new_user_session_path
    end
  end
end

