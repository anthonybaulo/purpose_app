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
    paths = [static_pages_help_url, static_pages_about_url, static_pages_contact_url]
    paths.each do |path|
      get path
      assert_redirected_to new_user_session_path
    end
  end
end

