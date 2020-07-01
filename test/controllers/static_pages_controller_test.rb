require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # def setup
  #   @base_title = "Purpose App"
  # end

  test "should get static pages without sign in" do
    paths = [root_url, help_path, about_path, contact_path]
    paths.each do |path|
      get path
      assert_response :success
    end
  end
end

